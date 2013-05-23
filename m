From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 May 2013 22:27:53 +0200
Subject: [Buildroot] [git commit] mongrel2: Needs a {e,
	}glibc or a uClibc-0.9.34-git based toolchain
Message-ID: <20130523205040.826219A4E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=faefecd7f6f911b9ccd4ca54a94e9962262e4c7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mongrel2 needs the {get,make,swap}context functions which are
present in {e,}glibc and in the uClibc's master branch.

Fixes:
http://autobuild.buildroot.net/results/8e132a2b03a7b5ae94199db7db86883c05dca700/build-end.log

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mongrel2/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
