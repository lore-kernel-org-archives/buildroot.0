From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 14:09:23 +1100
Subject: [Buildroot] [git commit] package/ltp-testsuite: update configure
	flags
Message-ID: <20170120030930.51B2480288@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4745040e6a7937d53c803bc00f7b4158e682404
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

compile also open possix

remove power management (compiled by default since commit
b74bbed51b0c0d44b70b136326a8a23cbc64db01)

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index f892dc0..9d82087 100644
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
