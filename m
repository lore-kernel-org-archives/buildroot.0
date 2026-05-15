Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40136CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 162878561F;
	Tue,  9 Jun 2026 13:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HK63OSnSdP4c; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CEA7855F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010100;
	bh=btzQGDYvvXTbobmo+2wPlVqshEWmVgwsELAbheVxmAg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZK6JZZmPhrANeQgVA0mzXZK4FwcmiKllD7q242tXGY5eLa6cu4hVuSBCYr58fvESB
	 Ox/hchpRaRzPKhpBnx3q+o6wFwv3/PZvddtuyP2/pg1B/TERs7qT5+bXh0UrmQvLR+
	 FjNlcQc5KKiyVIpZlSm6X1zG3awoORAIVb8v/xN2EwxVvmblTDqyKw1WddPKxw1icZ
	 woegDJO8Jr7H8tKJXK5p3J9W+CxD9UJDcWPaRRyFwZKN3noiQO1/0tzElZK7BXbLEJ
	 Bgnq2yj/njcyrK4LvzGybGWttmpcu0qAm9oz/8gShw1d2oTY/+8x/VP4AxapHMBS4A
	 cQNnAWHo7+7LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CEA7855F7;
	Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C264324
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5D7340DA8
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvOPshuKnRRE for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07EC640FE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07EC640FE0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 367B087E7E; Tue,  9 Jun 2026 13:01:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:12:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e125a47fabaf87de1730dcc7ec0f1f0283b49801
X-Git-Newrev: 1254fd5c0e90d666abdb6daf60331d4afe065709
X-Patchwork-Hint: ignore
Message-Id: <20260609130107.367B087E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lm-sensors: bump version to 3.6.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1254fd5c0e90d666abdb6daf60331d4afe065709
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/lm-sensors/lm-sensors/blob/V3-6-2/CHANGES

Removed patch 0002 which is included in this release:
https://github.com/lm-sensors/lm-sensors/commit/e31cb3b2f8fa5f0a7a61b9bca919bb54e7c89eea

Rebased and renumbered remaining patch.

Updated license hash due to upstream commit
https://github.com/lm-sensors/lm-sensors/commit/6128b9e8eb58d6a12d4c8a8d6a635a3f066a0127

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  3 +-
 ...-ldconfig.patch => 0001-no-host-ldconfig.patch} |  6 +-
 package/lm-sensors/0001-static-build.patch         | 81 ----------------------
 package/lm-sensors/lm-sensors.hash                 |  4 +-
 package/lm-sensors/lm-sensors.mk                   |  2 +-
 5 files changed, 8 insertions(+), 88 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b2d5320045..3f6cdff263 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -567,8 +567,7 @@ package/lirc-tools/0002-configure-add-disable-doc-option.patch lib_patch.Upstrea
 package/lirc-tools/S25lircd lib_sysv.Indent lib_sysv.Variables
 package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch lib_patch.Upstream
 package/lldpd/S60lldpd Shellcheck lib_sysv.Indent lib_sysv.Variables
-package/lm-sensors/0001-static-build.patch lib_patch.Upstream
-package/lm-sensors/0002-no-host-ldconfig.patch lib_patch.Upstream
+package/lm-sensors/0001-no-host-ldconfig.patch lib_patch.Upstream
 package/lmbench/0001-scripts-build-use-bin-bash-as-shell.patch lib_patch.Upstream
 package/lmbench/0002-src-Makefile-add-lmbench-to-list-of-executables.patch lib_patch.Upstream
 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch lib_patch.Upstream
diff --git a/package/lm-sensors/0002-no-host-ldconfig.patch b/package/lm-sensors/0001-no-host-ldconfig.patch
similarity index 86%
rename from package/lm-sensors/0002-no-host-ldconfig.patch
rename to package/lm-sensors/0001-no-host-ldconfig.patch
index 51f7f6af01..24858624ed 100644
--- a/package/lm-sensors/0002-no-host-ldconfig.patch
+++ b/package/lm-sensors/0001-no-host-ldconfig.patch
@@ -10,14 +10,16 @@ need to link against a separate library. Therefore, this patch simply
 removes the libiconv handling.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[Bernd: rebased for 3.6.2]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 
 Index: b/prog/sensors/Module.mk
 ===================================================================
 --- a/prog/sensors/Module.mk
 +++ b/prog/sensors/Module.mk
-@@ -37,10 +37,8 @@
- REMOVESENSORSBIN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(BINDIR)/%,$(PROGSENSORSTARGETS))
+@@ -39,10 +39,8 @@
  REMOVESENSORSMAN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(PROGSENSORSMAN1DIR)/%,$(PROGSENSORSMAN1FILES))
+ REMOVESENSORSZSH := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(ZSHCOMPDIR)/%,$(PROGSENSORSZSHCOMPFILES))
  
 -LIBICONV := $(shell if /sbin/ldconfig -p | grep -q '/libiconv\.so$$' ; then echo \-liconv; else echo; fi)
 -
