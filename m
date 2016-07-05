From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  5 Jul 2016 11:46:58 +0200
Subject: [Buildroot] [PATCH 4/5] gdb: add dependency on host-flex and
	host-bison for Git versions
In-Reply-To: <1467712019-24632-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467712019-24632-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1467712019-24632-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gdb versions fetched from git (such as the ARC version) will not build
with host-flex and host-bison.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index c9c6bd1..6d70955 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -49,8 +49,8 @@ HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 endif
 
 ifeq ($(GDB_FROM_GIT),y)
-GDB_DEPENDENCIES += host-texinfo
-HOST_GDB_DEPENDENCIES += host-texinfo
+GDB_DEPENDENCIES += host-texinfo host-flex host-bison
+HOST_GDB_DEPENDENCIES += host-texinfo host-flex host-bison
 endif
 
 # When gdb sources are fetched from the binutils-gdb repository, they
-- 
2.7.4
