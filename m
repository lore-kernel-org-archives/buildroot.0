From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 11 Mar 2014 13:17:58 +0100
Subject: [Buildroot] [PATCH 6/6] Makefile: do not add the toolchain target
	to the TARGETS variable
In-Reply-To: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1394540278-28740-7-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not add the toolchain target to the TARGETS variable because now the
toolchain target is a dependency added automatically so it is not
necessary to add it anymore.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0420364..481f779 100644
--- a/Makefile
+++ b/Makefile
@@ -300,7 +300,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
 #
 ################################################################################
 
-TARGETS := toolchain
+TARGETS :=
 
 # silent mode requested?
 QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
-- 
1.8.3.2
