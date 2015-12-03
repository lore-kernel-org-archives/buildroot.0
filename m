From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Dec 2015 22:34:04 +0100
Subject: [Buildroot] [git commit] wireshark: forcibly disable lua
Message-ID: <20151203214015.AAD0A8198C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=752ee252d0fe3205f937f87f19e70c6fffd1a0d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If host arch = target arch and liblua is in the host the buildsystem
will pick it up and try to use it since it passes basic build tests.
Forcibly disable it, since it causes no build failure, rather runtime
failures because said liblua is not present on the target.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wireshark/wireshark.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 366134d..867b945 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -26,6 +26,7 @@ WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
 	--with-gnutls=no \
 	--with-libsmi=no \
+	--with-lua=no \
 	--includedir=$(STAGING_DIR)/usr/include
 
 $(eval $(autotools-package))
