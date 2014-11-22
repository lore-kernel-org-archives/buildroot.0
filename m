From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Nov 2014 14:37:42 +0100
Subject: [Buildroot] [git commit] libllcp: needs host-pkgconf
Message-ID: <20141122133828.53DE97FD5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6dcfa5693eaccc99c2a7becba7eb5cbef846719
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

configure.ac uses PKG_CHECK_MODULES, so we need host-pkgconf.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libllcp/libllcp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libllcp/libllcp.mk b/package/libllcp/libllcp.mk
index 271daa9..e0dbb83 100644
--- a/package/libllcp/libllcp.mk
+++ b/package/libllcp/libllcp.mk
@@ -7,7 +7,7 @@
 LIBLLCP_VERSION = cf0c4b3c9df98851c6092c130192130c3f5a46bd
 LIBLLCP_SITE = https://libllcp.googlecode.com/git
 LIBLLCP_SITE_METHOD = git
-LIBLLCP_DEPENDENCIES = libnfc
+LIBLLCP_DEPENDENCIES = host-pkgconf libnfc
 # There's no ./configure in the repository, so we need to autoreconf
 LIBLLCP_AUTORECONF = YES
 LIBLLCP_INSTALL_STAGING = YES
