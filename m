From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Aug 2014 09:17:33 +0200
Subject: [Buildroot] [git commit] pkg-autotools: use
	--disable-dependency-tracking
Message-ID: <20140901132446.931819D5B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e37b0fc6cbbe2245e39fedb247a381fb4e0d992
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, automake does "dependency tracking", which allows the
generated Makefile to contain the necessary dependencies to
automatically rebuild the appropriate C files when included header
files are changed. This dependency tracking is nice when doing active
development on the package, but not really useful when doing a
one-time build of the package. According to automake's
documentation[1], disabling the dependency tracking provides a small
speed-up.

In some very unscientific measurements (i.e repeated only once), we
have noticed a ~3.6% reduction of the total build time of a Buildroot
toolchain after applying this patch.

[1] http://www.gnu.org/software/automake/manual/html_node/Dependency-Tracking.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index bcc648d..83299cf 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -140,6 +140,7 @@ define $(2)_CONFIGURE_CMDS
 		--disable-documentation \
 		--with-xmlto=no \
 		--with-fop=no \
+		--disable-dependency-tracking \
 		$$(DISABLE_NLS) \
 		$$(DISABLE_LARGEFILE) \
 		$$(DISABLE_IPV6) \
@@ -169,6 +170,7 @@ define $(2)_CONFIGURE_CMDS
 		--disable-documentation \
 		--with-xmlto=no \
 		--with-fop=no \
+		--disable-dependency-tracking \
 		$$(QUIET) $$($$(PKG)_CONF_OPT) \
 	)
 endef
