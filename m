From: Markos Chandras <markos.chandras@gmail.com>
Date: Thu, 23 May 2013 17:28:01 +0100
Subject: [Buildroot] [PATCH v2] mongrel2: Needs a {e,
	}glibc or a uClibc-0.9.34-git based toolchain
Message-ID: <1369326481-18848-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

mongrel2 needs the {get,make,swap}context functions which are
present in {e,}glibc and in the uClibc's master branch.

Fixes:
http://autobuild.buildroot.net/results/8e132a2b03a7b5ae94199db7db86883c05dca700/build-end.log

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/mongrel2/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index 05d10d7..034dbf9 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -6,6 +6,12 @@ config BR2_PACKAGE_MONGREL2
 	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_LARGEFILE # zeromq -> util-linux
 	depends on BR2_USE_WCHAR # zeromq -> util-linux
+	# {get,make,swap}context functions present in
+	# {e,}glibc and in uClibc's master branch.
+	depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
+		BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
+		BR2_TOOLCHAIN_CTNG_eglibc || \
+		BR2_TOOLCHAIN_CTNG_glibc
 	help
 	  Mongrel2 is an application, language, and network architecture
 	  agnostic web server that focuses on web applications using
-- 
1.8.2.1
