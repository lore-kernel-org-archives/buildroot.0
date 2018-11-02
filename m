From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 19:20:11 +0100
Subject: [Buildroot] [git commit] package/python-django: select
 BR2_PACKAGE_PYTHON_SETUPTOOLS
Message-ID: <20181102181822.1335088226@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df8a9ec20fdfde4d187a8993e7eabfb9180fedf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The django-admin cli tool is loaded as entry point with pkg_resources,
which is provided by setuptools.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-django/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-django/Config.in b/package/python-django/Config.in
index 89dec8e17a..0a2e308d31 100644
--- a/package/python-django/Config.in
+++ b/package/python-django/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_DJANGO
 	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	select BR2_PACKAGE_PYTHON3_PYEXPAT
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
 	  Django is a high-level Python Web framework that encourages
 	  rapid development and clean, pragmatic design. It takes your
