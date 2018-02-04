From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 16:20:38 +0100
Subject: [Buildroot] [git commit] ntp: explicitly enable openssl-random when
 crypto is enabled
Message-ID: <20180204152403.ABC8388351@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=905677cbd59fb0f9f56f207b63e1fa6e7c9167d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If OpenSSL is selected, --enable-openssl-random should be explicitly
enabled for consistency with the disable case.

[Peter: tweak commit text]
Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 74cf546988..cc363269c3 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -24,7 +24,7 @@ NTP_CONF_OPTS = \
 NTP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-NTP_CONF_OPTS += --with-crypto
+NTP_CONF_OPTS += --with-crypto --enable-openssl-random
 NTP_DEPENDENCIES += openssl
 else
 NTP_CONF_OPTS += --without-crypto --disable-openssl-random
