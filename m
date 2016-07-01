From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 23:01:25 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: set variables for
	legacy f77 checks
Message-ID: <20160701210135.344EC821A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35e980f324096b291203f26399e58269b0dda092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For fortran detection, some projects check for fortran availability
using the FC/FCFLAGS variables, and others for the legacy F77/FFLAGS
ones.
So, make sure the legacy fortran F77 and FFLAGS variables are set in
TARGET_CONFIGURE_OPTS.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
