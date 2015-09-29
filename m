From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2015 13:51:25 +0200
Subject: [Buildroot] [git commit] package/ltp-testsuite: enable realtime
	tests
Message-ID: <20150929120702.7F7E081D63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ac29e66148b64ff462e48ab85ffa5cebc7b732e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/ltp-testsuite.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
