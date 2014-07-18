From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 19:56:06 +0200
Subject: [Buildroot] [git commit] gcc 4.9.x: Exclude for PPC SPE because of
	PR60102
Message-ID: <20140718180154.CF04E9D27F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=275d5115dbb5afb3eaff185aa12315eb5deac8e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Exclude gcc 4.9.x for PowerPC SPE toolchains because of an ICE
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
There's a patch available but it's somewhat intrusive with PPC in
general and hasn't been well tested yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index eaff929..afed26b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -59,6 +59,8 @@ choice
 
 	config BR2_GCC_VERSION_4_9_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_sparc
+		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
+		depends on !BR2_powerpc_SPE
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.9.x"
