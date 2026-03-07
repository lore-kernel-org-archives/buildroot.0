Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205D2F55100
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 15:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB5FD814C4;
	Sat,  7 Mar 2026 15:57:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jTw9ywjBt7vU; Sat,  7 Mar 2026 15:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D493D81518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772899055;
	bh=jR5wnlfL/ycRyxVZYaldMRs4YP4SM5L2OPrK1RDs1Sw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dufRbaHBIXsZD7uLbhpZLkiKZliYuKlY+l/LzIZQ9FxOoK0zDJ1eOOEUStOvAMMC7
	 GjWaqmlqEk2WLU+/WBCuVjzpFcZAi1/xhAimhsDHLSj8XjkxtJ/QrHo0W6JETNw8u1
	 KDFooLg17dOMgrJ5H7RK+vOa6i478jc/laoutGQC52AL5pE32R5Ky9aH8pnTsETN39
	 0SNs07b5mjgFpUM0smRWME5OocDBoeDgK2uv5VyVKGfopXNRVnhiGTPegXRp+MehSH
	 JHOl8KHGmPC3Pskqzz/+a8e3d94aY00cxjg+aTMtd8kMCLMvx544GQXPckVYXlBkgB
	 tdkQ+9DUSdaqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D493D81518;
	Sat,  7 Mar 2026 15:57:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41EBD169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 15:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F40440781
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 15:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbFTGoh3739W for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 15:57:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73107400E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73107400E4
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 15:57:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6982E843A1; Sat,  7 Mar 2026 15:57:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 16:51:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3506c8a0f8d32ce7b6fcba517d5222eba7086799
X-Git-Newrev: df6e7a6664482da53c8a65a526e8dc3f5dd8aae2
X-Patchwork-Hint: ignore
Message-Id: <20260307155733.6982E843A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: remove nis and
 ossaudiodev modules
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/df6e7a6664482da53c8a65a526e8dc3f5dd8aae2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

These modules were dropped in Python 3.13 as per PEP 594.
The current version in Buildroot is 3.14.3.

- Remove the TODO and related config overrides in python3.mk.
- Remove BR2_PACKAGE_PYTHON3_OSSAUDIODEV from Config.in.
- Add BR2_PACKAGE_PYTHON3_OSSAUDIODEV to Config.in.legacy.

See [1] [2] [3].

[1] https://peps.python.org/pep-0594/
[2] https://github.com/python/cpython/commit/fc07fe4e37fbfd74e7130a20c13d0c07f0a5cff1
[3] https://github.com/python/cpython/commit/17e1fe0f9ba87eb170493daa0a4de207425195fd

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien:
 - add links in commit log
 - move legacy option in 2026.05 section
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy           |  6 ++++++
 package/python3/Config.in  |  5 -----
 package/python3/python3.mk | 12 ++----------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 494b153e4e..b85a147032 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
+	bool "python3 ossaudiodev module removed"
+	select BR2_LEGACY
+	help
+	  The ossaudiodev module was removed in Python 3.13.
+
 config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
 	bool "EDK2 OVMF IA32 removed"
 	select BR2_LEGACY
diff --git a/package/python3/Config.in b/package/python3/Config.in
index 423e5daabb..f9d3d3aaa2 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -76,11 +76,6 @@ config BR2_PACKAGE_PYTHON3_DECIMAL
 	help
 	  decimal module for Python3.
 
-config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
-	bool "ossaudiodev module"
-	help
-	  ossaudiodev module for Python3.
-
 config BR2_PACKAGE_PYTHON3_READLINE
 	bool "readline"
 	select BR2_PACKAGE_READLINE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a240349d3e..07cba7c02d 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -28,7 +28,6 @@ HOST_PYTHON3_CONF_OPTS += \
 # Make sure that LD_LIBRARY_PATH overrides -rpath.
 # This is needed because libpython may be installed at the same time that
 # python is called.
-# TODO: nis and ossaudiodev modules will be dropped in 3.13: https://peps.python.org/pep-0594/
 HOST_PYTHON3_CONF_ENV += \
 	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
 	py_cv_module_unicodedata=yes \
@@ -38,9 +37,7 @@ HOST_PYTHON3_CONF_ENV += \
 	py_cv_module__codecs_jp=n/a \
 	py_cv_module__codecs_kr=n/a \
 	py_cv_module__codecs_tw=n/a \
-	py_cv_module__uuid=n/a \
-	py_cv_module_nis=n/a \
-	py_cv_module_ossaudiodev=n/a
+	py_cv_module__uuid=n/a
 
 PYTHON3_DEPENDENCIES = host-python3 libffi
 
@@ -176,17 +173,12 @@ else
 PYTHON3_CONF_ENV += py_cv_module__zstd=n/a
 endif
 
-ifneq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
-PYTHON3_CONF_ENV += py_cv_module_ossaudiodev=n/a
-endif
-
 PYTHON3_CONF_ENV += \
 	ac_cv_have_long_long_format=yes \
 	ac_cv_buggy_getaddrinfo=no \
 	ac_cv_file__dev_ptmx=yes \
 	ac_cv_file__dev_ptc=yes \
-	ac_cv_working_tzset=yes \
-	py_cv_module_nis=n/a
+	ac_cv_working_tzset=yes
 
 # GCC is always compliant with IEEE754
 ifeq ($(BR2_ENDIAN),"LITTLE")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
