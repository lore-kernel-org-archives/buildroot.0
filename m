From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 May 2011 10:01:28 +0200
Subject: [Buildroot] [git commit] Makefile.autotools.in: add libtool 2.4
	support for autoreconf case as well
Message-ID: <20110503081731.D09FB82BD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3178a20550565833b8a2a8f6af9fd3c7ae4811d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Was missing from f055b266 (Makefile.autotools.in: add libtool v2.4 support).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 88a06ea..61fcfcf 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -170,6 +170,8 @@ define AUTORECONF_HOOK
 				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v1.5.patch; \
 			elif test $$$${ltmain_version} = "2.2"; then\
 				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v2.2.patch; \
+			elif test $$$${ltmain_version} = "2.4"; then\
+				toolchain/patch-kernel.sh $$$${i%/*} package buildroot-libtool-v2.4.patch; \
 			fi \
 		done \
 	fi
-- 
1.7.3.4
