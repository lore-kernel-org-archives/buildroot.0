From: unixmania at gmail.com <unixmania@gmail.com>
Date: Fri,  9 Aug 2019 18:53:21 -0300
Subject: [Buildroot] [PATCH] package/bind: remove /usr/sbin/tsig-keygen if
 server is not selected
Message-ID: <20190809215321.7874-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Otherwise it is left as a dangling symlink to ddns-confgen, which is
also removed.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index feec6fe27d..abbd784e12 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -18,7 +18,7 @@ BIND_TARGET_SERVER_SBIN += dnssec-settime dnssec-verify genrandom
 BIND_TARGET_SERVER_SBIN += isc-hmac-fixup named-journalprint nsec3hash
 BIND_TARGET_SERVER_SBIN += lwresd named named-checkconf named-checkzone
 BIND_TARGET_SERVER_SBIN += named-compilezone rndc rndc-confgen dnssec-dsfromkey
-BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone
+BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone tsig-keygen
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
 BIND_CONF_ENV = \
 	BUILD_CC="$(TARGET_CC)" \
-- 
2.18.1
