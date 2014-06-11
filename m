From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 22:17:59 +0200
Subject: [Buildroot] [git commit] supervisor: add runtime dependency on
	python-setuptools
Message-ID: <20140611202619.24BF39B261@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c3e3b2a20848a610040411bd00d8f1d7912e284c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

supervisor has a runtime dependency on python-setuptools which was not
expressed in its Config.in file. When running supervisor without setuptools,
one gets:

Starting supervisord: Traceback (most recent call last):
  File "/usr/bin/supervisord", line 5, in <module>
    from pkg_resources import load_entry_point
ImportError: No module named pkg_resources

Partially fixes bug #7184 (https://bugs.busybox.net/show_bug.cgi?id=7184)

Reported-by: Sebastian Himberger <sebastian@himberger.de>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/supervisor/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
index c511dd8..2ab0e04 100644
--- a/package/supervisor/Config.in
+++ b/package/supervisor/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SUPERVISOR
 	bool "supervisor"
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_MELD3
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime dependency
 	help
 	  A client/server system that allows its users to control a
 	  number of processes on UNIX-like operating systems.
