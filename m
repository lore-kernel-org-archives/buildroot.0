From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 21:02:40 +0200
Subject: [Buildroot] [git commit] package/spandsp: needs jpeg support in
 tiff package
Message-ID: <20200903185518.C6EC3877EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4205289f9f8c7efcf83cad802af8bfe26fc7cdd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit https://github.com/freeswitch/spandsp/commit/
be0bce3dbc4b33f92e8da985900104b857259d02#diff-67e997bcfdac55191033d57a16d1408aR550,
jpeg support is needed in the fiff package.

This issue appeared with the bump of spandsp to 3.0 in commit
36c983bfa543de89ab8c9374a860d2fdf8a2fb87.

Fixes:
http://autobuild.buildroot.net/results/f5e/f5efa4aeef661670403111074b9397da47167d07/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/spandsp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/spandsp/Config.in b/package/spandsp/Config.in
index da0ca50fa2..c64eee8acd 100644
--- a/package/spandsp/Config.in
+++ b/package/spandsp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SPANDSP
 	bool "spandsp"
 	select BR2_PACKAGE_TIFF
+	select BR2_PACKAGE_TIFF_JPEG
 	help
 	  Spandsp is a library of many DSP functions for telephony.
 	  These range from simple modules, such as DTMF detection, to
