From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Oct 2015 10:43:49 -0300
Subject: [Buildroot] [PATCH 2/2] cpio: install to /bin and after busybox
In-Reply-To: <1443793429-3117-1-git-send-email-gustavo@zacarias.com.ar>
References: <1443793429-3117-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1443793429-3117-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the usual rule consider full-blown packages superior to busybox,
hence build after it.
Also install cpio to /bin to override the busybox-provided one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cpio/cpio.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cpio/cpio.mk b/package/cpio/cpio.mk
index ca8463e..1576127 100644
--- a/package/cpio/cpio.mk
+++ b/package/cpio/cpio.mk
@@ -6,6 +6,8 @@
 
 CPIO_VERSION = 2.12
 CPIO_SITE = http://ftp.gnu.org/gnu/cpio
+CPIO_CONF_OPTS = --bindir=/bin
+CPIO_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 CPIO_LICENSE = GPLv3+
 CPIO_LICENSE_FILES = COPYING
 
-- 
2.4.9
