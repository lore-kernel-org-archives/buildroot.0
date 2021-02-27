From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 18:57:59 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/cegui: use plain
 assignemnt for first _CONF_OPTS
Message-ID: <20210227182007.23EF98396F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41f2185b12159bb190d2b3946415984c5a2f8afa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Commit 689b9c1a7cf5 (package/cegui: disable xerces support) added
an unconditional assignment to _CONF_OPTS before all the conditional
ones, but used the append-assignment instead of the traditional plain
assignment.

Fix that by removing the append-assignment.

Use that opportunity to also move the first item of this multi-line
assignment, to its own line.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[yann.morin.1998 at free.fr:
  - reference the exact commit that introduce the issue
  - also move the first item to its own line
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 86fbba8b81b09b676bf8f03e88b11b607599e066)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cegui/cegui.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cegui/cegui.mk b/package/cegui/cegui.mk
index 23919e0151..d578c9913c 100644
--- a/package/cegui/cegui.mk
+++ b/package/cegui/cegui.mk
@@ -9,7 +9,8 @@ CEGUI_SITE = $(call github,cegui,cegui,v$(CEGUI_VERSION))
 CEGUI_LICENSE = MIT
 CEGUI_LICENSE_FILES = COPYING
 CEGUI_INSTALL_STAGING = YES
-CEGUI_CONF_OPTS += -DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
+CEGUI_CONF_OPTS = \
+	-DCEGUI_BUILD_XMLPARSER_XERCES=OFF \
 	-DCEGUI_HAS_MINIZIP_RESOURCE_PROVIDER=OFF \
 	-DCEGUI_BUILD_RENDERER_OGRE=OFF
 CEGUI_DEPENDENCIES = glm \
