From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 21:28:49 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] ntp: explicitly enable
 openssl-random when crypto is enabled
Message-ID: <20180410205255.45CDF88398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96828612b218ddb3d74a4ba8fe25fac3c43cf80e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

If OpenSSL is selected, --enable-openssl-random should be explicitly
enabled for consistency with the disable case.

[Peter: tweak commit text]
Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 905677cbd59fb0f9f56f207b63e1fa6e7c9167d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 4eff482c4e..535e89ff72 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -24,7 +24,7 @@ NTP_CONF_OPTS = \
 NTP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-NTP_CONF_OPTS += --with-crypto
+NTP_CONF_OPTS += --with-crypto --enable-openssl-random
 NTP_DEPENDENCIES += openssl
 else
 NTP_CONF_OPTS += --without-crypto --disable-openssl-random
