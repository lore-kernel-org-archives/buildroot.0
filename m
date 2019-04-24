From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:58:38 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/thrift: drop
 unneeded static openssl workaround
Message-ID: <20190424195441.979FD7F9BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5f04336874edb605547bba362641428116d7a72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

thrift uses pkg-config to find openssl dependencies such as lz or
latomic so drop unneeded workaround. This was a leftover from the very
first integration of thrift 0.9.1 in 2013.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 8b84b9016238cb28f71bebb7438c3c57e7fb7725)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thrift/thrift.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 8a284229a1..6014bbfcdd 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -31,8 +31,6 @@ endif
 
 # thrift doesn't use the regular flags BUILD_{STATIC,SHARED}_LIBS
 ifeq ($(BR2_STATIC_LIBS),y)
-# openssl uses zlib, so we need to explicitly link with it when static
-THRIFT_CONF_ENV += LIBS=-lz
 THRIFT_CONF_OPTS += -DWITH_STATIC_LIB=ON -DWITH_BOOST_STATIC=ON -DWITH_SHARED_LIB=OFF
 else ifeq ($(BR2_SHARED_LIBS),y)
 THRIFT_CONF_OPTS += -DWITH_STATIC_LIB=OFF -DWITH_BOOST_STATIC=OFF -DWITH_SHARED_LIB=ON