diff --git a/package/lm-sensors/0001-static-build.patch b/package/lm-sensors/0001-static-build.patch
deleted file mode 100644
index 63edd44f84..0000000000
--- a/package/lm-sensors/0001-static-build.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Add support for static only build
-
-This patch adds support for a BUILD_SHARED_LIB variable that allows to
-enable/disable the build of the shared library, in order to support
-static-only builds.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -85,6 +85,9 @@
- # Build and install static library
- BUILD_STATIC_LIB := 1
- 
-+# Build and install shared library
-+BUILD_SHARED_LIB := 1
-+
- # Set these to add preprocessor or compiler flags, or use
- # environment variables
- # CFLAGS :=
-Index: b/lib/Module.mk
-===================================================================
---- a/lib/Module.mk
-+++ b/lib/Module.mk
-@@ -43,8 +43,14 @@
- LIBSTLIBNAME := libsensors.a
- LIBSHSONAME := libsensors.so.$(LIBMAINVER)
- 
-+ifeq ($(BUILD_SHARED_LIB),1)
- LIBTARGETS := $(MODULE_DIR)/$(LIBSHLIBNAME) \
-               $(MODULE_DIR)/$(LIBSHSONAME) $(MODULE_DIR)/$(LIBSHBASENAME)
-+LIBDEP_FOR_PROGS := $(LIBSHBASENAME)
-+else
-+LIBDEP_FOR_PROGS := $(LIBSTLIBNAME)
-+endif
-+
- ifeq ($(BUILD_STATIC_LIB),1)
- LIBTARGETS += $(MODULE_DIR)/$(LIBSTLIBNAME)
- endif
-@@ -131,9 +137,11 @@
- ifeq ($(BUILD_STATIC_LIB),1)
- 	$(INSTALL) -m 644 $(LIB_DIR)/$(LIBSTLIBNAME) $(DESTDIR)$(LIBDIR)
- endif
-+ifeq ($(BUILD_SHARED_LIB),1)
- 	$(INSTALL) -m 755 $(LIB_DIR)/$(LIBSHLIBNAME) $(DESTDIR)$(LIBDIR)
- 	$(LN) $(LIBSHLIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBSHSONAME)
- 	$(LN) $(LIBSHSONAME) $(DESTDIR)$(LIBDIR)/$(LIBSHBASENAME)
-+endif
- 	@if [ -z "$(DESTDIR)" -a "$(LIBDIR)" != "/usr/lib" -a "$(LIBDIR)" != "/lib" ] ; then \
- 	   if [ -e "/usr/lib/$(LIBSHSONAME)" -o -e "/usr/lib/$(LIBSHBASENAME)" ] ; then \
- 	     echo '******************************************************************************' ; \
-Index: b/prog/sensord/Module.mk
-===================================================================
---- a/prog/sensord/Module.mk
-+++ b/prog/sensord/Module.mk
-@@ -41,7 +41,7 @@
- REMOVESENSORDBIN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(SBINDIR)/%,$(PROGSENSORDTARGETS))
- REMOVESENSORDMAN := $(patsubst $(MODULE_DIR)/%,$(DESTDIR)$(PROGSENSORDMAN8DIR)/%,$(PROGSENSORDMAN8FILES))
- 
--$(PROGSENSORDTARGETS): $(PROGSENSORDSOURCES:.c=.ro) lib/$(LIBSHBASENAME)
-+$(PROGSENSORDTARGETS): $(PROGSENSORDSOURCES:.c=.ro) lib/$(LIBDEP_FOR_PROGS)
- 	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORDSOURCES:.c=.ro) -Llib -lsensors -lrrd
- 
- all-prog-sensord: $(PROGSENSORDTARGETS)
-Index: b/prog/sensors/Module.mk
-===================================================================
---- a/prog/sensors/Module.mk
-+++ b/prog/sensors/Module.mk
-@@ -39,8 +39,8 @@
- 
- LIBICONV := $(shell if /sbin/ldconfig -p | grep -q '/libiconv\.so$$' ; then echo \-liconv; else echo; fi)
- 
--$(PROGSENSORSTARGETS): $(PROGSENSORSSOURCES:.c=.ro) lib/$(LIBSHBASENAME)
--	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORSSOURCES:.c=.ro) $(LIBICONV) -Llib -lsensors
-+$(PROGSENSORSTARGETS): $(PROGSENSORSSOURCES:.c=.ro) lib/$(LIBDEP_FOR_PROGS)
-+	$(CC) $(EXLDFLAGS) -o $@ $(PROGSENSORSSOURCES:.c=.ro) $(LIBICONV) -Llib -lsensors -lm
- 
- all-prog-sensors: $(PROGSENSORSTARGETS)
- user :: all-prog-sensors
diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
index 0ca07b7e69..9ffbe1a32f 100644
--- a/package/lm-sensors/lm-sensors.hash
+++ b/package/lm-sensors/lm-sensors.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3-6-0.tar.gz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  c6a0587e565778a40d88891928bf8943f27d353f382d5b745a997d635978a8f0  lm-sensors-3-6-2.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 8975efaffa..1de826dba0 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LM_SENSORS_VERSION = 3-6-0
+LM_SENSORS_VERSION = 3-6-2
 LM_SENSORS_SITE = $(call github,lm-sensors,lm-sensors,V$(LM_SENSORS_VERSION))
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
