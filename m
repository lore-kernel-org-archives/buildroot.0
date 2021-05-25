From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 25 May 2021 14:27:45 +0200
Subject: [Buildroot] [PATCHv3 10/15] package/ripgrep: use
 BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
In-Reply-To: <20210525122750.5022-1-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
Message-ID: <20210525122750.5022-11-patrickdepinguin@gmail.com>
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
 package/ripgrep/ripgrep.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 9dd8d58de1..c3c12fd185 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -18,7 +18,7 @@ RIPGREP_CARGO_OPTS = \
 	--target=$(RUSTC_TARGET_NAME) \
 	--manifest-path=$(@D)/Cargo.toml
 
-ifeq ($(BR2_ENABLE_DEBUG),y)
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
 RIPGREP_CARGO_BIN_SUBDIR = debug
 else
 RIPGREP_CARGO_OPTS += --release
-- 
2.26.3
