From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 25 Feb 2015 22:35:45 +0100
Subject: [Buildroot] [PATCH v1] directfb-examples: explicitly add -lstdc++
	for static build
In-Reply-To: <1424900145-26962-1-git-send-email-ps.report@gmx.net>
References: <1424900145-26962-1-git-send-email-ps.report@gmx.net>
Message-ID: <1424900145-26962-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1] and [2]:
undefined reference to `___cxa_pure_virtual'
undefined reference to `___gxx_personality_v0'

[1] http://autobuild.buildroot.net/results/bd0/bd0f4b3e41bf6330f83e3d9b58d985cc63506a3b/
[2] http://autobuild.buildroot.net/results/584/584ace383204d97fcaad37742e2e035ca78a3d10/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/directfb-examples/directfb-examples.mk | 4 ++++
 1 file changed, 4 insertions(+)

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
 
-- 
2.1.4
