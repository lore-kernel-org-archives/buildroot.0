From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  2 Dec 2019 21:20:06 +0100
Subject: [Buildroot] [PATCH 2/2] package/nss-mdns: disable tests
In-Reply-To: <20191202202006.1805774-1-fontaine.fabrice@gmail.com>
References: <20191202202006.1805774-1-fontaine.fabrice@gmail.com>
Message-ID: <20191202202006.1805774-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable tests that depend on check and have been added in version 0.11
with
https://github.com/lathiat/nss-mdns/commit/7b649a32836af3578a2bb60aa713588f0d9f9a83

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nss-mdns/nss-mdns.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index e399da6743..77ab6c1ede 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -9,6 +9,7 @@ NSS_MDNS_SITE = \
 	https://github.com/lathiat/nss-mdns/releases/download/v$(NSS_MDNS_VERSION)
 NSS_MDNS_LICENSE = LGPL-2.1+
 NSS_MDNS_LICENSE_FILES = LICENSE
+NSS_MDNS_CONF_OPTS = --disable-tests
 
 # add mdns4_minimal / mdns around the dns provider if missing
 define NSS_MDNS_INSTALL_CONFIG
-- 
2.24.0
