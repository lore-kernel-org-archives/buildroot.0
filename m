From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 22:26:57 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/mariadb: security
 bump to version 10.3.27
Message-ID: <20201211211656.7F52281944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69c1d54fa3c6cf3ae3ed4efe890b059aaab8b0c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fixes the following security issues:

- CVE-2020-15180: during SST a joiner sends an sst method name to the donor.
  Donor then appends it to the "wsrep_sst_" string to get the name of the
  sst script to use, e.g.  wsrep_sst_rsync.  There is no validation or
  filtering here, so if the malicious joiner sends, for example, "rsync `rm
  -rf /`" the donor will execute that too.

- CVE-2020-14812: Vulnerability in the MySQL Server product of Oracle MySQL
  (component: Server: Locking).  Supported versions that are affected are
  5.6.49 and prior, 5.7.31 and prior and 8.0.21 and prior.  Easily
  exploitable vulnerability allows high privileged attacker with network
  access via multiple protocols to compromise MySQL Server.  Successful
  attacks of this vulnerability can result in unauthorized ability to cause
  a hang or frequently repeatable crash (complete DOS) of MySQL Server.

- CVE-2020-14765: Vulnerability in the MySQL Server product of Oracle MySQL
  (component: Server: FTS).  Supported versions that are affected are 5.6.49
  and prior, 5.7.31 and prior and 8.0.21 and prior.  Easily exploitable
  vulnerability allows low privileged attacker with network access via
  multiple protocols to compromise MySQL Server.  Successful attacks of this
  vulnerability can result in unauthorized ability to cause a hang or
  frequently repeatable crash (complete DOS) of MySQL Server.

- CVE-2020-14776: Vulnerability in the MySQL Server product of Oracle MySQL
  (component: InnoDB).  Supported versions that are affected are 5.7.31 and
  prior and 8.0.21 and prior.  Easily exploitable vulnerability allows high
  privileged attacker with network access via multiple protocols to
  compromise MySQL Server.  Successful attacks of this vulnerability can
  result in unauthorized ability to cause a hang or frequently repeatable
  crash (complete DOS) of MySQL Server.

- CVE-2020-14789: Vulnerability in the MySQL Server product of Oracle MySQL
  (component: Server: FTS).  Supported versions that are affected are 5.7.31
  and prior and 8.0.21 and prior.  Easily exploitable vulnerability allows
  high privileged attacker with network access via multiple protocols to
  compromise MySQL Server.  Successful attacks of this vulnerability can
  result in unauthorized ability to cause a hang or frequently repeatable
  crash (complete DOS) of MySQL Server.

- CVE-2020-28912:
  https://www.usenix.org/system/files/conference/usenixsecurity18/sec18-bui.pdf
  describes a named pipe privilege vulnerability, specifically for MySQL,
  where an unprivileged user, located on the same machine as the server, can
  act as man-in-the-middle between server and client.

Additionally, 10.3.27 fixes a regression added in 10.3.26.

Drop weak md5/sha1 checksums.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 163334a707a0d85480019d83b23a341e470c37ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 8 +++-----
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 9de97360a4..a210dd9dad 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,8 +1,6 @@
-# From https://downloads.mariadb.org/mariadb/10.3.23
-md5  473950893d29805d9384ec0ed5d7c276  mariadb-10.3.23.tar.gz
-sha1  c95b6d4cff5e6d63eed05da20561802b9c83e717  mariadb-10.3.23.tar.gz
-sha256  fc405022457d8eec5991b870cc1c9a07b83b551d6165c414c4d8f31523aa86ae  mariadb-10.3.23.tar.gz
-sha512  535cd2ce80a95b6c0a1aa559cc3275dfcd559c3a4f958fab3382923190a16e6bc5b4ad79acaa518244512ff618568c239c0edef8a701d958362ede19a29c2986  mariadb-10.3.23.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.27
+sha256  0dadc1650ab2ff40caab58210e93b106ae1e3d1a82e5b0fd92c795b8b43e4619  mariadb-10.3.27.tar.gz
+sha512  1ebfdfa3ef6e13e92615ac2fb6995362ca60fe78f57ff3cf9e384517f95eaf4c701e60fe0977b1eee73889cdfe3367720da9a9bae3dd1a09a4558114ba593369  mariadb-10.3.27.tar.gz
 
 # Hash for license files
 sha256  a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 1d0be060df..83965d0437 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.23
+MARIADB_VERSION = 10.3.27
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
