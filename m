From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 11:25:26 +0200
Subject: [Buildroot] [git commit] package/bind: ignore CVE-2017-3139
Message-ID: <20210424090312.72D4C8439F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=357dd51bbdc7219fa70cb562cd4dd685873c50c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This CVE is only relevant to the configuration of a specific
RHEL release (6.x).

https://bugzilla.redhat.com/show_bug.cgi?id=1447743

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bind/bind.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 8e8896f3cc..d1a992b66e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -13,6 +13,8 @@ BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
 BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
 BIND_CPE_ID_VENDOR = isc
+# Only applies to RHEL6.x with DNSSEC validation on
+BIND_IGNORE_CVES = CVE-2017-3139
 BIND_TARGET_SERVER_SBIN = arpaname ddns-confgen dnssec-checkds dnssec-coverage
 BIND_TARGET_SERVER_SBIN += dnssec-importkey dnssec-keygen dnssec-revoke
 BIND_TARGET_SERVER_SBIN += dnssec-settime dnssec-verify genrandom
