From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 10:39:21 +0100
Subject: [Buildroot] [git commit] Documentation: quotes around TARGET_CC
	command.
Message-ID: <20120131094014.80BBA9095A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9378d9f1ee27d19a3652e6ecdc4611a976a77b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When ccache is enabled, TARGET_CC is "ccache gcc". Without quotes,
when assigning CC=$(TARGET_CC), only "ccache" gets assigned to CC.

Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html                        |    2 +-
 docs/manual/adding-packages-gentargets.txt |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 0c1cddf..ddfb20a 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -905,7 +905,7 @@ source "package/libfoo/Config.in"
 <span style="color: #000000">10:</span><span style="color: #009900"> LIBFOO_DEPENDENCIES</span> = host-libaaa libbbb
 <span style="color: #000000">11:</span>
 <span style="color: #000000">12:</span> define LIBFOO_BUILD_CMDS
-<span style="color: #000000">13:</span> 	<span style="color: #009900">$(MAKE)</span> CC=<span style="color: #009900">$(TARGET_CC)</span> LD=<span style="color: #009900">$(TARGET_LD)</span> -C <span style="color: #009900">$(@D)</span> all
+<span style="color: #000000">13:</span> 	<span style="color: #009900">$(MAKE)</span> CC=<span style="color: #009900">"$(TARGET_CC)"</span> LD=<span style="color: #009900">"$(TARGET_LD)"</span> -C <span style="color: #009900">$(@D)</span> all
 <span style="color: #000000">14:</span> endef
 <span style="color: #000000">15:</span>
 <span style="color: #000000">16:</span> define LIBFOO_INSTALL_STAGING_CMDS
diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index b344494..92fce2c 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -24,7 +24,7 @@ system is based on hand-written Makefiles or shell scripts.
 10: LIBFOO_DEPENDENCIES = host-libaaa libbbb
 11:
 12: define LIBFOO_BUILD_CMDS
-13: 	$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
+13: 	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
 14: endef
 15:
 16: define LIBFOO_INSTALL_STAGING_CMDS
