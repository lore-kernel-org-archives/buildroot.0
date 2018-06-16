From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jun 2018 14:27:52 +0200
Subject: [Buildroot] [git commit] package/speex: add optional dependency to
 speexdsp
Message-ID: <20180616122621.36B518856E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ad40107beb67a0b6a8381e7e1782f68d8adbd3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quoting speex release notes from https://www.speex.org

"Speex 1.2rc2 and SpeexDSP 1.2rc2 are out
 December 6, 2014
 This release splits the speex codec library and the speex DSP library
 into separate source trees."

After bumping speex to 1.2.0 DSP support is provided by speexdsp.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/speex/speex.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index c6b46e0eb3..522f8cc09c 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -13,6 +13,10 @@ SPEEX_DEPENDENCIES = host-pkgconf libogg
 SPEEX_CONF_OPTS = \
 	--enable-fixed-point
 
+ifeq ($(BR2_PACKAGE_SPEEXDSP),y)
+SPEEX_DEPENDENCIES += speexdsp
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX_ARM4),y)
 SPEEX_CONF_OPTS += --enable-arm4-asm
 endif
