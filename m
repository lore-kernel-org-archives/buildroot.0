From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 00:01:35 +0200
Subject: [Buildroot] [git commit] libiio: BR2_PACKAGE_LIBIIO_TESTS requires
	BR2_PACKAGE_LIBIIO_XML_BACKEND
Message-ID: <20160705220142.5D47C81E06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9dfceee4e5c58e2ad35bf7ce5299a48835db76ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libiio/Config.in b/package/libiio/Config.in
index e7a5d18..69269e0 100644
--- a/package/libiio/Config.in
+++ b/package/libiio/Config.in
@@ -63,6 +63,7 @@ comment "IIO Daemon needs a toolchain w/ threads"
 config BR2_PACKAGE_LIBIIO_TESTS
 	bool "Install test programs"
 	select BR2_PACKAGE_LIBIIO_LOCAL_BACKEND
+	select BR2_PACKAGE_LIBIIO_XML_BACKEND
 	select BR2_PACKAGE_LIBIIO_NETWORK_BACKEND
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
