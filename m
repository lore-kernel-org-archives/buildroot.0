From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon,  7 Apr 2014 11:56:48 +0200
Subject: [Buildroot] [PATCH v4 2/4] toolchain: add a hidden config option to
	enable the toolchain package
In-Reply-To: <1396864610-8426-1-git-send-email-fabio.porcedda@gmail.com>
References: <1396864610-8426-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1396864610-8426-3-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The usual way to enable a package using the package infrastructure is to
use a config option so instead to add the toolchain package to the
TARGETS variable in the Makefile add a config option like all the other
toolchain packages.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile            | 2 +-
 toolchain/Config.in | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 82f2763..e0831b6 100644
--- a/Makefile
+++ b/Makefile
@@ -299,7 +299,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 #
 ################################################################################
 
-TARGETS:= toolchain
+TARGETS :=
 
 # silent mode requested?
 QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 44f3ac6..94a0c7d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -1,5 +1,9 @@
 menu "Toolchain"
 
+config BR2_TOOLCHAIN
+       bool
+       default y
+
 # Should be selected for glibc or eglibc
 config BR2_TOOLCHAIN_USES_GLIBC
 	bool
-- 
1.8.3.2
