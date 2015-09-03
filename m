From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu,  3 Sep 2015 11:01:56 +0200
Subject: [Buildroot] [PATCH 1/3] package/ltp-testsuite: enable realtime tests
In-Reply-To: <1441270918-28981-1-git-send-email-anders.roxell@linaro.org>
References: <1441270918-28981-1-git-send-email-anders.roxell@linaro.org>
Message-ID: <1441270918-28981-2-git-send-email-anders.roxell@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 package/ltp-testsuite/ltp-testsuite.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index acc1640..48733f2 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -9,6 +9,8 @@ LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = http://downloads.sourceforge.net/project/ltp/LTP%20Source/ltp-$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
 LTP_TESTSUITE_LICENSE_FILES = COPYING
+LTP_TESTSUITE_CONF_OPTS += \
+			   --with-realtime-testsuite
 
 # Needs libcap with file attrs which needs attr, so both required
 ifeq ($(BR2_PACKAGE_LIBCAP)$(BR2_PACKAGE_ATTR),yy)
-- 
2.1.4
