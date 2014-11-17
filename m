From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Nov 2014 15:18:29 +0100
Subject: [Buildroot] [git commit] python-werkzeug: needs python zlib support
Message-ID: <20141201104835.8D7537FFF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=82e23f15a11c2cd66d0f6c6397906663c9c9e1d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise import fails:

>>> import werkzeug
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python2.7/site-packages/werkzeug/__init__.py", line 154, in <module>
  File "/usr/lib/python2.7/site-packages/werkzeug/exceptions.py", line 71, in <module>
  File "/usr/lib/python2.7/site-packages/werkzeug/wrappers.py", line 35, in <module>
  File "/usr/lib/python2.7/site-packages/werkzeug/formparser.py", line 21, in <module>
  File "/usr/lib/python2.7/site-packages/werkzeug/wsgi.py", line 17, in <module>
ImportError: No module named zlib

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-werkzeug/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python-werkzeug/Config.in b/package/python-werkzeug/Config.in
index 2097d6e..79e9a45 100644
--- a/package/python-werkzeug/Config.in
+++ b/package/python-werkzeug/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_WERKZEUG
 	bool "python-werkzeug"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  Werkzeug is a WSGI utility library for Python. It's widely
 	  used and BSD licensed.
