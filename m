From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Oct 2012 09:54:11 +0200
Subject: [Buildroot] [git commit] xenomai: disallow SMP option on !SMP ARM
	variants
Message-ID: <20121016075436.02D579988A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3dfd5f40401a8037bfa86c7c1b10946ff83be26f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/51bf35ed7a6224db7cdb157af4d030a787ef9159

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xenomai/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index ecab23e..b09472d 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -41,6 +41,7 @@ config BR2_PACKAGE_XENOMAI_VERSION
 
 config BR2_PACKAGE_XENOMAI_SMP
 	bool "Enable SMP support"
+	depends on BR2_cortex_a9 || !BR2_arm # only A9 has SMP support
 	help
 	  This option allows to enable or disable SMP support. It has
 	  to match your kernel configuration.
