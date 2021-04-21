From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 21 Apr 2021 15:42:26 -0500
Subject: [Buildroot] [PATCH 01/10] package/bind: ignore CVE-2017-3139
In-Reply-To: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
References: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210421204235.5956-2-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This CVE is only relevant to the configuration of a specific
RHEL release (6.x).

https://bugzilla.redhat.com/show_bug.cgi?id=1447743

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
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
-- 
2.17.1
