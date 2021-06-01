From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:39:37 +0200
Subject: [Buildroot] [git commit branch/next] package/boost: use
 BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
Message-ID: <20210601201210.4BD6086122@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5107b8740131aa92fddd61f8bef7535c9945bc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

BR2_ENABLE_DEBUG should just steer the availability of debug symbols and
should have no negative effect on performance.

Introduction of 'assert' statements, 'debug'-type builds with additional
logging, etc. should be steered by BR2_ENABLE_RUNTIME_DEBUG instead.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 8d745ecc72..e72ddf897c 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -95,7 +95,7 @@ BOOST_OPTS += --no-cmake-config \
 	     toolset=gcc \
 	     threading=multi \
 	     abi=$(BOOST_ABI) \
-	     variant=$(if $(BR2_ENABLE_DEBUG),debug,release)
+	     variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release)
 
 ifeq ($(BR2_sparc64),y)
 BOOST_OPTS += architecture=sparc instruction-set=ultrasparc
