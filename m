From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 18:29:46 +0200
Subject: [Buildroot] [git commit] package/opusfile: add support for libressl
Message-ID: <20180402162949.6784C81502@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5c72c86baff42c869f6b0c264e01d53a80c10d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Opusfile builds fine with current libressl 2.7.2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
