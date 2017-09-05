From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  5 Sep 2017 22:34:53 +0200
Subject: [Buildroot] [PATCH 2/2 v2] docs/manual: add appendix about
	$(HOST_DIR)/usr
In-Reply-To: <cover.1504643670.git.yann.morin.1998@free.fr>
References: <cover.1504643670.git.yann.morin.1998@free.fr>
Message-ID: <8d12cdf3606e18c28219b5e37521aa6facb73605.1504643670.git.yann.morin.1998@free.fr>
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
Changes v1 -> v2:
  - fix typo in one of the paths  (Thomas)
---
 docs/manual/migrating.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/manual/migrating.txt b/docs/manual/migrating.txt
index 5dd83ce8d6..612fbcb087 100644
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
-- 
2.11.0
