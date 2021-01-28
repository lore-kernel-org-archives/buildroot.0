From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 19:34:13 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/openldap:
 security bump to version 2.4.57
Message-ID: <20210128200058.5762681607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b72c7f8d95cea9234ee73c69142805fdccafeb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes the following security issues:

- CVE-2020-36221: An integer underflow was discovered in OpenLDAP before
  2.4.57 leading to slapd crashes in the Certificate Exact Assertion
  processing, resulting in denial of service (schema_init.c
  serialNumberAndIssuerCheck).

- CVE-2020-36222: A flaw was discovered in OpenLDAP before 2.4.57 leading to
  an assertion failure in slapd in the saslAuthzTo validation, resulting in
  denial of service.

- CVE-2020-36223: A flaw was discovered in OpenLDAP before 2.4.57 leading to
  a slapd crash in the Values Return Filter control handling, resulting in
  denial of service (double free and out-of-bounds read).

- CVE-2020-36224: A flaw was discovered in OpenLDAP before 2.4.57 leading to
  an invalid pointer free and slapd crash in the saslAuthzTo processing,
  resulting in denial of service.

- CVE-2020-36225: A flaw was discovered in OpenLDAP before 2.4.57 leading to
  a double free and slapd crash in the saslAuthzTo processing, resulting in
  denial of service.

- CVE-2020-36226: A flaw was discovered in OpenLDAP before 2.4.57 leading to
  a memch->bv_len miscalculation and slapd crash in the saslAuthzTo
  processing, resulting in denial of service.

- CVE-2020-36227: A flaw was discovered in OpenLDAP before 2.4.57 leading to
  an infinite loop in slapd with the cancel_extop Cancel operation,
  resulting in denial of service.

- CVE-2020-36228: An integer underflow was discovered in OpenLDAP before
  2.4.57 leading to a slapd crash in the Certificate List Exact Assertion
  processing, resulting in denial of service.

- CVE-2020-36229: A flaw was discovered in ldap_X509dn2bv in OpenLDAP before
  2.4.57 leading to a slapd crash in the X.509 DN parsing in ad_keystring,
  resulting in denial of service.

- CVE-2020-36230: A flaw was discovered in OpenLDAP before 2.4.57 leading in
  an assertion failure in slapd in the X.509 DN parsing in decode.c
  ber_next_element, resulting in denial of service.

https://www.openldap.org/software/release/changes.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 46c4c9684d24109f60711d1adb65ff19965edf05)
[Peter: mark as security bump, add CVE info]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openldap/openldap.hash | 10 +++++-----
 package/openldap/openldap.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 4908f6e69e..f2ffdf53bc 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,7 +1,7 @@
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.56.md5
-md5  82a7dcf7aeaf95fdad16017c0ed9983a  openldap-2.4.56.tgz
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.56.sha1
-sha1  4c617b87bd50ef8d071e7deb7525af79b08d4910  openldap-2.4.56.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.57.md5
+md5  e3349456c3a66e5e6155be7ddc3f042c  openldap-2.4.57.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.57.sha1
+sha1  1cffa70a3ea8545948041fd113f8f53bc24d6d87  openldap-2.4.57.tgz
 # Locally computed
-sha256  25520e0363c93f3bcb89802a4aa3db33046206039436e0c7c9262db5a61115e0  openldap-2.4.56.tgz
+sha256  c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a  openldap-2.4.57.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index e44c958c41..e361fc420c 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.56
+OPENLDAP_VERSION = 2.4.57
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
