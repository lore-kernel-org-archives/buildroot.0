From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Mar 2019 22:20:59 +0100
Subject: [Buildroot] [PATCH 2/2] package/ulogd: use --without-dbi
In-Reply-To: <20190314212059.20817-1-fontaine.fabrice@gmail.com>
References: <20190314212059.20817-1-fontaine.fabrice@gmail.com>
Message-ID: <20190314212059.20817-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use --without-dbi instead of --with-dbi=off

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ulogd/ulogd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 8fecc0ed38..a2cad40677 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -7,7 +7,7 @@
 ULOGD_VERSION = 2.0.7
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
-ULOGD_CONF_OPTS = --with-dbi=no
+ULOGD_CONF_OPTS = --without-dbi
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
 	libnfnetlink
-- 
2.14.1
