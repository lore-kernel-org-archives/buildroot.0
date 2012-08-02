From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:46 -0000
Subject: [Buildroot] [git commit branch/next] xinetd: explicitly specify AR
	in build step
Message-ID: <20120802195242.AD2DD96FE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed42aab337507220b97d7b7f0fd8996ca547c9b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

xinetd's configure does not set up an AR variable, and there
are no libtool files to autoreconfigure.  So instead, lets
pass in AR during the build.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xinetd/xinetd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index 6a69a55..e8fc037 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -11,4 +11,6 @@ ifneq ($(BR2_INET_RPC),y)
 XINETD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DNO_RPC"
 endif
 
+XINETD_MAKE_OPT = AR="$(TARGET_AR)"
+
 $(eval $(call AUTOTARGETS))
