From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Dec 2015 22:34:33 +0100
Subject: [Buildroot] [git commit] wireshark: needs host-pkgconf
Message-ID: <20151203214015.CAC558198C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=96d667c46a3e384f7791012936dd268a9ae7da9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for detection of various optional components.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 867b945..5d1d5f6 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -9,7 +9,7 @@ WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
 WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
-WIRESHARK_DEPENDENCIES = libpcap libgcrypt libglib2
+WIRESHARK_DEPENDENCIES = host-pkgconf libpcap libgcrypt libglib2
 WIRESHARK_CONF_ENV = \
 	LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
 	ac_cv_path_PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
