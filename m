Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A43FC72C4
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 16:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E3E860FFE;
	Sun, 22 Mar 2026 16:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5s6zdszaWTa; Sun, 22 Mar 2026 16:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A11161017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774197917;
	bh=2UeNDuC7Ps55N0+mFKTC8gMuvqmlAmeEod0i/KCdYcI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hPrxKQIcfaSnyFDnkDP1YzdRygWx0jcFa7WXtE6653W2cHl3dyT//l/sdZJfbaPjy
	 9n83gWFOddi4OdC7d0I5ibM6eKH5OyVlYIbHKXcbDbq1p7XSD8W6vYcEdXKMOlJgr8
	 uyb38ryplvcrpyU2ejxtw3t9FU1+yBqWnp2aSvDQUvFJqlALGUY7PiX8lnOpYYzoeQ
	 iAOUwvsfG6F2rr1sDXa2KBx/3lGBHE93cyr3TIVAxHduY9cbhaiiBVTzQNnm1AL33M
	 3qhi6XUFG9Ixib9bkT5sXu9ztDl2oeflxOZScIMASFU/98SI72dgkBDhBFAczVE/Ea
	 HMRB6UOrlaFAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A11161017;
	Sun, 22 Mar 2026 16:45:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94222353
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 16:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A2B640485
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 16:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opsd1mFknNYt for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 16:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95B4F4004D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95B4F4004D
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 16:45:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C43B84C9A; Thu, 19 Mar 2026 20:57:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Mar 2026 21:45:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67e982e782d069cdfc3fc25c412c68f78054c760
X-Git-Newrev: 039c1ae13ec12f7cebddf86f37080d0a1fee28e6
X-Patchwork-Hint: ignore
Message-Id: <20260319205709.5C43B84C9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ndctl: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/039c1ae13ec12f7cebddf86f37080d0a1fee28e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

A "device memory" enabling project encompassing tools and
libraries for CXL, NVDIMMs, DAX, memory tiering and other
platform memory device topics.

ndctl is using __struct_group() [1] which was introduced in
kernel headers in upstream commit [2], first included in v5.16.
The commit [2] was backported in v5.15.54 in [3] and v5.10.156
in [4]. Therefore, this commits sets the minimal toolchain headers
version requirement to 5.10.

[1] https://github.com/pmem/ndctl/blob/v83/cxl/fwctl/features.h#L108
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=50d7bd38c3aafc4749e05e8d7fcb616979143602
[3] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=d57ab893cdf8046cbe4d49746f9418020f788b1f
[4] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9fd7bdaffe0e89833f4b1c1d3abd43023e951ec1

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
[Julien:
  - add commit log info about __struct_group()
  - add __struct_group() comment in Config.in
  - relax toolchain headers requirements to 5.10
  - sort BR2_PACKAGE_ blocks in .mk alphabetically
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in        |  1 +
 package/ndctl/Config.in  | 25 ++++++++++++++++++++++++
 package/ndctl/ndctl.hash |  7 +++++++
 package/ndctl/ndctl.mk   | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 84 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d7791bdd3d..b98a89abdb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2838,6 +2838,7 @@ menu "System tools"
 	source "package/monit/Config.in"
 	source "package/multipath-tools/Config.in"
 	source "package/ncdu/Config.in"
+	source "package/ndctl/Config.in"
 	source "package/nerdctl/Config.in"
 	source "package/netifrc/Config.in"
 	source "package/numactl/Config.in"
diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
new file mode 100644
index 0000000000..9f7f5f1c9b
--- /dev/null
+++ b/package/ndctl/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_NDCTL
+	bool "ndctl"
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 # __struct_group()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_INIPARSER
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_KEYUTILS
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  A "device memory" enabling project encompassing tools and
+	  libraries for CXL, NVDIMMs, DAX, memory tiering and other
+	  platform memory device topics.
+
+	  https://github.com/pmem/ndctl
+
+comment "ndctl needs udev /dev management, a toolchain headers >= 5.10"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
diff --git a/package/ndctl/ndctl.hash b/package/ndctl/ndctl.hash
new file mode 100644
index 0000000000..f731fb7263
--- /dev/null
+++ b/package/ndctl/ndctl.hash
@@ -0,0 +1,7 @@
+# locally computed
+sha256  dd4b9b9a9dc0a15e980670b6f889e910a80ad60f2309e03bfd9cc6071d14dd30  ndctl-83.tar.gz
+sha256  1334f22048052d69647860fe9fb24997dc3b33737cb494297d68949f589fa1cf  COPYING
+sha256  5c37e41135091a39821cfb306ad8516625b0bb49510ce56ad85c347bbc46df29  LICENSES/other/CC0-1.0
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/other/MIT
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSES/preferred/GPL-2.0
+sha256  9397d01be0ec93d29384447ba18e532ab7b01af8c8b582ece9f10ad45b9568db  LICENSES/preferred/LGPL-2.1
diff --git a/package/ndctl/ndctl.mk b/package/ndctl/ndctl.mk
new file mode 100644
index 0000000000..ceb01d633f
--- /dev/null
+++ b/package/ndctl/ndctl.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# ndctl
+#
+################################################################################
+
+NDCTL_VERSION = 83
+NDCTL_SITE = $(call github,pmem,ndctl,v$(NDCTL_VERSION))
+NDCTL_LICENSE = \
+	CC0-1.0 (helper routines), \
+	GPL-2.0+ (tools), \
+	LGPL-2.1+ (libraries), \
+	MIT (helper routines)
+NDCTL_LICENSE_FILES = \
+	COPYING \
+	LICENSES/other/CC0-1.0 \
+	LICENSES/other/MIT \
+	LICENSES/preferred/GPL-2.0 \
+	LICENSES/preferred/LGPL-2.1
+
+NDCTL_DEPENDENCIES = \
+	iniparser \
+	json-c \
+	keyutils \
+	kmod \
+	udev \
+	util-linux-libs
+
+# Currently, disabling keyutils or fwctl support will cause builds to
+# fail. Therefore, always pass the -Dfwctl=enabled and -Dkeyutils=enabled.
+NDCTL_CONF_OPTS = \
+	-Ddocs=disabled \
+	-Dfwctl=enabled \
+	-Dkeyutils=enabled \
+	-Diniparserdir=$(STAGING_DIR)/usr/include/iniparser
+
+ifeq ($(BR2_PACKAGE_LIBTRACEFS)$(BR2_PACKAGE_LIBTRACEEVENT),yy)
+NDCTL_CONF_OPTS += -Dlibtracefs=enabled
+NDCTL_DEPENDENCIES += libtraceevent libtracefs
+else
+NDCTL_CONF_OPTS += -Dlibtracefs=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+NDCTL_CONF_OPTS += -Dsystemd=enabled
+NDCTL_DEPENDENCIES += systemd
+else
+NDCTL_CONF_OPTS += -Dsystemd=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
