From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 15 Jan 2020 09:09:25 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/python-can: add missing
 dependency
In-Reply-To: <20200115080926.6669-1-yegorslists@googlemail.com>
References: <20200115080926.6669-1-yegorslists@googlemail.com>
Message-ID: <20200115080926.6669-2-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Recent python-can versions depend on aenum package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - no changes

 package/python-can/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index f3ed1b77e3..73f667e73a 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_CAN
 	select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON_TYPING if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_WRAPT # runtime
+	select BR2_PACKAGE_PYTHON_AENUM # runtime
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
 	help
-- 
2.17.0
