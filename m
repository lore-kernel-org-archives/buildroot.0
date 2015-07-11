From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 16:35:17 +0200
Subject: [Buildroot] [git commit] python-pygame: remove python dependency
Message-ID: <20150711143742.E50D880E23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6874f5bac94c9cefbf09f3ded4cf4bce66c70e25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the dependency on BR2_PACKAGE_PYTHON it was only possible to
build the package with python2. However, python-pygame works with
python3 so enable it to be built with it.

Signed-off-by: Peter Bouda <pbouda@cidles.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pygame/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/python-pygame/Config.in b/package/python-pygame/Config.in
index f72ee31..932b0f1 100644
--- a/package/python-pygame/Config.in
+++ b/package/python-pygame/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYGAME
 	bool "python-pygame"
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_SDL
 	help
 	  Pygame is a cross-platfrom library designed to make it easy to write
