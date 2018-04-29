From: Sven Haardiek <sven.haardiek@iotec-gmbh.de>
Date: Sun, 29 Apr 2018 13:40:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-requests fix dependencies
Message-ID: <20180429114038.25035-1-sven.haardiek@iotec-gmbh.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Requests need hashlib to run. Otherwise it is not possible to import, due to
missing e.g. md5.

Signed-off-by: Sven Haardiek <sven.haardiek@iotec-gmbh.de>
---
 package/python-requests/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-requests/Config.in b/package/python-requests/Config.in
index d2726fb26a..d51b4079cb 100644
--- a/package/python-requests/Config.in
+++ b/package/python-requests/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_PYTHON_REQUESTS
 	select BR2_PACKAGE_PYTHON_CHARDET # runtime
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
+	select BR2_PACKAGE_PYTHON_HASHLIB # runtime
+	select BR2_PACKAGE_PYTHON3_HASHLIB # runtime
 	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-- 
2.17.0
