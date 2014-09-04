From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  4 Sep 2014 21:59:56 +0200
Subject: [Buildroot] [PATCH 2/2] package/setserial: Depends on host-groff
In-Reply-To: <1409860796-22704-1-git-send-email-bernd.kuhls@t-online.de>
References: <1409860796-22704-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1409860796-22704-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/d5b/d5ba361a5c3829d789fe647fe785ab81efd9bbe1/
http://autobuild.buildroot.net/results/4d6/4d61f60ed94a7a1ddb1bc1b11173967e1d65c8d3/
http://autobuild.buildroot.net/results/3dc/3dcda657089a8489910c1ca973f900a34370275c/
http://autobuild.buildroot.net/results/86e/86efc44200e80f6baee6846354ce77ef0aa7064d/
http://autobuild.buildroot.net/results/713/713a68be2b71a8d5982add15c2b71e666a83d316/
http://autobuild.buildroot.net/results/c8e/c8e7458911c54020ff999452b9d86a48a03e6693/
http://autobuild.buildroot.net/results/dc2/dc214aec1cf90e6c874c9fd7cbe71027ebe13ed6/
http://autobuild.buildroot.net/results/3f2/3f2c84d9081c3b4ace3d2d20dfb9ddbb58632889/
http://autobuild.buildroot.net/results/a59/a59465462679891b5fa6559804c954c99c7b247b/
http://autobuild.buildroot.net/results/c73/c736933d4110865008f2d1e8b531b6e392c68285/
http://autobuild.buildroot.net/results/27b/27beeaa1147103d44a172cf3e4ed23623f1794c3/
http://autobuild.buildroot.net/results/62b/62bc0a90c747bde8b0631a67d3d35a994c2035c1/
http://autobuild.buildroot.net/results/5ef/5ef1c6a65a48b21fba1390eaa421a628755ea079/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/setserial/setserial.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index d4c0396..70c0116 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -10,6 +10,7 @@ SETSERIAL_SOURCE = setserial_$(SETSERIAL_VERSION).orig.tar.gz
 SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20131001T214925Z/pool/main/s/setserial
 SETSERIAL_LICENSE = GPLv2
 SETSERIAL_LICENSE_FILES = debian/copyright
+SETSERIAL_DEPENDENCIES = host-groff
 
 define SETSERIAL_APPLY_DEBIAN_PATCHES
 	# Touching gorhack.h is needed for the Debian patch 18 to work
-- 
1.7.10.4
