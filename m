From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 18 Jan 2017 11:12:36 +0100
Subject: [Buildroot] [PATCH 2/2] package/ltp-testsuite: update configure
	flags
In-Reply-To: <20170118101236.24594-1-petr.vorel@gmail.com>
References: <20170118101236.24594-1-petr.vorel@gmail.com>
Message-ID: <20170118101236.24594-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

compile also open possix

remove power management (compiled by default since commit
b74bbed51b0c0d44b70b136326a8a23cbc64db01)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index f892dc00e..9d82087f7 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -10,7 +10,7 @@ LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download
 LTP_TESTSUITE_LICENSE = GPLv2, GPLv2+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
 LTP_TESTSUITE_CONF_OPTS += \
-	--with-power-management-testsuite \
+	--with-open-posix-testsuite \
 	--with-realtime-testsuite
 
 ifeq ($(BR2_LINUX_KERNEL),y)
-- 
2.11.0
