From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Feb 2015 00:11:32 +0100
Subject: [Buildroot] [git commit] directfb-examples: explicitly add -lstdc++
	for static build
Message-ID: <20150226231816.098BB817C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b3d1a543f7338e0622c7ac7b45e7c96d39a9387b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes [1] and [2]:
undefined reference to `___cxa_pure_virtual'
undefined reference to `___gxx_personality_v0'

[1] http://autobuild.buildroot.net/results/bd0/bd0f4b3e41bf6330f83e3d9b58d985cc63506a3b/
[2] http://autobuild.buildroot.net/results/584/584ace383204d97fcaad37742e2e035ca78a3d10/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/directfb-examples/directfb-examples.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 16d2a86..40afd81 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -12,6 +12,10 @@ DIRECTFB_EXAMPLES_LICENSE_FILES = COPYING
 DIRECTFB_EXAMPLES_INSTALL_STAGING = YES
 DIRECTFB_EXAMPLES_DEPENDENCIES = directfb
 
+ifeq ($(BR2_STATIC_LIBS),y)
+        DIRECTFB_EXAMPLES_CONF_OPTS += LIBS=-lstdc++
+endif
+
 DIRECTFB_EXAMPLES_TARGETS_ =
 DIRECTFB_EXAMPLES_TARGETS_y =
 
