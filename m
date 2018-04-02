From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 18:29:46 +0200
Subject: [Buildroot] [git commit] package/ntp: add support for libressl
Message-ID: <20180402162949.745B481502@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=779fc8e6848e8195c2f6570a05d274514e48cf79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ntp builds fine with current libressl 2.7.2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ntp/ntp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index b5e2c1e026..77bb33a42f 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -22,7 +22,7 @@ NTP_CONF_OPTS = \
 # 0002-ntp-syscalls-fallback.patch
 NTP_AUTORECONF = YES
 
-ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NTP_CONF_OPTS += --with-crypto --enable-openssl-random
 NTP_DEPENDENCIES += openssl
 else
