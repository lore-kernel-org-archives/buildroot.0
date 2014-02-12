From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Feb 2014 10:14:57 +0100
Subject: [Buildroot] [git commit] boost: test module uses fork()
Message-ID: <20140212091613.871929C99C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e00ee4c83524977dbffe157a5a6b8a9bddae5f5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/17dd7946631354d59336259d5f31aa899e3599b8/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 515b2cd..68c3909 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -77,6 +77,7 @@ config BR2_PACKAGE_BOOST_SYSTEM
 
 config BR2_PACKAGE_BOOST_TEST
 	bool "boost-test"
+	depends on BR2_USE_MMU # fork()
 
 config BR2_PACKAGE_BOOST_THREAD
 	bool "boost-thread"
