From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:13:40 +0200
Subject: [Buildroot] [git commit] docs/manual: add appendix about
	$(HOST_DIR)/usr
Message-ID: <20170906200621.74AB98057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8f51a00d8ecb40ce3c46beb0da7f228f67cb551
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/migrating.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
index 24ea2e0..92e487c 100644
--- a/docs/manual/migrating.txt
+++ b/docs/manual/migrating.txt
@@ -44,3 +44,15 @@ Now, your br2-external tree can be used with Buildroot 2016.11 onward.
 .Note:
 This change makes your br2-external tree incompatible with Buildroot
 before 2016.11.
+
+[[migrating-host-usr]]
+=== Migrating to 2017.08
+
+Before Buildroot 2017.08, host packages were installed in +$(HOST_DIR)/usr+
+(with e.g. the autotools' +--prefix=$(HOST_DIR)/usr+). With Buildroot
+2017.08, they are now installed directly in +$(HOST_DIR)+.
+
+Whenever a package installs an executable that is linked with a library
+in +$(HOST_DIR)/lib+, it must have an RPATH pointing to that directory.
+
+An RPATH pointing to +$(HOST_DIR)/usr/lib+ is no longer accepted.
