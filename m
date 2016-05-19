From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 19 May 2016 09:00:29 +0200
Subject: [Buildroot] [PATCH v2] python-backports-abc: depend on Python 2.x
Message-ID: <1463641229-6426-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

This package is a backport from Python 3.5, so it is not needed
for Python 3.5.x environment.

Fix python-tornado dependecies, so that python-backports-abc
is only selected for Python 2.x.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v2: sqaush both commits into one (Arnout Vandecappelle)

 package/python-backports-abc/Config.in | 1 +
 package/python-tornado/Config.in       | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-backports-abc/Config.in b/package/python-backports-abc/Config.in
index 26d8cfd..4356627 100644
--- a/package/python-backports-abc/Config.in
+++ b/package/python-backports-abc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BACKPORTS_ABC
 	bool "python-backports-abc"
+	depends on BR2_PACKAGE_PYTHON
 	help
 	  A backport of recent additions to the 'collections.abc'
 	  module.
diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
index ac86682..3ead2af 100644
--- a/package/python-tornado/Config.in
+++ b/package/python-tornado/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_TORNADO
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON_SINGLEDISPATCH if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_BACKPORTS_ABC	# runtime
+	select BR2_PACKAGE_PYTHON_BACKPORTS_ABC	if BR2_PACKAGE_PYTHON # runtime
 	help
 	  Tornado is a Python web framework and asynchronous networking
 	  library, originally developed at FriendFeed.
-- 
2.8.1
