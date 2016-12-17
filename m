From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 14:19:56 +0100
Subject: [Buildroot] [git commit] tinycbor: disable parallel build
Message-ID: <20161217132003.8AF3581770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b9450996caad1a567f807a7403b6201ea033981
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Maybe fixes ([1]):

 make[1]: Entering directory `/home/peko/autobuild/instance-1/output/build/tinycbor-v0.4'
 .config:8: *** missing separator.  Stop.

[1] http://autobuild.buildroot.net/results/8e8fd1e19d6d07212f29e19a305712e715fe781b

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinycbor/tinycbor.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 2691e5b..65deacd 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -18,8 +18,10 @@ endif
 
 TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) V=1
 
+# disabled parallel build because of build failures while
+# producing the .config file
 define TINYCBOR_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TINYCBOR_MAKE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TINYCBOR_MAKE_OPTS) -C $(@D)
 endef
 
 define TINYCBOR_INSTALL_STAGING_CMDS
