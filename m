From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  1 Jun 2021 16:34:19 +0200
Subject: [Buildroot] [PATCHv4 14/16] package/zmqpp: use
 BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <20210601143422.25064-1-patrickdepinguin@gmail.com>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
Message-ID: <20210601143422.25064-15-patrickdepinguin@gmail.com>
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
 package/zmqpp/zmqpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index c629f14920..32fabf26ef 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -19,7 +19,7 @@ ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
 # -ffast-math -finline-functions -fomit-frame-pointer are disabled,
 # so only set CONFIG for the non-affected cases.
 ifneq ($(BR2_or1k):$(BR2_TOOLCHAIN_GCC_AT_LEAST_6),y:)
-ZMQPP_CONFIG = $(if $(BR2_ENABLE_DEBUG),buildroot,release)
+ZMQPP_CONFIG = $(if $(BR2_ENABLE_RUNTIME_DEBUG),buildroot,release)
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-- 
2.26.3
