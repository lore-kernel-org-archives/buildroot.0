From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 13:28:44 +0200
Subject: [Buildroot] [git commit] heimdal: needs host-ncurses
Message-ID: <20150714114724.6D5EE81A1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b0e5bef3e3ee881ef2a1916c18ab95fef86dd7ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it will fail with an error like this one:

checking for tgetent in -lcurses... no
checking for tgetent in -lncurses... no
configure: error: libcurses or libncurses are required!

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/heimdal/heimdal.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 6260f8c..19bca5e 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -6,7 +6,7 @@
 
 HEIMDAL_VERSION = 1.6rc2
 HEIMDAL_SITE = http://www.h5l.org/dist/src
-HEIMDAL_DEPENDENCIES = host-e2fsprogs host-pkgconf
+HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = \
