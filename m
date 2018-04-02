From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  2 Apr 2018 13:58:28 +0200
Subject: [Buildroot] [PATCH 3/4] package/opusfile: add support for libressl
In-Reply-To: <20180402115829.16778-1-bernd.kuhls@t-online.de>
References: <20180402115829.16778-1-bernd.kuhls@t-online.de>
Message-ID: <20180402115829.16778-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Opusfile builds fine with current libressl 2.7.2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/opusfile/opusfile.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 28d4368e85..186288ddff 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -11,8 +11,8 @@ OPUSFILE_LICENSE = BSD-3-Clause
 OPUSFILE_LICENSE_FILES = COPYING
 OPUSFILE_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-OPUSFILE_DEPENDENCIES += libopenssl
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+OPUSFILE_DEPENDENCIES += openssl
 else
 OPUSFILE_CONF_OPTS += --disable-http
 endif
-- 
2.14.2
