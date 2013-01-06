From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 22:09:26 +0100
Subject: [Buildroot] [git commit] inadyn: Needs MMU
Message-ID: <20130106211200.9ADD69A59C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af5583f2a032d7ca2c6ed6e9b2727987e3fa04ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/11d681a7f2c1d55a3d70573e9145aa231f6d4298/build-end.log

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/inadyn/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
index 623da41..a2dfa74 100644
--- a/package/inadyn/Config.in
+++ b/package/inadyn/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_INADYN
 	bool "inadyn"
+	depends on BR2_USE_MMU # Uses fork()
 	help
 	  INADYN is a free DynDNS client. It gives the possibility
 	  to have your own fixed hostname registered on the internet,
