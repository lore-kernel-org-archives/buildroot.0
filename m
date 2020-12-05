From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:22:52 +0100
Subject: [Buildroot] [git commit] package/hdparm: bump version to 9.60
Message-ID: <20201205201041.3947881944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c31ad7a4f501ef88edf6ef845f7f0cf20e5c44c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes according to [1] and [2]:

- decode more bits from id[69], courtesy Adri??n K??lazi.
- allow passing of custom LDFLAGS from the environment.
- add new "static" target.
- fix --dco-identify max sectors, courtesy of Paul Sultana.
- get rid of leftover "unknown" variables from identify.c
- fixed return values from get_log_page_data().
- support for ioSafe Solo with jMicron bridge.

[1] https://sourceforge.net/p/hdparm/news/2020/11/hdparm-959-is-released
[2] https://sourceforge.net/p/hdparm/news/2020/11/hdparm-960-is-released

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hdparm/hdparm.hash | 8 ++++----
 package/hdparm/hdparm.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/hdparm/hdparm.hash b/package/hdparm/hdparm.hash
index 4251b5a65c..b35da45273 100644
--- a/package/hdparm/hdparm.hash
+++ b/package/hdparm/hdparm.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/hdparm/files/hdparm/
-md5 4652c49cf096a64683c05f54b4fa4679  hdparm-9.58.tar.gz
-sha1 b3425a141f1c0fe9f53b18631437129c2155ee45  hdparm-9.58.tar.gz
+md5  25a791d47236c58801f8b27074f3ef93  hdparm-9.60.tar.gz
+sha1  f15378cf533f79dbbc040cd77183137d24292ecc  hdparm-9.60.tar.gz
 # Locally computed
-sha256  9ae78e883f3ce071d32ee0f1b9a2845a634fc4dd94a434e653fdbef551c5e10f hdparm-9.58.tar.gz
-sha256  eae572b06d2733f5c65fbe81680ce2b8a109afee2bdd1a161343c772af0e82e1 LICENSE.TXT
+sha256  8397739c73e44d5ab96c4aef28fa9c0147276d53a1b5657ce04c4565cf6635cc  hdparm-9.60.tar.gz
+sha256  eae572b06d2733f5c65fbe81680ce2b8a109afee2bdd1a161343c772af0e82e1  LICENSE.TXT
diff --git a/package/hdparm/hdparm.mk b/package/hdparm/hdparm.mk
index 9826dde010..d9470ef7f5 100644
--- a/package/hdparm/hdparm.mk
+++ b/package/hdparm/hdparm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HDPARM_VERSION = 9.58
+HDPARM_VERSION = 9.60
 HDPARM_SITE = http://downloads.sourceforge.net/project/hdparm/hdparm
 HDPARM_LICENSE = BSD-Style
 HDPARM_LICENSE_FILES = LICENSE.TXT
