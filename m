From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 21:15:10 +0200
Subject: [Buildroot] [git commit master] kconfig: fix qconf (make xconfig)
	linking
Message-ID: <20100605191714.81E258F6C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e0197d64b5c598534b8f805174ef312398a0c48b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qconf is written in C++, so use HOSTCXX instead of HOSTCC, and pass the
correct flags.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/config/Makefile b/package/config/Makefile
index a2184fa..66b54cd 100644
--- a/package/config/Makefile
+++ b/package/config/Makefile
@@ -26,7 +26,7 @@ $(host-cmulti): %: $(host-cobjs) $(host-cshlib)
 	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $($@-objs) $(HOST_LOADLIBES) -o $@
 
 $(host-cxxmulti): %: $(host-cxxobjs) $(host-cobjs) $(host-cshlib)
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $($@-objs) $($@-cxxobjs) $(HOSTLOADLIBES_$@) -o $@
+	$(HOSTCXX) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$@) $($@-objs) $($@-cxxobjs) $(HOSTLOADLIBES_$@) -o $@
 
 $(host-cobjs): %.o: %.c
 	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) -c $< -o $@
-- 
1.6.3.3
