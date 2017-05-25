From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 26 May 2017 01:12:07 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/dstat: needs python
In-Reply-To: <20170525231207.22360-1-bernd.kuhls@t-online.de>
References: <20170525231207.22360-1-bernd.kuhls@t-online.de>
Message-ID: <20170525231207.22360-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The package contains a python script, so having python compiled for
target is needed for the package to work.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dstat/dstat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
index 9c4b44576..458769efc 100644
--- a/package/dstat/dstat.mk
+++ b/package/dstat/dstat.mk
@@ -8,6 +8,7 @@ DSTAT_VERSION = 0.7.3
 DSTAT_SITE = $(call github,dagwieers,dstat,$(DSTAT_VERSION))
 DSTAT_LICENSE = GPL-2.0
 DSTAT_LICENSE_FILES = COPYING
+DSTAT_DEPENDENCIES = python
 
 define DSTAT_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
-- 
2.11.0
