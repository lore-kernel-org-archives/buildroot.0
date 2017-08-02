From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:12:43 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20170802190908.41A6681EEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d64d1216968e5a99c0baccef06e98f7c982cb60b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update with the skeleton rework details, and a webkitgtk bug that is
now fixed.
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/CHANGES b/CHANGES
index e31fd7a..61df8ef 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,19 @@
 
 	Infrastructure:
 
+	- The skeleton package has been split into multiple packages:
+	  skeleton-sysv (when Busybox or SysV init are used),
+	  skeleton-systemd (when systemd is used), skeleton-none (when
+	  no init system is used) and skeleton-custom (when a custom
+	  skeleton is used). Those packages, except skeleton-custom,
+	  share common logic and data in a new package called
+	  skeleton-common. The skeleton package becomes a virtual
+	  package. This change allows to generate a filesystem that is
+	  compliant with systemd expectations.
+
+	- Support for using a read-only filesystem with systemd has
+	  been fixed.
+
 	- Major revamp of the gettext handling, with user-visible
 	  effect:
 
@@ -113,6 +126,7 @@
 
 	Issues resolved (http://bugs.buildroot.org):
 
+	#7892: systemd-journald is broken
 	#9341: avahi-utils does not compile with uClibc +  libglib2
 	#9441: Link BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY to
 	       BR2_ENABLE_DEBUG
@@ -142,6 +156,8 @@
 	#10061: gcc5.4 buildroot toolchain for powerpc libsanitizer
 		failure
 	#10076: Makefile:4113: recipe for target 'all-gcc'  failed
+	#10121: webkit without the multimedia option causes build
+		error
 
 2017.05.2, Released July 27th, 2017
 
