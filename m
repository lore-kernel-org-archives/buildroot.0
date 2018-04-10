From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 21:29:45 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] ntp: fix build without
 SSP support
Message-ID: <20180410205255.61D0D88398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdbd22529fd572ebd7d23a89e0f4080f31c6688b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

In version 4.2.8p11 ntp changed its configure script build hardening
parameter to '--with-hardenfile'. Update the parameter name to avoid
-fstack-protector-all when the toolchain does not support this option.

Fixes:
http://autobuild.buildroot.net/results/60e/60e8b9864932f2cabc7deb43234abe168bd113c5/
http://autobuild.buildroot.net/results/592/592db6836817bb078a2f1146d2ce6241bf7997a3/
http://autobuild.buildroot.net/results/b07/b070fbc66a928888df8d2561dad3632778d55e0d/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5766b6fb34a897092092f7d76d6b4f2bc8c48571)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ntp/ntp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index dca8008eeb..b717215313 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -30,9 +30,9 @@ NTP_CONF_OPTS += --without-crypto --disable-openssl-random
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
-NTP_CONF_OPTS += --with-locfile=linux
+NTP_CONF_OPTS += --with-hardenfile=linux
 else
-NTP_CONF_OPTS += --with-locfile=default
+NTP_CONF_OPTS += --with-hardenfile=default
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
