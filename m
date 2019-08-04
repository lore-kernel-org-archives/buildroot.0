From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 19:14:23 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-idna:
 select unicodedata support in python interpreter
Message-ID: <20190804201436.4A48C8E42E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce4be55c445a5ca4b8d9bbd79fb71b815d8cd203
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

idna requires unicodedata:

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "usr/lib/python3.7/site-packages/idna/__init__.py", line 2, in <module>
  File "usr/lib/python3.7/site-packages/idna/core.py", line 3, in <module>
ModuleNotFoundError: No module named 'unicodedata'

Signed-off-by: Alex Xu <alex_y_xu@yahoo.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9177475111050728193159259c5853b4f5ae053f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-idna/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-idna/Config.in b/package/python-idna/Config.in
index 1fd56ceaf6..e3e548d493 100644
--- a/package/python-idna/Config.in
+++ b/package/python-idna/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_IDNA
 	bool "python-idna"
+	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
 	help
 	  A library to support the Internationalised Domain Names in
 	  Applications (IDNA) protocol as specified in RFC 5891. This
