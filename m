From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 22:55:50 +0200
Subject: [Buildroot] [git commit] package: Introduce package-specific
	BINFMT_FLAT options.
Message-ID: <20130505205713.954F699B59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9edf482d6b210d16a22fdf561da2a2f0fb84824d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new option <PKG>_FLAT_STACKSIZE. The document needs to be updated.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index dd3bc7d..a449089 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -103,6 +103,10 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 
+ifeq ($(BR2_BINFMT_FLAT),y)
+TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
+endif
+
 ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
 TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
 TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
