From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 19:06:47 +0200
Subject: [Buildroot] [git commit] polarssl: programs need MMU
Message-ID: <20140715170654.877BA9D248@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e111e0eb8c0bb85e42ed1192505ecec6893d2ada
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b53/b535dfda85c8a25c5192c4be7540c4e852fce717/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/polarssl/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/polarssl/Config.in b/package/polarssl/Config.in
index 70cde57..90788d8 100644
--- a/package/polarssl/Config.in
+++ b/package/polarssl/Config.in
@@ -17,6 +17,7 @@ if BR2_PACKAGE_POLARSSL
 
 config BR2_PACKAGE_POLARSSL_PROGRAMS
 	bool "polarssl programs"
+	depends on BR2_USE_MMU # fork()
 	help
 	  This option enables the installation and the build of
 	  PolarSSL companion programs: aescrypt2, benchmark, cert_app,
