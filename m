Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB0FC02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 20:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93A6A42530;
	Thu, 23 Jan 2025 20:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCAJPOEzQO7v; Thu, 23 Jan 2025 20:52:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E2754253B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E2754253B;
	Thu, 23 Jan 2025 20:52:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F772959
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 20:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2030342530
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 20:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ow2IU-i8yZKH for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 20:52:27 +0000 (UTC)
X-Greylist: delayed 427 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 23 Jan 2025 20:52:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E06714253B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E06714253B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E06714253B
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 20:52:25 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id b44itBCOBH8pXb44it7XwV; Thu, 23 Jan 2025 21:45:16 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 23 Jan 2025 21:18:58 +0100
Message-Id: <20250123201858.111999-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDrH/xZQIZrvQCAI82uXMo/KkDxWIaKQk8QkPzkJhL6Qpx3H6Sk2oB8zfRZiRZ+p6aBCItnUAH31WRekuNfEoXsc9POn+fwZ287e8s5mZ4TAJ1o/ro/6
 X0+mrx4qddZ89ohUzU980A768wWDUurLY2tr/vnkdPXeOmo309VBRZ2FtxJBN9oK6qN2boWABvnkwzz0EKdsO3b7lfS6kiQFGMAbA8EPTj5pl45oAhzxYEU7
 FwWOC8fuYvirjOl+zwThD3hMC+AUEXDTj0hWayDXMU4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1737665116; bh=suQhI4L7jUFoo+oxSrYhIvkFa0oDlZ1jdppODX9UEtk=;
 h=From:To:Subject:Date:MIME-Version;
 b=H8l/6HaX4bANYuafC/9hiOJjzPrh52IcRldATvDHMOHVj8NlToJUksbD0RJDnVadF
 27+v7dt2n9nxENPH9kbs+b995q61pXJ1+ZFvt8rNckY2gBej1Ui/lIUowJE/XPib9Y
 BoKsgK0DQnAv0L8mdD4YpCyu4706fQ9agIZ4ioZhxGkCazd1XaO9RKDz8/WDBJfdQj
 tknnL/mRe29skjOScp9rwWMphFlWZ7DV8UPWuDDczZqeBWYQDVS1P5ZCMuk3pPLgdi
 Ae6uYBDT/jrwqyQAZxCwlfFxKV5UlhyMsFE9VkcxwBwvr/Uw9Jt+ctrbbk28r52Ylt
 OwWOmVZYFjXDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=H8l/6HaX
Subject: [Buildroot] [PATCH] package/swupdate: bump to securoty version
 2024.12.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix a high severity bug with the raw handler

For release note, see:
https://github.com/sbabic/swupdate/releases/tag/2024.12.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 847c5a1098..00e7d0b623 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  528c61769456d7740a9ba1d045f25f7587203e2a2e71a9a67998f0e13e2db149  swupdate-2024.12.tar.gz
+sha256  8470e9e0540d0e3299d8dd57b4a230f3b640dd4491e8ba705755d6bc75569832  swupdate-2024.12.1.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index fe6ef2dd6d..647a6f071b 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2024.12
+SWUPDATE_VERSION = 2024.12.1
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
