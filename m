From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 May 2010 23:39:49 +0200
Subject: [Buildroot] [PATCH 3/5] less: depends on curses
In-Reply-To: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
Message-ID: <515fb237f403407db71838013b7e8da60044e387.1273527584.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The less package already selects BR2_PACKAGE_CURSES, but it fails to
depend on it in the makefile. Therefore, there are cases where less
gets built before curses, and the build fails:

checking for working terminal libraries... Cannot find terminal libraries - configure failed

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/less/less.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/less/less.mk b/package/less/less.mk
index 706a3e0..bae1cf6 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -6,6 +6,7 @@
 
 LESS_VERSION = 436
 LESS_SITE = http://www.greenwoodsoftware.com/less
+LESS_DEPENDENCIES = ncurses
 
 $(eval $(call AUTOTARGETS,package,less))
 
-- 
1.6.3.3
