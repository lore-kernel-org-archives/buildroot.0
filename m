From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Apr 2021 11:25:29 +0200
Subject: [Buildroot] [git commit] package/bind: ignore CVE-2019-6470
Message-ID: <20210424090312.89EEE84C52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23fb8dd2d007118aa3544e58080f79052f5c6d5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There had existed in one of the ISC BIND libraries a bug in a
function that was used by dhcpd when operating in DHCPv6 mode.
There was also a bug in dhcpd relating to the use of this function
per its documentation, but the bug in the library function
prevented this from causing any harm. All releases of dhcpd from
ISC contain copies of this, and other, BIND libraries in
combinations that have been tested prior to release and are known
to not present issues like this.

Affects: Builds of dhcpd versions prior to version 4.4.1 when
using BIND versions 9.11.2 or later.

https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-6470

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bind/bind.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index d1a992b66e..39c30dab6b 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -15,6 +15,8 @@ BIND_LICENSE_FILES = COPYRIGHT
 BIND_CPE_ID_VENDOR = isc
 # Only applies to RHEL6.x with DNSSEC validation on
 BIND_IGNORE_CVES = CVE-2017-3139
+# Library CVE and not used by bind but used by ISC DHCP
+BIND_IGNORE_CVES += CVE-2019-6470
 BIND_TARGET_SERVER_SBIN = arpaname ddns-confgen dnssec-checkds dnssec-coverage
 BIND_TARGET_SERVER_SBIN += dnssec-importkey dnssec-keygen dnssec-revoke
 BIND_TARGET_SERVER_SBIN += dnssec-settime dnssec-verify genrandom
