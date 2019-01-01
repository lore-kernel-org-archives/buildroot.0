From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jan 2019 21:09:09 +0100
Subject: [Buildroot] [git commit] package/opus: bump to version 1.3
Message-ID: <20190101200759.15DB68843A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca9d56f92e27cc0a56a3abfb9d86405ec71f0ad2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This Opus 1.3 major release again brings quality improvements, new
features, and bug fixes. Changes since 1.2.x include:

- Improvements to the VAD and speech/music classification using an RNN
- Support for ambisonics coding using channel mapping families 2 and 3
- Improvements to stereo speech coding at low bitrate
- Using wideband encoding down to 9 kb/s
- Making it possible to use SILK down to bitrates around 5 kb/s
- Minor quality improvement on tones
- Enabling the spec fixes in RFC 8251 by default
- Security/hardening improvements

Notable bug fixes include:

- Fixes to the CELT PLC
- Bandwidth detection fixes

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.hash | 2 +-
 package/opus/opus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index c1a92d6b94..c916647916 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256 cfafd339ccd9c5ef8d6ab15d7e1a412c054bf4cb4ecbbbcc78c12ef2def70732  opus-1.2.1.tar.gz
+sha256 4f3d69aefdf2dbaf9825408e452a8a414ffc60494c70633560700398820dc550  opus-1.3.tar.gz
 
 # Hash for license file
 sha256 8338ce8d922bb4416ce3dd1e5680173332435e3f0755007ac7801ccd674fe682  COPYING
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 44de5db253..b3cfa21fde 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.2.1
+OPUS_VERSION = 1.3
 OPUS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
