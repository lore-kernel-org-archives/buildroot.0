From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:54 +0100
Subject: [Buildroot] [git commit] binutils: unbreak host build after
	auto-host-deps change
Message-ID: <20120118150407.8EE6E90383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1944b48a3f16c5d93bba46b7e353230c06f859fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/binutils.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 20de45a..8632d67 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -40,6 +40,8 @@ HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 			$(BR2_CONFIGURE_STAGING_SYSROOT) \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
+HOST_BINUTILS_DEPENDENCIES =
+
 # We just want libbfd and libiberty, not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
