From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 08:52:27 +0100
Subject: [Buildroot] [git commit] openpgm: Blacklist Blackfin ADI 2014R1
	toolchain
Message-ID: <20150308075242.CC1C98057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5f936add20137acd8f0386d14f59d23f5177054c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Openpgm requires compiler intrinsics not available with Blackfin ADI toolchains.

Fixes:
http://autobuild.buildroot.net/results/394/394cf96cc0ab9029e5baa84b19e2b4d7a553f077/

[Thomas: propagate dependency to zeromq.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openpgm/Config.in |    1 +
 package/zeromq/Config.in  |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/openpgm/Config.in b/package/openpgm/Config.in
index 3a26212..8d03c84 100644
--- a/package/openpgm/Config.in
+++ b/package/openpgm/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENPGM
 	bool "openpgm"
 	# The following toolchains lack required compiler intrinsics
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index a97ba8d..1a69f7d 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -31,6 +31,7 @@ if BR2_PACKAGE_ZEROMQ
 
 config BR2_PACKAGE_ZEROMQ_PGM
 	bool "PGM/EPGM support"
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # openpgm
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # openpgm
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # openpgm
 	select BR2_PACKAGE_OPENPGM
