From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 16:17:21 +0200
Subject: [Buildroot] [git commit] package/upx: fix build with host gcc 6.x
Message-ID: <20160701141725.2036C82161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f7203cd5453c93b6b1d6afb9ce4634ec0d9ac7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable the -Werror gcc option because is causes the following error
when using gcc 6.x on the host.

 p_vmlinx.cpp:100:5: error: this ???if??? clause does not guard...
  [-Werror=misleading-indentation] if (a->p_paddr > b->p_paddr) return  1;

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upx/upx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 400d283..eaef275 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -17,6 +17,7 @@ HOST_UPX_DEPENDENCIES = host-ucl host-zlib
 define HOST_UPX_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) CPPFLAGS="$(HOST_CPPFLAGS)" \
 		LDFLAGS="$(HOST_LDFLAGS)" UPX_UCLDIR=$(HOST_DIR)/usr \
+		CXXFLAGS_WERROR= \
 		-C $(@D) all
 endef
 
