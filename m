Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7283107BCFF
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 08:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B35061066;
	Sat, 14 Mar 2026 08:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0czPOrelDXBs; Sat, 14 Mar 2026 08:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79EEC6100F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475221;
	bh=5NsLVb67vmoIgG6TrqdNv81gumLD0MQvdCboVg1ezpk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gI382hyR81FymBs/Dp/rqUh6F/+inwuIcNru7G5/hJwvIslq8ezHH3W9TEmnOtupL
	 +cXT3cyzvv84kW0x2LXLd16qLi+7eddKNtcdaMKlMOnID3TgiJEgXZu9qGx34EZ2Pn
	 12osQ67YQGFmNi8fAEBpm4p6ToxligyL8hGpIO1yHjK+OjSxny8r4WYhNv2vuyNW7I
	 5bRozWJNIhOIy89v8+BsGq/xmA5gO9OJ+6YgY1Ci78CbHkq2ThnBAYqm/TinbSGlbq
	 MpNlG/uLTFsoULxDv1a4FfRTJHtQPJwh0FR6TBVuBKGni7M4lIVEjSn+6zIPOXMrPn
	 9wNMuuLW60qZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79EEC6100F;
	Sat, 14 Mar 2026 08:00:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 582DF1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA0D9822CB
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrmgK3mciLXc for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 08:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E97AC822D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E97AC822D0
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 08:00:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EE9085EE5; Sat, 14 Mar 2026 08:00:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:14:33 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 149237d6d81c1e1badd1c3cc33454177bb75387a
X-Git-Newrev: 13241770277b4809c3633c6855a216f3ecbfaed4
X-Patchwork-Hint: ignore
Message-Id: <20260314080010.0EE9085EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python3: remove
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/13241770277b4809c3633c6855a216f3ecbfaed4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
 Config.in.legacy           |  6 ++++++
 package/python3/Config.in  |  5 -----
 package/python3/python3.mk | 12 ++----------
 3 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 50d7253221..c5bae47061 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11.3"
 
+config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
+	bool "python3 ossaudiodev module removed"
+	select BR2_LEGACY
+	help
+	  The ossaudiodev module was removed in Python 3.13.
+
 config BR2_PACKAGE_QEMU_TARGET_CRIS
 	bool "qemu cris support has been removed"
 	select BR2_LEGACY
diff --git a/package/python3/Config.in b/package/python3/Config.in
index cfc08bad86..a2d62af2c6 100644
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
index 8f7574347b..ccd6e06db3 100644
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
 
@@ -170,17 +167,12 @@ else
 PYTHON3_CONF_ENV += py_cv_module_zlib=n/a
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
