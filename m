From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 May 2017 09:38:38 +0200
Subject: [Buildroot] [git commit] fxload: disable on Microblaze
Message-ID: <20170516074018.3C02381DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af486457dfa9e0cd8c0b1ce636821e48bcc896c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc on Microblaze is affected by PR63261, which causes a build failure
when optimization *and* debugging symbols are enabled. Since anyway
fxload is unlikely to be useful on Microblaze, let's disable this
package on this architecture.

Fixes:

  http://autobuild.buildroot.net/results/24640a042d84f45339246c0a18e10905494b2199/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fxload/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/fxload/Config.in b/package/fxload/Config.in
index ac190f0..d178e2c 100644
--- a/package/fxload/Config.in
+++ b/package/fxload/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_FXLOAD
 	bool "fxload"
+	# Hits gcc PR63261 on Microblaze with debugging symbols
+	# enabled. Since this package is unlikely to be useful on
+	# Microblaze, just disable it on this architecture.
+	depends on !BR2_microblaze
 	help
 	  This program is conveniently able to download firmware into FX, FX2,
 	  and FX2LP EZ-USB devices, as well as the original AnchorChips EZ-USB.
