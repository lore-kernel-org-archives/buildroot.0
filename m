From: Romain Naour <romain.naour@openwide.fr>
Date: Mon,  2 Mar 2015 22:40:25 +0100
Subject: [Buildroot] [PATCH 2/2] Revert "libsrtp: openssl handling needs
	shared library support"
In-Reply-To: <1425332425-7034-1-git-send-email-romain.naour@openwide.fr>
References: <1425332425-7034-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1425332425-7034-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openssl handling has been fixed by the previous commit.

This reverts commit 67cebbdf5f349cc176037fa15c281a9462dae591.
---
 package/libsrtp/libsrtp.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index e5cf47b..5e62255 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -25,8 +25,7 @@ endif
 # host-pkgconf to make sure pkg-config is installed.
 LIBSRTP_DEPENDENCIES = host-pkgconf
 
-# openssl handling needs libdl support
-ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBSRTP_DEPENDENCIES += openssl
 LIBSRTP_CONF_OPTS += --enable-openssl
 else
-- 
1.9.3
