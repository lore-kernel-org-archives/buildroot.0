From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 22:13:28 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/boost: fix broken
 BOOST_SITE URL
Message-ID: <20210511194642.A360386BE1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d277ca3305f815c652aa2f039785a87bfc8e571c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Current URL returns 403 error:

--2021-05-10 10:04:12--  https://dl.bintray.com/boostorg/release/1.75.0/source/boost_1_75_0.tar.bz2
Resolving dl.bintray.com... 18.193.131.58, 3.66.199.110
Connecting to dl.bintray.com|18.193.131.58|:443... connected.
HTTP request sent, awaiting response... 403 Forbidden
2021-05-10 10:04:12 ERROR 403: Forbidden.

Bintray has been sunset on May 1st:
https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/

Update the URL to the new upstream location to fix this issue.

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 345bb230500e91ff547dd56f71580243c075139d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index b8f90bb836..8d745ecc72 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -6,7 +6,7 @@
 
 BOOST_VERSION = 1.75.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
-BOOST_SITE = https://dl.bintray.com/boostorg/release/$(BOOST_VERSION)/source
+BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
 BOOST_INSTALL_STAGING = YES
 BOOST_LICENSE = BSL-1.0
 BOOST_LICENSE_FILES = LICENSE_1_0.txt
