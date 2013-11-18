From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2013 10:03:37 +0100
Subject: [Buildroot] [git commit] e2fsprogs: disable e4defrag on avr32
Message-ID: <20131118100153.8C7DB9BD31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f0c5c85215564e28138d928620310b57d610e6ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fallocate syscall is not available on avr32. This is needed by the e4defrag
utility, so we disable this on avr32.

Fixes build failures such as the following.

  http://autobuild.buildroot.net/results/dcb/dcb4e5c6981a9299a2eb18e325d4de621846afdb/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 16d3671..1d1e174 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -49,6 +49,7 @@ config BR2_PACKAGE_E2FSPROGS_E2UNDO
 
 config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 	bool "e4defrag"
+	depends on !BR2_avr32 # fallocate not implemented
 
 config BR2_PACKAGE_E2FSPROGS_FILEFRAG
 	bool "filefrag"
