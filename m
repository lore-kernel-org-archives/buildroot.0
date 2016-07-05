From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 18:04:54 +0200
Subject: [Buildroot] [git commit] package/sphinxbase: add missing dependency
	on host-bison
Message-ID: <20160705160521.6B38A81841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01f5b511cbbc787c1235a11e10669c2fed05ef76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/741f04fce74b4dfc4d4405d14c82c21f67cbfff1/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sphinxbase/sphinxbase.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sphinxbase/sphinxbase.mk b/package/sphinxbase/sphinxbase.mk
index a8f9a53..5c87c89 100644
--- a/package/sphinxbase/sphinxbase.mk
+++ b/package/sphinxbase/sphinxbase.mk
@@ -11,6 +11,9 @@ SPHINXBASE_LICENSE = BSD-2c
 # 5prealpha tarballs". The license is contained in the copyright notice at the
 # top of each source file. For example:
 SPHINXBASE_LICENSE_FILES = src/libsphinxbase/util/bio.c
+
+SPHINXBASE_DEPENDENCIES = host-bison
+
 SPHINXBASE_CONF_OPTS = --without-python --without-lapack
 
 $(eval $(autotools-package))
