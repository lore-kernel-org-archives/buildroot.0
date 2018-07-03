From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  3 Jul 2018 23:07:08 +0200
Subject: [Buildroot] [PATCH] package/exim: remove unused Local-Makefile
Message-ID: <20180703210708.30017-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
I thought I had sent this patch a while ago, but I can't find it in
patchwork...
---
 package/exim/Local-Makefile | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 package/exim/Local-Makefile

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
-- 
2.18.0
