From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 May 2010 09:13:14 +0200
Subject: [Buildroot] [git commit master] ltp-testsuite: mark as broken
Message-ID: <20100511071423.3EB3DAA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bb39f18905e371f760340791cc23fc1542348749
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The install step, done with fakeroot, tries to install things in /opt:

make[2]: Entering directory `/home/test/buildroot/output.ctng-arm-eglibc-2010-05-07-19-39-56/target/root/ltp-full-20090630/lib'
install -D -m 644 libltp.a //opt/ltp/lib/libltp.a
install: cannot create directory //opt/ltp: Permission denied
make[2]: *** [install] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 46c8221..efe0db7 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LTP-TESTSUITE
 	bool "ltp-testsuite"
+	depends on BROKEN
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
-- 
1.6.3.3
