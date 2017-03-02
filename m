From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:43:02 +0100
Subject: [Buildroot] [git commit] manual: luarocks: improve tutorial example
Message-ID: <20170302214306.8DB498223C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=448730a2e44cbdb686b20d6b08beeedd16d1d6f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file in a luarocks package is always inside the subdir, so the
example should reflect this.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-luarocks.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-luarocks.txt b/docs/manual/adding-packages-luarocks.txt
index c914238..712c29e 100644
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
