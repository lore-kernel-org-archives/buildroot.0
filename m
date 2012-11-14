From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:29:55 +0100
Subject: [Buildroot] [git commit] kexec: disable on avr32
Message-ID: <20121114214721.ABE1A99FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7520d3564bdade478d2778a0d3a2cdcc8c1ac81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kexec does not support the avr32 architecture; this results in autobuilder
failures such as the following.

  http://autobuild.buildroot.net/results/5f5e91c3eb622bce88402a9afc8a3e7bd5007136/build-end.log

This patch disables support for the kexec package on the avr32 architecture.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kexec/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 6f10b89..e59a07b 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KEXEC
 	bool "kexec"
+	depends on !BR2_avr32
 	help
 	  Kexec is a user space utiltity for loading another kernel
 	  and asking the currently running kernel to do something with it.
