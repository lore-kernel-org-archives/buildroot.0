Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22163CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59FC685EAC;
	Tue,  9 Jun 2026 13:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLm6GXgV-w1l; Tue,  9 Jun 2026 13:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DF8A85EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010368;
	bh=Hkh/RcALiKcY+2VcCAe+ndL2oqBVePQHHjqQPLnD3bI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kHYThDAtHb/kwbnPFkcHkJi6xj1u7mUvRwfEpM8UBQJQhcPTJptEuAx5cxuH/Tsqj
	 q4kaRS44xuO77Lx+LDICUAiJHHl/Xahgy2zNTEDTI3xyhv2tDMBNohrcfXbO0UcF+4
	 EB5CE+aVDwDaQ7BJdvlWnxqX0V2p4cxuZyAIyTGDhkCt8XY2h/Cf3KWiFScQv992rm
	 133icFd4yuLcUa0quijjUO23os3UjQeMymHB+HYia07619GMrcrz7zKFsjH+VE1n31
	 OF/OAWxO3Ms6XKlsSs1KxhHWrOY5bDA8em2qOV1xpuq7vTwwZD+kQ9F5SxVzqibudQ
	 EhLY8NHUDn4HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DF8A85EA1;
	Tue,  9 Jun 2026 13:06:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2029190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 671F5426F5
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1m81A2KCRYr for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3126742701
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3126742701
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D89087E86; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:53:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b20c9b35681904579c11130bdbe1a9203c0eae77
X-Git-Newrev: 69060189f37c4a1a286c8e6120fad2ea9383d9a7
X-Patchwork-Hint: ignore
Message-Id: <20260609130126.6D89087E86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 26.2.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69060189f37c4a1a286c8e6120fad2ea9383d9a7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/media-driver/releases/tag/intel-media-26.2.1

Rebased patch due to upstream commit:
https://github.com/intel/media-driver/commit/ec210a9255e9177b571da4a42c907bd36ab63744

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...n-Update-cmake_minimum_required-to-3.5-co.patch | 28 ++--------------------
 package/intel-mediadriver/intel-mediadriver.hash   |  2 +-
 package/intel-mediadriver/intel-mediadriver.mk     |  2 +-
 3 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch b/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
index 6d0d972be0..7a2a2ee78f 100644
--- a/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
+++ b/package/intel-mediadriver/0001-Media-Common-Update-cmake_minimum_required-to-3.5-co.patch
@@ -11,6 +11,8 @@ This supports the compilation with cmake-4.0.0
 Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 Upstream: https://github.com/intel/media-driver/pull/1919
+[Bernd: rebased for version 26.2.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Tools/MediaDriverTools/GenDmyHex/CMakeLists.txt          | 2 +-
  Tools/MediaDriverTools/GenKrnBin/CMakeLists.txt          | 2 +-
@@ -91,19 +93,6 @@ index af622be19..40e4eba17 100644
  
  project(KrnToHex_IGA)
  
-diff --git a/cmrtlib/CMakeLists.txt b/cmrtlib/CMakeLists.txt
-index 9ecb1e4e1..54f907b37 100644
---- a/cmrtlib/CMakeLists.txt
-+++ b/cmrtlib/CMakeLists.txt
-@@ -19,7 +19,7 @@
- # OTHER DEALINGS IN THE SOFTWARE.
- 
- set(BUILD_ALL $ENV{BUILD_ALL})
--cmake_minimum_required(VERSION 2.8)
-+cmake_minimum_required(VERSION 3.5)
- project(CM_RT)
- add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/linux)
- 
 diff --git a/cmrtlib/linux/CMakeLists.txt b/cmrtlib/linux/CMakeLists.txt
 index b066138d9..df02bab2a 100644
 --- a/cmrtlib/linux/CMakeLists.txt
@@ -169,19 +158,6 @@ index 6b1f74335..bba044a97 100644
  
  project(devult)
  
-diff --git a/os_release_info.cmake b/os_release_info.cmake
-index b4a84e2c5..a3b879d85 100644
---- a/os_release_info.cmake
-+++ b/os_release_info.cmake
-@@ -29,7 +29,7 @@ set(_os_release_info TRUE)
- # of the local cmake environment.
- 
- # Set cmake policies for at least this level:
--cmake_minimum_required(VERSION 2.8.12)
-+cmake_minimum_required(VERSION 3.5)
- 
- 
- # Function get_os_release_info - Determine and return OS name and version
 -- 
 2.34.1
 
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index bbdd3eedd9..a5d012dc2e 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  32f984333d0804ec8f784f25cf443499ee86074a7da7791483d9a9afbfa97c74  intel-media-26.2.0.tar.gz
+sha256  65bc05de32869ed73bcc6e7275d425987adfff792152565440f45d6b54fe1b9d  intel-media-26.2.1.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 61d8dd408d..2cc7372342 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.2.0
+INTEL_MEDIADRIVER_VERSION = 26.2.1
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
