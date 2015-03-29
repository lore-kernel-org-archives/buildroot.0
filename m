From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 14:48:00 +0200
Subject: [Buildroot] [git commit] gdb: deprecate version 7.7.x
Message-ID: <20150329124810.E89FC7FD22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c3d1561fa70d2ef69dc35024d30b181c28e4d6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that 7.9 was added and 7.8.x is default we don't want to have a
dozen versions so mark it as deprecated.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 3a0baa1..6b0ca9b 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -33,6 +33,7 @@ choice
 
 	config BR2_GDB_VERSION_7_7
 		bool "gdb 7.7.x"
+		depends on BR2_DEPRECATED_SINCE_2015_05
 
 	config BR2_GDB_VERSION_7_8
 		bool "gdb 7.8.x"
