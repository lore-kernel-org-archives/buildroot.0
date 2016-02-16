From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Tue, 16 Feb 2016 16:15:26 +0100
Subject: [Buildroot] [PATCH 1/1] Declare SED Makefile instead of
	package/Makefile.in so it exists globally.
In-Reply-To: <20160216161010.779981bb@free-electrons.com>
References: <20160216161010.779981bb@free-electrons.com>
Message-ID: <1455635726-22028-1-git-send-email-alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In particular, this allows the use of buildroot-submodule and in general,
any use of buildroot from out of tree.

Tested-by: Doug Kehn <rdkehn@yahoo.com>
Tested-by: Alvaro G. M. <alvaro.gamez@hazent.com>
Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
---
 Makefile            | 1 +
 package/Makefile.in | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 71735b5..d6069dd 100644
--- a/Makefile
+++ b/Makefile
@@ -279,6 +279,7 @@ HOSTLN := $(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
 HOSTNM := $(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
 HOSTOBJCOPY := $(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
 HOSTRANLIB := $(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
+SED := $(shell which sed || type -p sed) -i -e
 
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
diff --git a/package/Makefile.in b/package/Makefile.in
index dd595e2..273a594 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -214,7 +214,6 @@ endif
 INSTALL := $(shell which install || type -p install)
 FLEX := $(shell which flex || type -p flex)
 BISON := $(shell which bison || type -p bison)
-SED := $(shell which sed || type -p sed) -i -e
 UNZIP := $(shell which unzip || type -p unzip) -q
 
 APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
-- 
2.7.0
