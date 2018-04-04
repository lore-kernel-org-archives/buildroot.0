From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  4 Apr 2018 17:51:31 +0200
Subject: [Buildroot] [PATCH 1/2] python-webpy: needs hashlib support in
 python
Message-ID: <20180404155132.17500-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

webpy uses hashlib for session handling, so ensure it is available:

web/session.py:    import hashlib
web/session.py:    sha1 = hashlib.sha1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-webpy/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-webpy/Config.in b/package/python-webpy/Config.in
index 12dbe61723..5f4df7832b 100644
--- a/package/python-webpy/Config.in
+++ b/package/python-webpy/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_WEBPY
 	bool "python-webpy"
 	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_HASHLIB
 	help
 	  web.py is a web framework for Python that is as simple as it
 	  is powerful.
-- 
2.11.0
