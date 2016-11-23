From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 23:29:45 +0100
Subject: [Buildroot] [git commit] Makefile: fix distclean removal of $(O)
Message-ID: <20161123223000.BDB0681DEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=171d4103c565d618ac6dfc61dedf3e1a310e8d6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The distclean target no longer removes the "output" directory for
in-tree builds, because $(O) is no longer just "output" in that
case. Change the test to be against "$(CURDIR)/output", to match
the O setting, and a similar test elsewhere in the same Makefile.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 37e4bd4..1323961 100644
--- a/Makefile
+++ b/Makefile
@@ -928,7 +928,7 @@ clean:
 		$(LEGAL_INFO_DIR) $(GRAPHS_DIR)
 
 distclean: clean
-ifeq ($(O),output)
+ifeq ($(O),$(CURDIR)/output)
 	rm -rf $(O)
 endif
 	rm -rf $(TOPDIR)/dl $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
