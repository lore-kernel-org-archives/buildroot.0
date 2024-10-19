Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B66D3C923
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 17:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB2EF40493;
	Sat, 19 Oct 2024 17:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTwWHnoSuO1p; Sat, 19 Oct 2024 17:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E06040403
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E06040403;
	Sat, 19 Oct 2024 17:55:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E83C27D7
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 17:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EE28400E0
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 17:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VK_zGgq1qRm2 for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 17:55:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07A7A400AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07A7A400AF
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 17:55:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E62FA85F92; Sat, 19 Oct 2024 17:55:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Oct 2024 19:50:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16ce77ad7d3a05addc1962b455242199a93f3811
X-Git-Newrev: d6e78796d2f35e3b753465f9250689a1cd0d8a4b
X-Patchwork-Hint: ignore
Message-Id: <20241019175518.E62FA85F92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: bump to version
 97813fb924edf822455f91a5fbbdfdb349e5984f
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d6e78796d2f35e3b753465f9250689a1cd0d8a4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luajit/0002-install-inc.patch | 2 +-
 package/luajit/luajit.hash            | 2 +-
 package/luajit/luajit.mk              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luajit/0002-install-inc.patch b/package/luajit/0002-install-inc.patch
index 163a5d36fc..eec77a5f82 100644
--- a/package/luajit/0002-install-inc.patch
+++ b/package/luajit/0002-install-inc.patch
@@ -14,4 +14,4 @@ Index: b/Makefile
 +INSTALL_DEFINC= $(DPREFIX)/include
  INSTALL_INC=   $(INSTALL_DEFINC)
  
- INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(MMVERSION)
+ export INSTALL_LJLIBD= $(INSTALL_SHARE)/luajit-$(MMVERSION)
diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index 54ae3f9931..eddd2a2419 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  346b028d9ba85e04b7e23a43cc51ec076574d2efc0d271d4355141b0145cd6e0  luajit-04dca7911ea255f37be799c18d74c305b921c1a6.tar.gz
+sha256  cbf1647acbd340c62b9c342dae43290762efa1b26d8bf8457f143fabf8ed86c7  luajit-97813fb924edf822455f91a5fbbdfdb349e5984f.tar.gz
 
 # Locally calculated
 sha256  1130331ac861a4b4520e9c8ad0814efdc6f1e79ea55ea9c460c73733d13ccb5f  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 951206b83f..301973db7e 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = 04dca7911ea255f37be799c18d74c305b921c1a6
+LUAJIT_VERSION = 97813fb924edf822455f91a5fbbdfdb349e5984f
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
