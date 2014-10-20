From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Oct 2014 09:52:27 +0200
Subject: [Buildroot] [git commit] host-perl: fix dependencies
Message-ID: <20141020080317.4A580AFFBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43aaa9c05c9ad5fb73bfbf147cb94f09b3a72fc4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

see autobuilder
http://autobuild.buildroot.net/results/5557b262bfc344700ed04563a40f10bc2a23eb31/
http://autobuild.buildroot.net/results/8b22b950ba9d1635991a97e477ad5268f08b4004/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 723dc12..a8ed49f 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -99,6 +99,10 @@ define PERL_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
 endef
 
+# We never want to have host-berkeleydb or host-gdbm as dependencies
+# of host-perl.
+HOST_PERL_DEPENDENCIES =
+
 HOST_PERL_CONF_OPTS = \
 	-des \
 	-Dprefix="$(HOST_DIR)/usr" \
