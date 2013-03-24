From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:39 +0100
Subject: [Buildroot] [PATCH 15/22] libglib2: add dependency on host-gettext
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-16-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libglib2 requires msgfmt, which is now provided by host-gettext since
gettext will no longer be part of the mandatory dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.7.9.5
