From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 15:48:07 +0100
Subject: [Buildroot] [git commit] grep: bump to version 2.22
Message-ID: <20151103145129.BCA7081E78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=920d75d0c0596a43b3154457c520ac9d3d17a808
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop security patch since it's upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grep/0001-fix-CVE-2015-1345.patch |   20 --------------------
 package/grep/grep.hash                    |    2 +-
 package/grep/grep.mk                      |    2 +-
 3 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/package/grep/0001-fix-CVE-2015-1345.patch b/package/grep/0001-fix-CVE-2015-1345.patch
deleted file mode 100644
index f7701aa..0000000
--- a/package/grep/0001-fix-CVE-2015-1345.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Simplified patch from upstream to avoid autoreconf. Source:
-http://git.savannah.gnu.org/cgit/grep.git/commit/?id=83a95bd8c8561875b948cadd417c653dbe7ef2e2
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-diff --git a/src/kwset.c b/src/kwset.c
-index 4003c8d..376f7c3 100644
---- a/src/kwset.c
-+++ b/src/kwset.c
-@@ -643,6 +643,8 @@ bmexec_trans (kwset_t kwset, char const *text, size_t size)
-                     if (! tp)
-                       return -1;
-                     tp++;
-+                    if (ep <= tp)
-+                      break;
-                   }
-               }
-           }
---
-cgit v0.9.0.2
diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index d27a26a..4019db1 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256	5244a11c00dee8e7e5e714b9aaa053ac6cbfa27e104abee20d3c778e4bb0e5de	grep-2.21.tar.xz
+sha256	ca91d22f017bfcb503d4bc3b44295491c89a33a3df0c3d8b8614f2d3831836eb	grep-2.22.tar.xz
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 80f6e71..447ed65 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.21
+GREP_VERSION = 2.22
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
