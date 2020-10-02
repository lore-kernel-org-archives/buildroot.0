From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:57:41 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-tinyrpc:
 not available for python 2.x
Message-ID: <20201002085241.2E84B8E839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc404eaa082f6d1fe371a6d2c0e37d22bec29eaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
http://autobuild.buildroot.net/results/eef0969bac04800cec51fa27f1e1ecd3a4c8211e/

tinyrpc 1.x is not compatible with python 2.x, leading to errors during the
pycompile step:

error:   File "/usr/lib/python2.7/site-packages/tinyrpc/client.py", line 37
    self, protocol: RPCProtocol, transport: ClientTransport
                  ^
SyntaxError: invalid syntax

As also documented in the README:
The current version will support Python3 only.  Have a look at the 0.9.x
version if you need Python2 support

https://github.com/mbr/tinyrpc/blob/1.0.4/README.rst

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6d87acc19f1cd0bc738bf920b775caf96d7c3c4e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-tinyrpc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-tinyrpc/Config.in b/package/python-tinyrpc/Config.in
index 3c643c754a..3194b7825a 100644
--- a/package/python-tinyrpc/Config.in
+++ b/package/python-tinyrpc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_TINYRPC
 	bool "python-tinyrpc"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  A small, modular, transport and protocol neutral RPC
