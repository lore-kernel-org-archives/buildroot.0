From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Jul 2011 15:28:19 +0200
Subject: [Buildroot] [git commit] toolchain-external: sync toolchain options
	with the internal toolchain
Message-ID: <20110726133051.4F2968B4B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=04d0689cc419c0181ddf0f6d4089df97699e9ee3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The internal toolchain defaults to thread support enabled (and
most external toolchains have thread support as well), so enable
BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS by default.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5222702..8cd37d4 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -311,6 +311,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PROGRAM_INVOCATION
 config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
 	bool "Toolchain has threads support?"
 	select BR2_TOOLCHAIN_HAS_THREADS
+	default y
 	help
 	  Select this option if your external toolchain has thread
 	  support. If you don't know, leave the default value,
-- 
1.7.3.4
