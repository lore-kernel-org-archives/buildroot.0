From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 22:30:05 +0100
Subject: [Buildroot] [git commit] python-msgpack: remove useless 'depends
	on' in comment
Message-ID: <20160310213529.AD6C68184B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=597467169f7bee48702f5ed116cd7c8c13876ac2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 6709fad224692ae5e0788bbd30145f7d622b52a4, python-msgpack was
bumped to a new version that has support for Python 3. The "depends on
BR2_PACKAGE_PYTHON' was removed for the main python-msgpack Config.in
option, but not from the comment. This commit fixes this
inconsistency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-msgpack/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-msgpack/Config.in b/package/python-msgpack/Config.in
index 7206c22..7dfe8e8 100644
--- a/package/python-msgpack/Config.in
+++ b/package/python-msgpack/Config.in
@@ -13,5 +13,4 @@ config BR2_PACKAGE_PYTHON_MSGPACK
 
 comment "python-msgpack needs a toolchain w/ C++"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_PACKAGE_PYTHON
 	depends on !BR2_INSTALL_LIBSTDCPP
