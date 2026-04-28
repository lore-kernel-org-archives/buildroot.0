Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FEFFF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DF3283DA5;
	Tue, 28 Apr 2026 18:44:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzciEihOSA2e; Tue, 28 Apr 2026 18:44:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E73783DA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777401873;
	bh=Ds7YM0aSEgMnngURVwKIzhO8Q7fkqg9iHcFtN1oZVPg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IxdOG3zKSNXEcK07pKSH/y5YijlzYI+9FthCV2HHN1VwIM5IANsMRyxKUJZ5nl9Nh
	 lQU1kILVEKFly6ZdGqBFIVXGhIEjeCirGoRKzhgvHP+jwKpT+O3T3AEuZPojcuGu9l
	 41XiZ1GzBrOakJjrCXk/lcQ/hzQhdeTviw+CrceuPPK3CVDzBtbcZ3659eeeTjCFW8
	 KhrapvyiDSUVRoovwjzr5S2OKENP7jfHJ9WY7fl+IcJGrukTSFcucwGXvhM6x2uwpI
	 q9JrflFhajcmn1seSXU5UbbU+bNgybRP+i+FrC7JmwNesjh5Zgkw0s2tAGe/63h+q+
	 yxpwVjLXa2gLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E73783DA7;
	Tue, 28 Apr 2026 18:44:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C4A01B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EDFD40FE7
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bmTneRM2TnVl for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58A0B40E07
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58A0B40E07
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:44:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D2E183936; Tue, 28 Apr 2026 18:44:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 20:42:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09f18c31adc5438f0aae99a56791979d5fb48337
X-Git-Newrev: 3d3fc6fb9c1f564630a12218580396d230479bf9
X-Patchwork-Hint: ignore
Message-Id: <20260428184431.0D2E183936@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janus-gateway: bump version to
 1.4.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3d3fc6fb9c1f564630a12218580396d230479bf9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/meetecho/janus-gateway/blob/v1.4.1/CHANGELOG.md

Rebased patches, added Upstream: tag to patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                          |  1 -
 package/janus-gateway/0001-disable-ssp.patch                 | 12 ++++++------
 .../0002-Add-test-for-Wunused-but-set-variable.patch         | 12 ++++++------
 package/janus-gateway/janus-gateway.hash                     |  2 +-
 package/janus-gateway/janus-gateway.mk                       |  2 +-
 5 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 11f9e2384a..494de2a880 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -462,7 +462,6 @@ package/irqbalance/S13irqbalance Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch lib_patch.Upstream
 package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch lib_patch.Upstream
 package/iucode-tool/S00iucode-tool lib_sysv.Variables
-package/janus-gateway/0001-disable-ssp.patch lib_patch.Upstream
 package/kexec-lite/0001-clean-restart.patch lib_patch.Upstream
 package/keyutils/0001-fix-install-rule.patch lib_patch.Upstream
 package/keyutils/0002-cifs.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/janus-gateway/0001-disable-ssp.patch b/package/janus-gateway/0001-disable-ssp.patch
index 0c9b006ed9..6d3d8f6ccd 100644
--- a/package/janus-gateway/0001-disable-ssp.patch
+++ b/package/janus-gateway/0001-disable-ssp.patch
@@ -6,14 +6,14 @@ Subject: [PATCH] Do not force SSP usage
 The toolchain may not support SSP, so do not enforce its usage, let
 the package user pass the appropriate CFLAGS to enable SSP if needed.
 
+Upstream: https://github.com/meetecho/janus-gateway/pull/1801 (rejected)
+
 Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-(rebased against v0.1.0)
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(rebased against v1.4.1)
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 (rebased against v0.6.3)
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
-[Upstream status: rejected
-(https://github.com/meetecho/janus-gateway/pull/1801)]
 ---
  configure.ac | 1 -
  1 file changed, 1 deletion(-)
@@ -22,14 +22,14 @@ diff --git a/configure.ac b/configure.ac
 index 257ea8c..ca17a29 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -20,7 +20,6 @@ LT_INIT
+@@ -19,7 +19,6 @@ LT_INIT
  # Common CFLAGS
  CFLAGS="$CFLAGS \
  	-fPIC \
 -	-fstack-protector-all \
  	-fstrict-aliasing \
- 	-ggdb3 \
  	-pthread \
+ 	-Wall \
 -- 
 2.20.1
 
diff --git a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
index 4596577af3..7905bb8bf2 100644
--- a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
+++ b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
@@ -14,8 +14,8 @@ and uses it to detect if the -Wunused-but-set-variable option is
 supported, and only uses it in this case.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-(rebased against v0.1.0)
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(rebased against v1.4.1)
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 (rebased against v0.6.3)
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 [rebased against v1.0.3)
@@ -35,7 +35,7 @@ diff --git a/src/Makefile.am b/src/Makefile.am
 index 96d361e53be0..a8bfd17c930c 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -132,6 +132,7 @@ janus_CFLAGS = \
+@@ -134,6 +134,7 @@ janus_CFLAGS = \
  	-DEVENTDIR=\"$(eventdir)\" \
  	-DLOGGERDIR=\"$(loggerdir)\" \
  	-DCONFDIR=\"$(confdir)\" \
@@ -57,16 +57,16 @@ index c37c85b7ab06..5afe0ef0bbff 100644
  
  LT_PREREQ([2.2])
  LT_INIT
-@@ -65,8 +68,7 @@ cc*)
+@@ -63,8 +66,7 @@ cc*)
+ 	# Specific gcc flags
  	CFLAGS="$CFLAGS \
- 		-Wcast-align \
  		-Wno-override-init \
 -		-Wunsafe-loop-optimizations \
 -		-Wunused-but-set-variable"
 +		-Wunsafe-loop-optimizations"
  esac
  
- JANUS_VERSION=1102
+ JANUS_VERSION=1401
 diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
 new file mode 100644
 index 0000000..51df0c0
diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index a147a8afff..2683b32356 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f721d62a22b38ba3a341a5502f06b8b3a5a4f7bd0e9cc6c53de257fe99695e17  janus-gateway-1.1.2.tar.gz
+sha256  cba1e7aac44f4458701c5e14698e791a0eee13ecacbdacc71b4245716c442c08  janus-gateway-1.4.1.tar.gz
 sha256  91d04c97fa1da3fcd28205873276358aafc071c5b00a9ea8c49dd06d487a9dc6  COPYING
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 0b4db458f6..0c10cd751a 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = 1.1.2
+JANUS_GATEWAY_VERSION = 1.4.1
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,v$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPL-3.0 with OpenSSL exception
 JANUS_GATEWAY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
