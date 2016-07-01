From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  1 Jul 2016 18:29:09 +0200
Subject: [Buildroot] [PATCH v2 04/15] package/Makefile.in: set variables for
	legacy f77 checks
In-Reply-To: <20160701162920.19632-1-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
Message-ID: <20160701162920.19632-5-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For fortran detection, some projects check for fortran availability
using the FC/FCFLAGS variables, and others for the legacy F77/FFLAGS
ones.
So, make sure the legacy fortran F77 and FFLAGS variables are set in
TARGET_CONFIGURE_OPTS.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- new patch
---
 package/Makefile.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 471f687..afd5d3a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -250,6 +250,7 @@ TARGET_CONFIGURE_OPTS = \
 	CPP="$(TARGET_CPP)" \
 	CXX="$(TARGET_CXX)" \
 	FC="$(TARGET_FC)" \
+	F77="$(TARGET_FC)" \
 	RANLIB="$(TARGET_RANLIB)" \
 	READELF="$(TARGET_READELF)" \
 	STRIP="$(TARGET_STRIP)" \
@@ -273,6 +274,7 @@ TARGET_CONFIGURE_OPTS = \
 	CXXFLAGS="$(TARGET_CXXFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	FCFLAGS="$(TARGET_FCFLAGS)" \
+	FFLAGS="$(TARGET_FCFLAGS)" \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	STAGING_DIR="$(STAGING_DIR)" \
 	INTLTOOL_PERL=$(PERL)
-- 
2.9.0
