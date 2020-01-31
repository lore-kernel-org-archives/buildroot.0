From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Jan 2020 08:01:37 +0100
Subject: [Buildroot] [git commit] package/python-can: add missing dependency
Message-ID: <20200131065647.7566386AC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce0f9052f59c4c25fe822aad3d47e41976b39ef5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python-can depends on aenum package since 3.2.0:

https://github.com/hardbyte/python-can/commit/dcf87ce3712244bdde7cb4692901950ffcec2215

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-can/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index f3ed1b77e3..3d06374c6a 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_CAN
 	select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON_TYPING if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_AENUM # runtime
 	select BR2_PACKAGE_PYTHON_WRAPT # runtime
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
