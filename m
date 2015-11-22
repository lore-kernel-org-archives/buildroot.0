From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2015 22:38:26 +0100
Subject: [Buildroot] [git commit branch/next] package/Makefile.in: remove
	HOSTCC_VERSION
Message-ID: <20151122220215.D385C81E73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ba8ad1383365e0e4c7e6d2570c2a142c0434a41b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

HOSTCC_VERSION is no longer used since gcc switched to the package
infrastructure in e236fe481. It was in fact no longer needed since we
dropped support for gcc 4.3.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index ca34660..bb2a0f9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -219,10 +219,6 @@ HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
 HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
 
-# hostcc version as an integer - E.G. 4.3.2 => 432
-HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
-	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
-
 # host-intltool should be executed with the system perl, so we save
 # the path to the system perl, before a host-perl built by Buildroot
 # might get installed into $(HOST_DIR)/usr/bin and therefore appears
