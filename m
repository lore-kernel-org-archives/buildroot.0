From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jan 2016 22:40:20 +0100
Subject: [Buildroot] [git commit] fakeroot: fix build when libcap-dev is
	installed
Message-ID: <20160104214116.30F6C82524@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fc5de4ef466b649b37a86e4f4994a667149dd80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://bugs.busybox.net/show_bug.cgi?id=8541

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fakeroot/fakeroot.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 837c2b9..168cd13 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -10,7 +10,10 @@ FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/
 # Force capabilities detection off
 # For now these are process capabilities (faked) rather than file
 # so they're of no real use
-HOST_FAKEROOT_CONF_ENV = ac_cv_func_capset=no
+HOST_FAKEROOT_CONF_ENV = \
+	ac_cv_header_sys_capability_h=no \
+	ac_cv_func_capset=no
+
 FAKEROOT_LICENSE = GPLv3+
 FAKEROOT_LICENSE_FILES = COPYING
 
