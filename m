From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 May 2013 23:08:05 +0200
Subject: [Buildroot] [git commit] boost: Limit architectures which can build
	boost context library
Message-ID: <20130523211146.26C939A4E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d624203238b2565ba180d5bad45ecc86c3cac620
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The boost context library needs porting to each new architecture
and only a limited number of ports are currently available.

Signed-off-by: Will Newton <will.newton@linaro.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/boost/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index e36e7d3..5c65b2f 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -23,6 +23,8 @@ config BR2_PACKAGE_BOOST_CHRONO
 
 config BR2_PACKAGE_BOOST_CONTEXT
 	bool "boost-context"
+	depends on (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel \
+			|| BR2_powerpc || BR2_sparc || BR2_x86_64)
 
 config BR2_PACKAGE_BOOST_DATE_TIME
 	bool "boost-date_time"
