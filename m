From: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
Date: Wed, 17 Jul 2019 15:12:15 -0400
Subject: [Buildroot] [PATCH v2] package/python-idna: select
 PYTHON3_UNICODEDATA
In-Reply-To: <20190717084347.784866e3@windsurf>
References: <20190717084347.784866e3@windsurf>
Message-ID: <20190717191215.61153-1-alex_y_xu@yahoo.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

idna requires unicodedata:

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "usr/lib/python3.7/site-packages/idna/__init__.py", line 2, in <module>
  File "usr/lib/python3.7/site-packages/idna/core.py", line 3, in <module>
ModuleNotFoundError: No module named 'unicodedata'

Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
---
 package/python-idna/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-idna/Config.in b/package/python-idna/Config.in
index 1fd56ceaf6..ddc2cd7d17 100644
--- a/package/python-idna/Config.in
+++ b/package/python-idna/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_IDNA
 	bool "python-idna"
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	help
 	  A library to support the Internationalised Domain Names in
 	  Applications (IDNA) protocol as specified in RFC 5891. This
-- 
2.22.0
