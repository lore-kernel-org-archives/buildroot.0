From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 May 2018 23:32:39 +0200
Subject: [Buildroot] [git commit branch/next] lttng-tools: Install to staging
Message-ID: <20180522213417.ACE02811F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3466298b0fa334e66050fede0629ad0f35baf21e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Install the LTTng control library headers and shared objects
to staging.

The C interface to LTTng described here:
https://lttng.org/docs/v2.10/#doc-liblttng-ctl-lttng
requires including <lttng/lttng.h> and linking against liblttng-ctl,
but those parts are not available unless this package does a staging
install.

Signed-off-by: John Faith <jfaith@impinj.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-tools/lttng-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 59f64cc404..0898f09549 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -7,6 +7,7 @@
 LTTNG_TOOLS_VERSION = 2.10.1
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
+LTTNG_TOOLS_INSTALL_STAGING = YES
 LTTNG_TOOLS_LICENSE = GPL-2.0+, LGPL-2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
 LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
