From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 18:34:39 +0200
Subject: [Buildroot] [git commit] google-breakpad: disable on mips64
Message-ID: <20140719163640.2B0A99D281@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ef750f4a408322e23fc2aaa822e7afa14bcbbe7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to some mmap() related issue, google-breakpad fails to build on
mips64, so let's disable it for the moment. The mips/mips64 folks
might be interested in fixing that later.

Fixes:

  http://autobuild.buildroot.org/results/2b0/2b03937693ea400ddcc7e8364ff7dc22ce651669/

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Markos Chandras <Markos.Chandras@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/google-breakpad/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 0ef10c5..146db36 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	bool
 	default y if BR2_i386 || BR2_x86_64 || BR2_arm || BR2_aarch64 || \
-		BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+		BR2_mips || BR2_mipsel
 
 config BR2_PACKAGE_GOOGLE_BREAKPAD
 	bool "google-breakpad"
