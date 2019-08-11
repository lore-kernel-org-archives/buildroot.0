From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 14:56:42 +0200
Subject: [Buildroot] [git commit] package/bind: remove /usr/sbin/tsig-keygen
 if server is not selected
Message-ID: <20190811125337.1B18B82AFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3d53bd049e8b35d9aec9564f4a1741681ea44cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it is left as a dangling symlink to ddns-confgen, which is
also removed.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
