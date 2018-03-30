From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:13:49 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] python-jsonschema: needs
 python-functools32 when used with python 2.7
Message-ID: <20180330213159.6E35783EBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d57f1405efed1f5395f1291a56350cc58f163fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

From setup.py:

extras_require = {
    ..
    ":python_version=='2.7'": ["functools32"],

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dab4285f853889ab85fc130831f91187b4ad3242)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-jsonschema/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-jsonschema/Config.in b/package/python-jsonschema/Config.in
index 7002653722..b547f4ae1a 100644
--- a/package/python-jsonschema/Config.in
+++ b/package/python-jsonschema/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_JSONSCHEMA
 	bool "python-jsonschema"
+	select BR2_PACKAGE_PYTHON_FUNCTOOLS32 if BR2_PACKAGE_PYTHON # runtime
 	help
 	  An implementation of JSON Schema validation for Python.
 
