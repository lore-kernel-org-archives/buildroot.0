Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C49C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 21:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9401785586;
	Wed,  7 Feb 2024 21:48:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWogbLybwXSH; Wed,  7 Feb 2024 21:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C41FC85584
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C41FC85584;
	Wed,  7 Feb 2024 21:48:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B72A1BF3DF
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 21:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3A024EBF0
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 21:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emKfZrauqEeT for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 21:47:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 545144EBE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 545144EBE1
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 545144EBE1
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 21:47:33 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XplSrgAP7m8ALXplSruKVK; Wed, 07 Feb 2024 22:47:31 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 22:47:29 +0100
Message-Id: <20240207214729.115691-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCxDBV/yWv6daORpbbJlEJA8mOJCXZrXAUdrKoZ3oKtB+qDRQpQC5MgmquwAdA9Zf8Al8hqYD2hBo3tUflRxGjHpOb2eEprd/PFy3k9ziCLTjAlkMtUE
 f+qkO95pn2/JqFYkAR1Zm0IqspLaSAf+JNXu97QvqEKX08jjETEI3lHQ2IqrdoEYm2tJaJgI/0OTdKFBOPf8f4sZjqc8s9MK2GBi2ybvCllYQq70EgIpomP0
 GUjCiSSBlnYCfrzJyQ5vlJgVB3AXCld1uhb5PUQMCVCHnQj+0RGikB71+b6ygqvQEBnvRvUupW1oZnVm+EF2wA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707342451; bh=DLVc1TOl7njn3g0je90eJKq/VPJ2Wglt/lcVR6BB8L8=;
 h=From:To:Subject:Date:MIME-Version;
 b=BAJP1Mr4BZpkPDWXrBLQwGTDjtjQPtc11FviRnQ0eg5ZS0f9lTwKh/yARyN/f7qb0
 y64VSVaC2zqA+0/ohI6CTMGRBwGboelsPA5hm/W8UYnzNHdnzdxL07jKOfQDLuQ3T3
 KKNT3kWyldxkpkQq4zQyU17LmEoRJrbH7NIuK+2vPz/rjkH9H6u+2bvsNPS2SjtT4E
 EnJlzwIdPW2fKUWnblEI6+5u6dJhJa0vdBTYrCPqvkfJU4fgclNoLYLZ3LKE/pud1m
 0tIQ5xPR7r2in/2cGXJ/FlK/8EVtj7Z5MfMtxxYh/mTKzQAF8Ytn/MR6UKvDT3jQtb
 dTmYPyqZMUfOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=BAJP1Mr4
Subject: [Buildroot] [PATCH] package/rtl8188eu: bump to 2024-02-06 version
 on v5.2.2.4 branch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version allows to build with Linux 6.8

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index eb28e6cf0a..4f8f83e78c 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8cb10a047d39f13c776b0097ef1290f6b3c63590fd57bc0827e8638c878819f0  rtl8188eu-306f3e62cf7cddf8cee74f70f88a7a7b3af46f56.tar.gz
+sha256  507d32eb91d3d407c7758319c81a36a9dc69e2b89378cabcd382411153927b7b  rtl8188eu-f42fc9c45d2086c415dce70d3018031b54a7beef.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index 36a84d34de..eca0fb8007 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 306f3e62cf7cddf8cee74f70f88a7a7b3af46f56
+RTL8188EU_VERSION = f42fc9c45d2086c415dce70d3018031b54a7beef
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
