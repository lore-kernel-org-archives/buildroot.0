From: Jordan Yelloz <jordan@yelloz.me>
Date: Sun, 12 Jun 2016 20:13:40 -0700
Subject: [Buildroot] [PATCH v2 1/1] iptables: exported AR=$(TARGET_AR) to
	make
In-Reply-To: <20160613023826.6329-1-jordan@yelloz.me>
References: <20160613023826.6329-1-jordan@yelloz.me>
Message-ID: <20160613031340.30120-1-jordan@yelloz.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This ensures the correct AR is used for some of the iptables build
process. This is the same fix as
<https://bugs.gentoo.org/show_bug.cgi?id=444282>

Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
---
 package/iptables/iptables.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 12e00f2..b9feaf5 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -17,6 +17,7 @@ IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
 	$(if $(BR2_STATIC_LIBS),,--disable-static)
 # For 0002-iptables-add-xtables-config-parser.h-to-BUILT_SOURCES.patch
 IPTABLES_AUTORECONF = YES
+IPTABLES_MAKE_ENV = AR=$(TARGET_AR)
 
 # For connlabel match
 ifeq ($(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),y)
-- 
2.8.4
