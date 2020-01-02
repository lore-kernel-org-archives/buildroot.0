From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 09:23:06 +0100
Subject: [Buildroot] [git commit] package/samba4: AD DC needs python3
Message-ID: <20200102081335.0CC328EB54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4485a75859fbae99090b065ddd7c088a65571d37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python3 is mandatory since version 4.11 and
https://gitlab.com/samba-team/samba/commit/63d20d7822ead1626f7cb41fdbae6c9300893314

As a result, AD DC needs python3

Fixes:
 - http://autobuild.buildroot.org/results/7af629b8acc92c81e006b1b87ae9a6fd461cf96d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/samba4/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index a6997c13eb..493c79f3f8 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -31,10 +31,14 @@ if BR2_PACKAGE_SAMBA4
 
 config BR2_PACKAGE_SAMBA4_AD_DC
 	bool "AD DC"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_JANSSON
 	help
 	  Enable Active Directory Domain Controller functionality.
 
+comment "AD DC depends on python3"
+	depends on !BR2_PACKAGE_PYTHON3
+
 config BR2_PACKAGE_SAMBA4_ADS
 	bool "ADS"
 	select BR2_PACKAGE_OPENLDAP
