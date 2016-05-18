From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 18 May 2016 15:35:04 +0200
Subject: [Buildroot] [PATCH/next 2/2] python-tornado: select
	python-backports-abc for Python 2.x only
In-Reply-To: <1463578504-1257-1-git-send-email-yegorslists@googlemail.com>
References: <1463578504-1257-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1463578504-1257-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

With the introduction of Pyton 3.5 python-backports-abc is only
needed for Python 2.x.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-tornado/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
