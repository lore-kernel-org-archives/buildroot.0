From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 Jan 2013 08:43:50 +0100
Subject: [Buildroot] [git commit] can-utils: needs mmu support
Message-ID: <20130122074540.047249A71F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e6b9c577176c792c41db4d65e916d5c4f16cbb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.org/results/2a06aecd58bb465f5e3c2610d34162b48c9ebba4/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/can-utils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/can-utils/Config.in b/package/can-utils/Config.in
index 79c1459..d5d4297 100644
--- a/package/can-utils/Config.in
+++ b/package/can-utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CAN_UTILS
 	bool "can-utils"
+	depends on BR2_USE_MMU # fork()
 	help
 	  SocketCAN is a set of open source CAN drivers and a
 	  networking stack.
