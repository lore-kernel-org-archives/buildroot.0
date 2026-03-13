Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EE1107BCF8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 772C360F40;
	Sat, 14 Mar 2026 07:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8Iy9JhYagfm; Sat, 14 Mar 2026 07:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA4A760F44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773474592;
	bh=sV0yoLxPoE+19c+oguszWYOR/2/Kl9vSQuv5MjmBKZI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YJBGx7mvwOaHoc5GSKRO40NBoP/doExk2u5H99hm/cBdq5CicaquayqwEu1PG60yX
	 xWmpL4qxyD3sJOuF+YEpdxpUmdsL6VIaaIDappWKcRSyCxpsqY5/saL/J95LGEKCGX
	 e6NHFuyRYhQAcVkBSUz4rJn+5EdjCDxeK9s//U8YI98UpFHqGZ1R6qqynjsD6oS97M
	 OPGHlcYJBFkdxyorRRLMxq3H+mWVpyLxC64OZQywTro2ncNbvuC0fl3OsowLZ089Ly
	 NzgACMuhP36SFQ43d0cYRKb0PQJH9LQIifFT8iBL1T0FUSoo5cV07C5nqv/ErsSE+L
	 s4AEAVkMxbIJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA4A760F44;
	Sat, 14 Mar 2026 07:49:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E7E52201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE1C0822C3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vP-eD0DUHc6r for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDAC3822C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDAC3822C4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:49:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F64E8514E; Sat, 14 Mar 2026 07:49:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:16:11 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: a3fa3e9cd79fcf1f4bb1706341d689ba72cbc7af
X-Git-Newrev: 40f1d20242bd594838c9a6133161a79a2ef3d0de
X-Patchwork-Hint: ignore
Message-Id: <20260314074936.2F64E8514E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python3: remove
 nis and ossaudiodev modules
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40f1d20242bd594838c9a6133161a79a2ef3d0de
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit df6e7a6664482da53c8a65a526e8dc3f5dd8aae2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy           |  8 ++++++++
 package/python3/Config.in  |  5 -----
 package/python3/python3.mk | 12 ++----------
 3 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a2a7b06a6d..302a11bab6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2026.02.1"
+
+config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
+	bool "python3 ossaudiodev module removed"
+	select BR2_LEGACY
+	help
+	  The ossaudiodev module was removed in Python 3.13.
+
 comment "Legacy options removed in 2026.02"
 
 config BR2_PACKAGE_QEMU_TARGET_CRIS
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
