From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Feb 2013 21:39:55 +0100
Subject: [Buildroot] [git commit] libmad: force architecture-specific
	optimisations on AVR32
Message-ID: <20130223204022.40F069AC96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=885ae427272f31eb53fc29e8056e6e78577ddeb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/e01f5a5484299dce1797966445f3972583c67b22
http://autobuild.buildroot.net/results/7ed0563fbbfc19c93ec5be35d3b6a95e496b4c5d

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmad/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libmad/Config.in b/package/libmad/Config.in
index d0edc49..80ed853 100644
--- a/package/libmad/Config.in
+++ b/package/libmad/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBMAD
 	bool "libmad"
+	select BR2_PACKAGE_LIBMAD_ASO if BR2_avr32
 	help
 	  High-quality MPEG audio decoder.  All computations are performed
 	  with fixed-point integer arithmetic, making it ideal for systems
