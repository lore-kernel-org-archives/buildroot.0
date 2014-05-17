From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 May 2014 23:29:20 +0200
Subject: [Buildroot] [git commit] package/duma: do not let Makefile guess OS
Message-ID: <20140517213137.443639CC59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ab9774f234946552df041a3d1459fd21a2d982d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to tell the duma Makefile what OS we're gonna run on, or it
uses default values.

It turns out the default values are the same as for OS=linux (and so
this change should be a no-op), but it's just better to force it, and
it avoids a warning during the build.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/duma/duma.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index d11987f..6e730f9 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -19,6 +19,7 @@ DUMA_OPTIONS = \
 # build time, is not specified in the Makefile. Force non-parallel build.
 define DUMA_BUILD_CMDS
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS)       \
+		OS=linux \
 		DUMA_OPTIONS="$(DUMA_OPTIONS)"   \
 		$(DUMA_CPP) -C $(@D)
 endef
