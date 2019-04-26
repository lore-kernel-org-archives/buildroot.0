From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 15:00:16 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/mongodb: needs
 PCRE with UTF support
Message-ID: <20190426130223.B805880163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=637c1341fa881e1fbf9d53b2be5a10257bde6487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

mongodb needs PCRE with UTF-8 support, see:
https://docs.mongodb.com/manual/reference/operator/query/regex/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2f23f7045413943c27ba7e0f7ff180570b709566)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 7df502add6..9c5dba8347 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_MONGODB
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE_UTF # runtime
 	select BR2_PACKAGE_SNAPPY
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_YAML_CPP
