From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 20 Jul 2015 19:47:49 +0200
Subject: [Buildroot] [PATCH 01/11] package/ulogd: remove autoreconf
Message-ID: <1437414479-16714-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Autoreconf is not needed anymore since ulogd 2.0.4
where logd-01-pthread-conditional.patch was removed.

commit: 010745a955b6cf4c979588fafdb7506460038e0f

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/ulogd/ulogd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 7ff5b73..7730198 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -8,7 +8,6 @@ ULOGD_VERSION = 2.0.5
 ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
 ULOGD_CONF_OPTS = --with-dbi=no --with-pgsql=no
-ULOGD_AUTORECONF = YES
 ULOGD_DEPENDENCIES = host-pkgconf \
 	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
 	libnfnetlink
-- 
2.4.3
