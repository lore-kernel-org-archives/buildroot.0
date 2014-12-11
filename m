From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 22:51:12 +0100
Subject: [Buildroot] [git commit] arch: remove superfluous arch dependencies
	on BR2_BINFMT_FLAT_*
Message-ID: <20141211215300.BFCAA80193@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=375c77ad4e597bc5c67a151d722b5063322bbb46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noted by Yann E. Morin, those dependencies are unneeded, since FLAT
can anyway only be used on m68k and Blackfin.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index c7bef5d..d06ab5e 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -305,14 +305,12 @@ config BR2_BINFMT_FLAT_ONE
 
 config BR2_BINFMT_FLAT_SEP_DATA
 	bool "Separate data and code region"
-	depends on BR2_bfin || BR2_m68k
 	help
 	  Allow for the data and text segments to be separated and placed in
 	  different regions of memory.
 
 config BR2_BINFMT_FLAT_SHARED
 	bool "Shared binary"
-	depends on BR2_bfin || BR2_m68k
 	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  Allow to load and link indiviual FLAT binaries at run time.
