From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  1 Jun 2021 16:34:12 +0200
Subject: [Buildroot] [PATCHv4 07/16] package/boost: use
 BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <20210601143422.25064-1-patrickdepinguin@gmail.com>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
Message-ID: <20210601143422.25064-8-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

BR2_ENABLE_DEBUG should just steer the availability of debug symbols and
should have no negative effect on performance.

Introduction of 'assert' statements, 'debug'-type builds with additional
logging, etc. should be steered by BR2_ENABLE_RUNTIME_DEBUG instead.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
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
-- 
2.26.3
