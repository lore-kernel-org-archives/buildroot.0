From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 16 Jun 2015 00:57:22 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/gpm: add hash file,
	change archive to lzma
In-Reply-To: <1434409042-17117-1-git-send-email-petr.vorel@gmail.com>
References: <1434409042-17117-1-git-send-email-petr.vorel@gmail.com>
Message-ID: <1434409042-17117-2-git-send-email-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v3:
- use lzma, mainly as proof of concept of previous patch "pkg-generic:
  support for lzma archives"
Changes v2:
- added missing hash file
- keep tar.bz2
---
 package/gpm/gpm.hash | 2 ++
 package/gpm/gpm.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/gpm/gpm.hash

diff --git a/package/gpm/gpm.hash b/package/gpm/gpm.hash
new file mode 100644
index 0000000..7bbc43d
--- /dev/null
+++ b/package/gpm/gpm.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  a955053b36556ffa7c628ce18fd6de7d625966573fa412fb08869533d8f7385c  gpm-1.20.7.tar.lzma
diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index dee6208..6d3b5d2 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GPM_VERSION = 1.20.7
-GPM_SOURCE = gpm-$(GPM_VERSION).tar.bz2
+GPM_SOURCE = gpm-$(GPM_VERSION).tar.lzma
 GPM_SITE = http://www.nico.schottelius.org/software/gpm/archives
 GPM_LICENSE = GPLv2+
 GPM_LICENSE_FILES = COPYING
-- 
1.8.0
