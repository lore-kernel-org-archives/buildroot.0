Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC05D2444F
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ECE2413DB;
	Thu, 10 Oct 2024 21:31:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vjbt3uEDoIHE; Thu, 10 Oct 2024 21:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F07E413A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F07E413A1;
	Thu, 10 Oct 2024 21:31:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18BAF1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 512C94057A
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGEKGGve76h7 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DCD44116F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DCD44116F
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 896D385C59; Thu, 10 Oct 2024 21:30:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:17:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 563196258a7cfef14ac0ef732663f639b63aa9f2
X-Git-Newrev: 67743caf8142b21da2059a7271bcbc447fe2da1c
X-Patchwork-Hint: ignore
Message-Id: <20241010213042.896D385C59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fire: bump to version 0.7.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=67743caf8142b21da2059a7271bcbc447fe2da1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fire/Config.in        | 1 -
 package/python-fire/python-fire.hash | 4 ++--
 package/python-fire/python-fire.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-fire/Config.in b/package/python-fire/Config.in
index 9c816b0fd0..0d5787044c 100644
--- a/package/python-fire/Config.in
+++ b/package/python-fire/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_FIRE
 	bool "python-fire"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TERMCOLOR # runtime
 	help
 	  A library for automatically generating command line
diff --git a/package/python-fire/python-fire.hash b/package/python-fire/python-fire.hash
index f58b5d633f..375b5c8c03 100644
--- a/package/python-fire/python-fire.hash
+++ b/package/python-fire/python-fire.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fire/json
-md5  4b63d0465633a5683b656342980e153e  fire-0.6.0.tar.gz
-sha256  54ec5b996ecdd3c0309c800324a0703d6da512241bc73b553db959d98de0aa66  fire-0.6.0.tar.gz
+md5  4f2da2e8111c45e60b8806529949fda0  fire-0.7.0.tar.gz
+sha256  961550f07936eaf65ad1dc8360f2b2bf8408fad46abbfa4d2a3794f8d2a95cdf  fire-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a5de77b62266bca0bb97bf058992f0b0f308a83a8ca55ee10fbf6bd8ed8f7ed0  LICENSE
diff --git a/package/python-fire/python-fire.mk b/package/python-fire/python-fire.mk
index 8ca0fa84ed..4318707321 100644
--- a/package/python-fire/python-fire.mk
+++ b/package/python-fire/python-fire.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FIRE_VERSION = 0.6.0
+PYTHON_FIRE_VERSION = 0.7.0
 PYTHON_FIRE_SOURCE = fire-$(PYTHON_FIRE_VERSION).tar.gz
-PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/1b/1b/84c63f592ecdfbb3d77d22a8d93c9b92791e4fa35677ad71a7d6449100f8
+PYTHON_FIRE_SITE = https://files.pythonhosted.org/packages/6b/b6/82c7e601d6d3c3278c40b7bd35e17e82aa227f050aa9f66cb7b7fce29471
 PYTHON_FIRE_SETUP_TYPE = setuptools
 PYTHON_FIRE_LICENSE = Apache-2.0
 PYTHON_FIRE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
