From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Sat, 2 Sep 2017 19:33:13 +0300
Subject: [Buildroot] [PATCH] xl2tp: Drop OpenSSL dependency
Message-ID: <CADmjQguHchEn_Tg7yC+4UjD8mW79ySOn-Ko7V=wicmsmPtz_ZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xl2tp does not depend on OpenSSL since version 1.3.4.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
---
 package/xl2tp/Config.in | 1 -
 package/xl2tp/xl2tp.mk  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/xl2tp/Config.in b/package/xl2tp/Config.in
index f0b1e83..7e2d2f6 100644
--- a/package/xl2tp/Config.in
+++ b/package/xl2tp/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_XL2TP
        bool "xl2tp"
        depends on BR2_USE_MMU # fork()
        select BR2_PACKAGE_LIBPCAP
-       select BR2_PACKAGE_OPENSSL
        help
          Layer 2 Tunnelling Protocol (RFC2661).

diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index ff802a4..26f4d1e 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -6,7 +6,7 @@

 XL2TP_VERSION = v1.3.8
 XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
-XL2TP_DEPENDENCIES = libpcap openssl
+XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPLv2
 XL2TP_LICENSE_FILES = LICENSE

-- 
2.14.1
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170902/ce788202/attachment.html>
