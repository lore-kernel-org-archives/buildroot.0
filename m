From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:01:40 +0100
Subject: [Buildroot] [git commit] package/openipmi: fix musl build
Message-ID: <20160207140148.3313B8010F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ac55e8a408170da01062380f230dd356a1c53aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build error is known upstream
http://sourceforge.net/p/openipmi/patches/26/
and was not yet caught by our autobuilders:

ui.c: In function ???get_ip_addr???:
ui.c:340:5: error: unknown type name ???u_int32_t???
     u_int32_t     addr;

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openipmi/openipmi.hash | 2 ++
 package/openipmi/openipmi.mk   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
index 3a40f60..e6fafe4 100644
--- a/package/openipmi/openipmi.hash
+++ b/package/openipmi/openipmi.hash
@@ -1,2 +1,4 @@
 # From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
 sha1 54f63ab7fe09f6a4b0b718601fe9c61014aa220b OpenIPMI-2.0.21.tar.gz
+# Locally computed
+sha256	0eafaa502ccf752899c5089159574081067d0c4ac53ea0ace33a5087f33ea32a	0001-ui-use-standard-uint32_t.patch
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 85bd6b4..4dd901b 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -7,6 +7,8 @@
 OPENIPMI_VERSION = 2.0.21
 OPENIPMI_SITE = http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
 OPENIPMI_SOURCE = OpenIPMI-2.0.21.tar.gz
+OPENIPMI_PATCH = \
+	http://sourceforge.net/p/openipmi/patches/26/attachment/0001-ui-use-standard-uint32_t.patch
 OPENIPMI_LICENSE = LGPLv2+, GPLv2+, BSD-3c
 OPENIPMI_LICENSE_FILES = COPYING.LIB COPYING COPYING.BSD
 OPENIPMI_DEPENDENCIES = popt ncurses host-pkgconf
