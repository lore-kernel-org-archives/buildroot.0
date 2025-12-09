Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1CFD4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9FAA842AB;
	Fri, 12 Dec 2025 07:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2nyfDwQDd9U; Fri, 12 Dec 2025 07:59:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5032843D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526350;
	bh=8bCYm5vz5qgpQyYZ1m7kKUOupwtZkevrvJGIefef0mw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CioL487uqX/If+e2qhvCIEtXkWFylfyuedvrGXMG4sOwprAZ6ENNx07E47yHTRVJE
	 vGDOt9SmBc3wG1AnF6hWrT8ZG6kY6ORj/XMN/O5igcfIAv/VRjKjwUb8VgHZBpZn1m
	 t30mCD5jd+23MH/bZr7t0rbDUft3qwsLa3slq1NhbDEltLw4vP7ne4j1/nDYirHZuY
	 1SNnPiNlwQfRQaO4WyXpvNPvojnPgjrdfCf9WTGf4mRo4SG3aBBEX4AHwwSr5CgAU/
	 m1PsEN3LHlz4KJ2MGi/xNTNL8mQX81dMGG4zox+k/Mxr0+tyV/UPveSg0c/GPphUCV
	 KS8sDrBG/akrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5032843D3;
	Fri, 12 Dec 2025 07:59:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD6D02C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35FB94117E
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVkcsSAMI_Pu for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A68B41126
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A68B41126
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19887807F9; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6565f494eda8edcf6dd9d38b857fafd35de2384
X-Git-Newrev: 7dd31d302133dd8fc5d6f44a42209fdb3573c51f
X-Patchwork-Hint: ignore
Message-Id: <20251212075539.19887807F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uhd: bump version to 4.9.0.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7dd31d302133dd8fc5d6f44a42209fdb3573c51f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/EttusResearch/uhd/releases

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...001-host-CMakeLists-add-boost-unit_test_framework-requir.patch | 8 +++++---
 package/uhd/uhd.hash                                              | 2 +-
 package/uhd/uhd.mk                                                | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch b/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
index 4c455d28fc..cdd4b6c64f 100644
--- a/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
+++ b/package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch
@@ -13,6 +13,8 @@ Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 [Fabrice: updated for 4.3.0.0]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: reverted (https://github.com/EttusResearch/uhd/commit/1a00949b19eaecb84af0f27c370400dc71a9fd84)]
+[Bernd: rebased for version 4.9.0.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  host/CMakeLists.txt | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
@@ -21,9 +23,9 @@ diff --git a/host/CMakeLists.txt b/host/CMakeLists.txt
 index 8f72ece76..a7731ffbd 100644
 --- a/host/CMakeLists.txt
 +++ b/host/CMakeLists.txt
-@@ -291,9 +291,12 @@ set(UHD_BOOST_REQUIRED_COMPONENTS
-     system
+@@ -323,9 +323,12 @@ set(UHD_BOOST_REQUIRED_COMPONENTS
      serialization
+     #system Boost.System is used, but explicitly listing it causes errors on some systems.
      thread
 -    unit_test_framework
  )
@@ -34,7 +36,7 @@ index 8f72ece76..a7731ffbd 100644
 +
  include(UHDBoost)
  
- include_directories(${Boost_INCLUDE_DIRS})
+ # Include boost headers as system headers to avoid compiler warnings from them.
 -- 
 2.26.2
 
diff --git a/package/uhd/uhd.hash b/package/uhd/uhd.hash
index 3282da2ec7..be79a138dd 100644
--- a/package/uhd/uhd.hash
+++ b/package/uhd/uhd.hash
@@ -1,5 +1,5 @@
 # Locally calculated:
-sha256  afe56842587ce72d6a57535a2b15c061905f0a039abcc9d79f0106f072a00d10  uhd-4.7.0.0.tar.gz
+sha256  0be26a139f23041c1fb6e9666d84cba839460e3c756057dc48dc067cc356a7bc  uhd-4.9.0.1.tar.gz
 sha256  94cc36ada2641d037980bf6c2418a750ac10a115ae11de5a5cda6177769dbd4c  LICENSE.md
 sha256  70bf7e79c8cd73a81f97ce81745ea0719a617eebe299a61868165daeae71fff2  host/LICENSE
 sha256  206adc03412b6c5b71b9c9df9c1f2e60e11833e89393877d5031fd11d332b1d4  fpga/usrp3/LICENSE.md
diff --git a/package/uhd/uhd.mk b/package/uhd/uhd.mk
index 52ea06a394..a05675b102 100644
--- a/package/uhd/uhd.mk
+++ b/package/uhd/uhd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHD_VERSION = 4.7.0.0
+UHD_VERSION = 4.9.0.1
 UHD_SITE = $(call github,EttusResearch,uhd,v$(UHD_VERSION))
 UHD_LICENSE = GPL-3.0+, LGPL-3.0+ (fpga/usrp3)
 UHD_LICENSE_FILES = LICENSE.md host/LICENSE fpga/usrp3/LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
