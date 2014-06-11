From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 11 Jun 2014 21:17:47 +0200
Subject: [Buildroot] [PATCH] supervisor: add runtime dependency on
	python-setuptools
Message-ID: <7514f33bf3a507a044a5.1402514267@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
 package/supervisor/Config.in |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff -r a3b89cb15e8f -r 7514f33bf3a5 package/supervisor/Config.in
--- a/package/supervisor/Config.in	Mon Jun 09 10:43:55 2014 +0200
+++ b/package/supervisor/Config.in	Wed Jun 11 21:15:11 2014 +0200
@@ -2,6 +2,7 @@
 	bool "supervisor"
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_MELD3
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime dependency
 	help
 	  A client/server system that allows its users to control a
 	  number of processes on UNIX-like operating systems.
