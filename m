From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 20:29:50 +0200
Subject: [Buildroot] [git commit branch/next] elftosb: use
	HOST_CONFIGURE_OPTS instead of HOST_MAKE_ENV
Message-ID: <20120802195259.66B2196CE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e75a2d229b42aa8f0e6e0f0f04dc1a34988d996
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

HOST_CONFIGURE_OPTS allows to pass the correct CC, CXX, CFLAGS,
CXXFLAGS, etc. For example, it allows the elftosb build process to
properly use ccache when available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elftosb/elftosb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/elftosb/elftosb.mk b/package/elftosb/elftosb.mk
index b2e50f7..5803b75 100644
--- a/package/elftosb/elftosb.mk
+++ b/package/elftosb/elftosb.mk
@@ -8,7 +8,7 @@ ELFTOSB_SOURCE = elftosb-$(ELFTOSB_VERSION).tar.gz
 ELFTOSB_SITE = http://repository.timesys.com/buildsources/e/elftosb/elftosb-$(ELFTOSB_VERSION)
 
 define HOST_ELFTOSB_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
 endef
 
 define HOST_ELFTOSB_INSTALL_CMDS
