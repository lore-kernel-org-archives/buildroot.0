From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Jul 2013 15:07:07 +0200
Subject: [Buildroot] [git commit] binutils: exclude binutils versions that
	don't support EABIhf
Message-ID: <20130716140822.CE81D9A079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff71f8f8e1f2bff5e26d08b5cb4483507eed8edd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARM EABIhf support was introduced in Binutils 2.22, so earlier
versions should not be selected when EABIhf is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/Config.in.host |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 3d687fe..9ddaed7 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -14,14 +14,17 @@ choice
 
 	config BR2_BINUTILS_VERSION_2_20_1
 		depends on !BR2_avr32
+		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.20.1"
 
 	config BR2_BINUTILS_VERSION_2_21
 		depends on !BR2_avr32
+		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.21"
 
 	config BR2_BINUTILS_VERSION_2_21_1
 		depends on !BR2_avr32
+		depends on !BR2_ARM_EABIHF
 		bool "binutils 2.21.1"
 
 	config BR2_BINUTILS_VERSION_2_22
