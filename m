Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45ACD3B98C
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BD618457C;
	Tue,  9 Dec 2025 18:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ib_Evcd3EBd6; Tue,  9 Dec 2025 18:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA99E845B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765304910;
	bh=3OR4Ye4xR3atF05pmv41zBeP7MljaBjtgIruGfCE68s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XnBxx8qwoODzVHfLkDXmiSL36wzoAQMLBq6Uoz85BmVawG9B9qY6GGUYzPBLWzs2H
	 clDSOnAKrmwe00BEplYUbQvtK9Wz+zI/rVFVmveiWawQ0scY9TMcB91hDZWQI5NRvm
	 QVRz9b1lY6CcmU2Ug7lsFdDpOnnaIiJ9flNMSwifIxp8S8Hx1hLHFyN/KzqZ5RL9M2
	 0CmJ1JhmoS9FG7csrwzjRNuBQcWwjDV22tBe21BcxLTS7kuNUUYLQmXN7IEmNn6AeK
	 iN1tXwtyphZ4moU3CPaGVaWkKvaLdcZJBg+3tazhfzSP9Z+ntG5370XPIC9XXxgTQ4
	 zHsW1VQpxvX1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA99E845B6;
	Tue,  9 Dec 2025 18:28:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8CA0237
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0130407FC
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhA096unnViK for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E74964081F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E74964081F
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4A1E86963; Tue,  9 Dec 2025 18:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Dec 2025 19:24:58 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b6565f494eda8edcf6dd9d38b857fafd35de2384
X-Git-Newrev: 7dd31d302133dd8fc5d6f44a42209fdb3573c51f
X-Patchwork-Hint: ignore
Message-Id: <20251209182817.E4A1E86963@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uhd: bump version to
 4.9.0.1
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
