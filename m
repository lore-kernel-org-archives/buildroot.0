Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22542C3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 19:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B404083C03;
	Wed,  7 May 2025 19:17:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9iL7bdK3CHLH; Wed,  7 May 2025 19:17:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E892C83C05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E892C83C05;
	Wed,  7 May 2025 19:17:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0F6D439
 for <buildroot@buildroot.org>; Wed,  7 May 2025 19:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F35C83BFD
 for <buildroot@buildroot.org>; Wed,  7 May 2025 19:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywg8PPVhHsOP for <buildroot@buildroot.org>;
 Wed,  7 May 2025 19:17:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.116;
 helo=smtpdh17-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 610C083C00
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 610C083C00
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 610C083C00
 for <buildroot@buildroot.org>; Wed,  7 May 2025 19:17:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id CkH0ulKMitfOnCkH0uokRM; Wed, 07 May 2025 21:17:42 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  7 May 2025 21:17:41 +0200
Message-Id: <20250507191741.2684629-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLfHPhOezBfThB9s+gbJwnwq6LJcLYAieuPM2G1XlM63EM4LNyGUBriLzjZnHSPpaOIHgT4csYQgYHB11YRut9H/8AmR6Bcj0nSt6QNi2Ef8YgKQygcC
 vpTIv6B/zp7GJIQoiLbGWabWXPWp7LWHdyv2h+5hLHLukjY4AwtLaxhG7WI0MCJUuNnG4bGNVQ0VTc1lmKZRDVl0m0Lq6e5xWk5CInowwrIrkn0xIM3CPkY4
 A9ddlsHB7Rm2DiBG9QX6cB0ePOON314nutiDfwQlHxk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1746645462; bh=VRF/e7WwAKgY8Mk51kgn0xacdF8IEfwPrJVRuHZcQT4=;
 h=From:To:Subject:Date:MIME-Version;
 b=ezuuL6ft6LKxjpeMOO5A6HnRaCYVQkKRiG6KqLa2jAKbZJXN+4y/0f4fmorH6pa0R
 p/5ZnREnRuIiGORXvIr03IMwFR1QWqjSaxNHSn0S0UaVNkldL2E00LdIlV2AbI9Ovi
 I0TyUpk4RrsCh4JutKzYV4vBE9htVqJZzNndt8LMbj9anvLZLfoPd2WMNCkSfDDybv
 K/XCfkVn8is0vru6GeGu6aLmbAkVbNdfawXuMPoYxenbC1vTBH08fTqczAK3dffat4
 YyiLDU+qzrUsN0sNsvppj1zL+S4HYo/2Ide+kEl6uxJo7RT/BhBT/uBJHPcNAmlbOY
 wR+egQCSeeiuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ezuuL6ft
Subject: [Buildroot] [PATCH] package/swupdate: bump to version 2025.05
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

For release note, see:
https://github.com/sbabic/swupdate/releases/tag/2025.05

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/swupdate/swupdate.hash | 2 +-
 package/swupdate/swupdate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 00e7d0b623..bc911d1820 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8470e9e0540d0e3299d8dd57b4a230f3b640dd4491e8ba705755d6bc75569832  swupdate-2024.12.1.tar.gz
+sha256  678b47fd2419727c4d0abf5c9f3bc0dc4b67e95951132bd1c8f5603e88947779  swupdate-2025.05.tar.gz
 sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
 sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
 sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 647a6f071b..05329d13b8 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2024.12.1
+SWUPDATE_VERSION = 2025.05
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
 SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1
 SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
