From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:50:01 +0100
Subject: [Buildroot] [git commit] libglib2: add dependency on host-gettext
Message-ID: <20130324130052.1FC359B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5ade38d78f0e7e62908be25557f86613e7b973b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libglib2 requires msgfmt, which is now provided by host-gettext since
gettext will no longer be part of the mandatory dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libglib2/libglib2.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 4ca6ca3..d78e8ec 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -68,9 +68,9 @@ HOST_LIBGLIB2_CONF_OPT = \
 
 LIBGLIB2_CONF_OPT += --disable-tests
 
-LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext)
+LIBGLIB2_DEPENDENCIES = host-pkgconf host-libglib2 libffi zlib $(if $(BR2_NEEDS_GETTEXT),gettext) host-gettext
 
-HOST_LIBGLIB2_DEPENDENCIES = host-pkgconf host-libffi host-zlib
+HOST_LIBGLIB2_DEPENDENCIES = host-pkgconf host-libffi host-zlib host-gettext
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 LIBGLIB2_DEPENDENCIES += libiconv
