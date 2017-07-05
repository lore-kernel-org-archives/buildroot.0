From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:48 +0200
Subject: [Buildroot] [git commit] sepolgen: strip /usr/ part from HOST_DIR
Message-ID: <20170705141337.9B4AB802F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f606d76a30f837590e270aa15fc541a1e0c6f14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sepolgen is a bit weird: DESTDIR acts as a kind of prefix, PYTHONLIBDIR
is relative to it (and a / is added between them).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Adam Duskett <aduskett@codeblue.com>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sepolgen/sepolgen.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
index 033b468..ab7f18d 100644
--- a/package/sepolgen/sepolgen.mk
+++ b/package/sepolgen/sepolgen.mk
@@ -30,11 +30,11 @@ endef
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_SEPOLGEN_DEPENDENCIES = host-python3
 HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
-	PYTHONLIBDIR=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+	PYTHONLIBDIR=lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 else
 HOST_SEPOLGEN_DEPENDENCIES = host-python
 HOST_SEPOLGEN_MAKE_CMDS = $(HOST_CONFIGURE_OPTS) \
-	PYTHONLIBDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+	PYTHONLIBDIR=lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 endif
 
 define HOST_SEPOLGEN_BUILD_CMDS
