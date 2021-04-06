From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 11:20:55 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/samba4: AD DC
 support needs ADS
Message-ID: <20210406090707.7B7AD82AA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=047f1b799cae533d30a8fa0f6a9808c55449e40b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Needed due to upstream commit:
https://gitlab.com/samba-team/samba/-/commit/607c9ab307db36aee0604d209a13b45d28c63d9b

Fixes:
http://autobuild.buildroot.net/results/b3f/b3fe797408b9041de37433602b3a47211818e44b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d38d99c77ddc8a38e10ff6a10ab229435f6ebac7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index a34eaa8088..552afe90cd 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -32,6 +32,7 @@ config BR2_PACKAGE_SAMBA4_AD_DC
 	bool "AD DC"
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_SAMBA4_ADS
 	help
 	  Enable Active Directory Domain Controller functionality.
 
