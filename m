From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:39:23 +0200
Subject: [Buildroot] [PATCH 49/53] sepolgen: strip /usr/ part from HOST_DIR
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-50-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sepolgen is a bit weird: DESTDIR acts as a kind of prefix, PYTHONLIBDIR
is relative to it (and a / is added between them).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Adam Duskett <aduskett@codeblue.com>
Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/sepolgen/sepolgen.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sepolgen/sepolgen.mk b/package/sepolgen/sepolgen.mk
index 033b468f02..ab7f18d857 100644
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
-- 
2.11.0
