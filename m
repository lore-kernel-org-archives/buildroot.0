From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:44:45 +0200
Subject: [Buildroot] [git commit] package/mongodb: needs PCRE with UTF
 support
Message-ID: <20190424204000.4B9F18045A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f23f7045413943c27ba7e0f7ff180570b709566
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mongodb needs PCRE with UTF-8 support, see:
https://docs.mongodb.com/manual/reference/operator/query/regex/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
