From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 17 Mar 2015 18:36:35 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/avrdude: optionally depends on
	libftdi or libftdi1
Message-ID: <1426613796-4921-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avrdude supports both libftdi and libftdi1.

Because libftdi is already an optional dependency, this patch adds
libftdi1 as optional dependency as well, but privileges libftdi1 over
libftdi (accdording to what is done in  avrdude's configure script).

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2->v3:
- rebase
- re-introduce optional libftdi dependency (ThomasP)
- reword commit log

changes v1->v2:
- rebase
---
 package/avrdude/avrdude.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
index 03d6490..1811893 100644
--- a/package/avrdude/avrdude.mk
+++ b/package/avrdude/avrdude.mk
@@ -17,7 +17,9 @@ AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
 AVRDUDE_LICENSE = GPLv2+
 AVRDUDE_LICENSE_FILES = avrdude/COPYING
 
-ifeq ($(BR2_PACKAGE_LIBFTDI),y)
+ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
+AVRDUDE_DEPENDENCIES += libftdi1
+else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 AVRDUDE_DEPENDENCIES += libftdi
 endif
 
-- 
2.1.0
