From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 15:54:46 +0100
Subject: [Buildroot] [git commit] package/nftables: do not build docs
Message-ID: <20141227145450.DE10580465@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ecbce22126596d7b4d81a9b85026e4cc91cb539
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building docs requires dblatex with a working Jade Wrapper (jw) which
may well be missing on the build machine, and we do not build our own.

Since docs are anyway removed from the target, just do not build them.

Tell ./configure that we do not have the required tools:
  - DBLATEX=no to disable PDF generation
  - DOCBOOK2X_MAN=no, DOCBOOK2MAN=no and DB2X_DOCBOOK2MAN=no to disable
    manpage generation

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nftables/nftables.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 9f18df7..6be05ed 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -22,6 +22,10 @@ endif
 
 NFTABLES_CONF_ENV = \
 	ac_cv_prog_CONFIG_PDF=no \
-	LIBS="$(NFTABLES_LIBS)"
+	LIBS="$(NFTABLES_LIBS)" \
+	DBLATEX=no \
+	DOCBOOK2X_MAN=no \
+	DOCBOOK2MAN=no \
+	DB2X_DOCBOOK2MAN=no
 
 $(eval $(autotools-package))
