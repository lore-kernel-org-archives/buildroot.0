From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2019 22:25:38 +0100
Subject: [Buildroot] [git commit] package/nss-mdns: disable tests
Message-ID: <20191202211933.C623C83A1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a94e62aa6ee9c377ac5be3e467da3bebda1786be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable tests that depend on check and have been added in version 0.11
with
https://github.com/lathiat/nss-mdns/commit/7b649a32836af3578a2bb60aa713588f0d9f9a83

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
