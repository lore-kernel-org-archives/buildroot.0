From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:29:52 +0200
Subject: [Buildroot] [git commit] package/thrift: drop unneeded static
 openssl workaround
Message-ID: <20190413143605.A80BA812DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b84b9016238cb28f71bebb7438c3c57e7fb7725
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

thrift uses pkg-config to find openssl dependencies such as lz or
latomic so drop unneeded workaround. This was a leftover from the very
first integration of thrift 0.9.1 in 2013.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
