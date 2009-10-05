From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Oct 2009 14:01:38 +0200
Subject: [Buildroot] [git commit master] do not append localversion
	automatically
Message-ID: <20091005120203.E998D7770A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3ae324f856775c7b0e265c8c35baf6dff40f7a52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

prevents build failures if modules are enabled and localversion is ""

Signed-off-by: aldot <rep.dot.nop@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/device/mips/linux26.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target/device/mips/linux26.config b/target/device/mips/linux26.config
index 563e9ae..0bcff2f 100644
--- a/target/device/mips/linux26.config
+++ b/target/device/mips/linux26.config
@@ -189,7 +189,7 @@ CONFIG_INIT_ENV_ARG_LIMIT=32
 # General setup
 #
 CONFIG_LOCALVERSION=""
-CONFIG_LOCALVERSION_AUTO=y
+# CONFIG_LOCALVERSION_AUTO is not set
 CONFIG_SWAP=y
 CONFIG_SYSVIPC=y
 # CONFIG_IPC_NS is not set
-- 
1.6.3.3
