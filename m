From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 23:07:20 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/luarocks: fix
 copying our custom command if dest dir exists
Message-ID: <20210105220828.8E74981537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08a3583c4d04ea9d2375c0119b565a99f15ef2d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
[yann.morin.1998 at free.fr:
  - use $(INSTALL), not "mkdir -p + cp"
  - split to its own patch
  - rewrite commit title
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 25bd8ba6907f49d8ce54a6066b5e893416e7aea6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luarocks/luarocks.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 123f8c0734..a5329735c4 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -19,8 +19,7 @@ LUAROCKS_CFLAGS += -DLUA_COMPAT_5_2
 endif
 
 define LUAROCKS_ADDON_EXTRACT
-	mkdir $(@D)/src/luarocks/cmd/external
-	cp package/luarocks/buildroot.lua $(@D)/src/luarocks/cmd/external/buildroot.lua
+	$(INSTALL) -D -m 0644 package/luarocks/buildroot.lua $(@D)/src/luarocks/cmd/external/buildroot.lua
 endef
 HOST_LUAROCKS_POST_EXTRACT_HOOKS += LUAROCKS_ADDON_EXTRACT
 
