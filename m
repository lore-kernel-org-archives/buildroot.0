From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Mon,  3 May 2021 15:30:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: update upstream URL
Message-ID: <20210503133001.22665-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old URL does not work anymore and the package relies on
sources.buildroot.net.  As indicated by boost's website:
https://www.boost.org/users/news/boost_has_moved_downloads_to_jfr.html

"The service that Boost uses to serve up its releases, Bintray.com is
being retired by JFrog on the 1st of May. Fortunately for Boost, they
have a new service, called JFrog.Arifactory, which we have transitioned
to.

For the users of Boost, the only difference is that there is a new URL
to download releases and snapshots."

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
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
-- 
2.31.1
