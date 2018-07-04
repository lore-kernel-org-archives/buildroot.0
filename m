From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 21:45:10 +0200
Subject: [Buildroot] [git commit] package/exim: remove unused Local-Makefile
Message-ID: <20180704194136.53BF082B74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f4df8cd162d6557d315360a78c3271f71d9a275
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the exim package was added, it included a template for the
build-time configuration file Local/Makefile in the package directory.
In commit 8956779d5d2 (exim: use a more standard build-time
configuration), this template file was replaced with the EDITME
template file included in the exim sources. However, that commit did
not remove Buildroot's Local-Makefile.

Since this file is no longer used, remove it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exim/Local-Makefile | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/package/exim/Local-Makefile b/package/exim/Local-Makefile
deleted file mode 100644
index 191f0e0da6..0000000000
--- a/package/exim/Local-Makefile
+++ /dev/null
@@ -1,15 +0,0 @@
-BIN_DIRECTORY=/usr/sbin
-CONFIGURE_FILE=/etc/exim/configure
-EXIM_USER=ref:exim
-EXIM_GROUP=mail
-SPOOL_DIRECTORY=/var/spool/exim
-ROUTER_ACCEPT=yes
-TRANSPORT_LMTP=yes
-LOOKUP_DBM=yes
-LOOKUP_LSEARCH=yes
-PCRE_LIBS=-lpcre
-FIXED_NEVER_USERS=root
-HEADERS_CHARSET="ISO-8859-1"
-HAVE_ICONV=no
-SYSLOG_LOG_PID=yes
-TMPDIR="/tmp"
