From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Mar 2018 20:17:00 +0100
Subject: [Buildroot] [PATCH 09/10] python-jsonschema: needs
 python-functools32 when used with python 2.7
In-Reply-To: <20180309191701.23760-1-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
Message-ID: <20180309191701.23760-10-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From setup.py:

extras_require = {
    ..
    ":python_version=='2.7'": ["functools32"],

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
 
-- 
2.11.0
