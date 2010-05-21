From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 May 2010 20:37:51 +0200
Subject: [Buildroot] [git commit master] libcgicc: fix package after
	autotools infrastructure conversion
Message-ID: <20100521184447.00E5A9C142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bdc9c05f4450b0ca1e4bfd8edc52c4f9537e576a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch had an incorrect name, and the libtool patch was applied
while it shouldn't, and the package wasn't autoreconfed while the
patch changes some Makefile.am files.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...cgicc-3.2.9-disable-documentation-option.patch} |    0
 package/libcgicc/libcgicc.mk                       |    2 ++
 2 files changed, 2 insertions(+), 0 deletions(-)
 rename package/libcgicc/{cgicc-3.2.9-disable-documentation-option.patch => libcgicc-3.2.9-disable-documentation-option.patch} (100%)

diff --git a/package/libcgicc/cgicc-3.2.9-disable-documentation-option.patch b/package/libcgicc/libcgicc-3.2.9-disable-documentation-option.patch
similarity index 100%
rename from package/libcgicc/cgicc-3.2.9-disable-documentation-option.patch
rename to package/libcgicc/libcgicc-3.2.9-disable-documentation-option.patch
diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index c2f80b6..b281eed 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -7,6 +7,8 @@ LIBCGICC_VERSION=3.2.9
 LIBCGICC_SITE=$(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.gz
 LIBCGICC_INSTALL_STAGING=YES
+LIBCGICC_LIBTOOL_PATCH=NO
+LIBCGICC_AUTORECONF=YES
 
 LIBCGICC_CONF_OPT = \
 	--disable-demos \
-- 
1.6.3.3
