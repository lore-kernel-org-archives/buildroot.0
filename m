From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:26 +0100
Subject: [Buildroot] [PATCH 04/25] manual: luarocks: improve tutorial example
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-5-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The license file in a luarocks package is always inside the subdir, so the
example should reflect this.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-luarocks.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
index c914238f0b..712c29e9a4 100644
--- a/docs/manual/adding-packages-luarocks.txt
+++ b/docs/manual/adding-packages-luarocks.txt
@@ -23,7 +23,7 @@ with an example :
 10: LUAFOO_BUILD_OPTS += FOO_INCDIR=$(STAGING_DIR)/usr/include
 11: LUAFOO_BUILD_OPTS += FOO_LIBDIR=$(STAGING_DIR)/usr/lib
 12: LUAFOO_LICENSE = luaFoo license
-13: LUAFOO_LICENSE_FILES = COPYING
+13: LUAFOO_LICENSE_FILES = $(LUAFOO_SUBDIR)/COPYING
 14:
 15: $(eval $(luarocks-package))
 ------------------------
-- 
2.11.0
