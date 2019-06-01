From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 09:23:52 +0200
Subject: [Buildroot] [git commit] package/swig: enable PCRE regex matching
 in host-swig
Message-ID: <20190602201238.09479811FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad8ed6bc4b18a69adbf104e236564efeea66bba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upcoming ogre package needs a host swig binary with PCRE
regex support.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swig/swig.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 157d3a39a6..892b0abe30 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -7,9 +7,9 @@
 SWIG_VERSION_MAJOR = 3.0
 SWIG_VERSION = $(SWIG_VERSION_MAJOR).12
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
-HOST_SWIG_DEPENDENCIES = host-bison
+HOST_SWIG_DEPENDENCIES = host-bison host-pcre
 HOST_SWIG_CONF_OPTS = \
-	--without-pcre \
+	--with-pcre \
 	--disable-ccache \
 	--without-octave
 SWIG_LICENSE = GPL-3.0+, BSD-2-Clause, BSD-3-Clause
