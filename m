From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Sep 2017 21:42:55 +0200
Subject: [Buildroot] [PATCH 2/2] docs/manual: add appendix about
	$(HOST_DIR)/usr
In-Reply-To: <cover.1504640557.git.yann.morin.1998@free.fr>
References: <cover.1504640557.git.yann.morin.1998@free.fr>
Message-ID: <027bc1ba0e0b06cd2e353ef8683084b6f9fec926.1504640557.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reported-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Adam Duskett <aduskett@gmail.com>
---
 docs/manual/migrating-host-usr.txt | 14 ++++++++++++++
 docs/manual/migrating.txt          |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 docs/manual/migrating-host-usr.txt

diff --git a/docs/manual/migrating-host-usr.txt b/docs/manual/migrating-host-usr.txt
new file mode 100644
index 0000000000..7583452b1b
--- /dev/null
+++ b/docs/manual/migrating-host-usr.txt
@@ -0,0 +1,14 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[migrating-host-usr]]
+=== Migrating host packages out of $(HOST_DIR)/usr/
+
+Before Buildroot 2017.08, host packages were installed in +$(HOST_DIR)/usr+
+(with e.g. the autotools' +--prefix=$(HOST_DIR)/usr+). With Buildroot
+2017.08, they are now installed directly in +$(HOST_DIR)+.
+
+Whenever a package installs an executable that is linked with a library
+in +$(HOST_DIR)/usr/lib+, it must have an RPATH pointing to that directory.
+
+An RPATH pointing to +$(HOST_DIR)/usr/lib+ is no longer accepted.
diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
index 068d803a83..12d6233b80 100644
--- a/docs/manual/migrating.txt
+++ b/docs/manual/migrating.txt
@@ -5,3 +5,4 @@
 == Migrating from older Buildroot versions
 
 include::migrating-br2-external.txt[]
+include::migrating-host-usr.txt[]
-- 
2.11.0
