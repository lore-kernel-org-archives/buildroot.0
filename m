From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Jul 2011 09:23:46 +0200
Subject: [Buildroot] [git commit] target: default to i586 for x86
Message-ID: <20110705072700.454BC8A2ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1fa6b1c276bc3e8e957c3442cdca68bd893ce552
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The i586 was introduced almost 20 years ago, and some software
(NPTL, libstdc++, ..) doesn't work nicely with i386 anymore, so
it is time to move on.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 7c80945..23946e8 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -232,7 +232,7 @@ endchoice
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_i386
-	default BR2_x86_i386
+	default BR2_x86_i586
 	help
 	  Specific CPU variant to use
 
-- 
1.7.3.4
