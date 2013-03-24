From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 19:39:09 +0100
Subject: [Buildroot] [git commit] rt-tests: mention that NPTL thread
	implementation is needed
Message-ID: <20130324194035.759609B28F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a22a21c76f36b87a1823df05518b1b55c457e127
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch superseds http://patchwork.ozlabs.org/patch/150161/, but
does it in a different way. Since we don't have a way of selecting the
thread implementation for external toolchains, and it sounds a bit too
heavy to add new config options just for the sake of rt-tests, we
instead simply add some help text to the rt-tests package explaining
that NPTL thread implementation is needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rt-tests/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
index 0999ebf..a040139 100644
--- a/package/rt-tests/Config.in
+++ b/package/rt-tests/Config.in
@@ -14,6 +14,12 @@ config BR2_PACKAGE_RT_TESTS
 	  installed if a Python interpreter has been selected in the
 	  Buildroot configuration.
 
+	  Note that this package requires a toolchain built with the
+	  NPTL implementation of the pthread API (this is always the
+	  case with glibc/eglibc toolchains, but may not necessarily
+	  be the case with uClibc toolchains, since the thread
+	  implementation is configurable).
+
 	  http://rt.wiki.kernel.org
 
 comment "rt-tests requires a toolchain with threads support"
