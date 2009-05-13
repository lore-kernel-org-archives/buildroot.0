From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 13 May 2009 11:04:13 +0200
Subject: [Buildroot] [git commit] gamin: only enable python support if
	enabled
Message-ID: <20090513090519.82643777E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=419257b191d71bd50f6b8a561a5d79a6f688f5a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Closes #295.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gamin/gamin.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/gamin/gamin.mk b/package/gamin/gamin.mk
index f0a2a1f..180d89e 100644
--- a/package/gamin/gamin.mk
+++ b/package/gamin/gamin.mk
@@ -12,6 +12,10 @@ GAMIN_INSTALL_TARGET = YES
 
 GAMIN_CONF_OPT = --program-prefix="" --disable-debug
 
+ifneq ($(BR2_PACKAGE_PYTHON),y)
+GAMIN_CONF_OPT += --without-python
+endif
+
 GAMIN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 GAMIN_CONF_ENV = have_abstract_sockets=no
-- 
1.6.0.6
