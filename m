From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Aug 2011 08:36:01 +0200
Subject: [Buildroot] [git commit] binutils: default to 2.21 on sh
Message-ID: <20110816063719.8908E8C980@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=57fb63e34d7816d82d7f8947dfde2edc9e739e50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uClibc currently doesn't build on sh with 2.21.1, similar to the mips
issue (92496e0).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index f6e34ce..7de59f0 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,7 +2,7 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
-	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel)
+	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
 	default BR2_BINUTILS_VERSION_2_21_1
 	help
 	  Select the version of binutils you wish to use.
-- 
1.7.3.4
