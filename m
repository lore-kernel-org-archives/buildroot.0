From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Mar 2016 21:16:56 +0100
Subject: [Buildroot] [PATCH 2/2] python-msgpack: remove useless 'depends on'
	in comment
In-Reply-To: <1457641016-3054-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1457641016-3054-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1457641016-3054-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 6709fad224692ae5e0788bbd30145f7d622b52a4, python-msgpack was
bumped to a new version that has support for Python 3. The "depends on
BR2_PACKAGE_PYTHON' was removed for the main python-msgpack Config.in
option, but not from the comment. This commit fixes this
inconsistency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
2.6.4
