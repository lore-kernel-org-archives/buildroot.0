From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jan 2011 22:07:14 +0100
Subject: [Buildroot] [git commit master 1/1] autotools: allow host package
	to use <pkg>_MAKE_ENV and <pkg>_MAKE
Message-ID: <20110125211620.C320E8D245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b06e7ac4e135a01ddb8914c779dff2bda25e00b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be needed by the Python interpreter package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.autotools.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index de0a355..d445348 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -200,7 +200,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $$($$(PKG)_SRCDIR) install
+	$(HOST_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE) -C $$($$(PKG)_SRCDIR) install
 endef
 endif
 
-- 
1.7.3.4
