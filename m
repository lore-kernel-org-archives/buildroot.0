From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Oct 2017 23:27:16 +0200
Subject: [Buildroot] [git commit] wiringpi: bump version to
	96344ff7125182989f98d3be8d111952a8f74e15
Message-ID: <20171011213615.D8956811B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fdc039a011c646421798a9dee6208c605fb2885
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream wiringpi apparently has some issues with their release
process: their 2.42 and 2.44 tags point to the exact same commit. And
at the 2.44 tag, the VERSION file was not updated to indicate that
it's version 2.44.

A follow-up commit added support for the RPi Zero-W, and fixed the
VERSION file to contain 2.44. So let's use this follow-up commit as
the new version for wiringpi.

This will hopefully clarify things, and avoid confusion such as the
one reported in bug #10391 [1].

[1] https://bugs.busybox.net/show_bug.cgi?id=10391

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Thomas: rewrite commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wiringpi/wiringpi.hash | 2 +-
 package/wiringpi/wiringpi.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/wiringpi/wiringpi.hash b/package/wiringpi/wiringpi.hash
index 35eedb9..f4832e5 100644
--- a/package/wiringpi/wiringpi.hash
+++ b/package/wiringpi/wiringpi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 464c98ed54f5c0ad6611e270be3491c4598a32b7e86b208255862a301c564955  wiringpi-2.44.tar.gz
+sha256 4eae1d4f37f77534b1e2db4678a1003a5fd7ced4721c340527e3476d0bed1d9f wiringpi-96344ff7125182989f98d3be8d111952a8f74e15.tar.gz
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
index cec34fa..f2e9e24 100644
--- a/package/wiringpi/wiringpi.mk
+++ b/package/wiringpi/wiringpi.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-WIRINGPI_VERSION = 2.44
+# using git commit id instead of (wrong) 2.44 git tag (Bug 10391)
+WIRINGPI_VERSION = 96344ff7125182989f98d3be8d111952a8f74e15
 WIRINGPI_SITE = git://git.drogon.net/wiringPi
 
 WIRINGPI_LICENSE = LGPL-3.0+
