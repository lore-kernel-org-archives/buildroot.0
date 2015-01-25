From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 25 Jan 2015 22:13:52 +0100
Subject: [Buildroot] [PATCH 5/8] package/avrdude: depends on libftdi1
	instead of libftdi
In-Reply-To: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1422220435-18689-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/avrdude/avrdude.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 03d6490..a4e0ebd 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -17,8 +17,8 @@ AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 AVRDUDE_LICENSE = GPLv2+
 AVRDUDE_LICENSE_FILES = avrdude/COPYING
 
-ifeq ($(BR2_PACKAGE_LIBFTDI),y)
-AVRDUDE_DEPENDENCIES += libftdi
+ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
+AVRDUDE_DEPENDENCIES += libftdi1
 endif
 
 # if /etc/avrdude.conf exists, the installation process creates a
-- 
2.2.2
