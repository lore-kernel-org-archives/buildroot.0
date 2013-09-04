From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 4 Sep 2013 13:31:19 +0200
Subject: [Buildroot] [git commit] libevas: async image preload support needs
	threads support in toolchain
Message-ID: <20130904113143.AE4BC9B6EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6d92bf415df33ac86487d68f5f8299f406859d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/92b/92b3990e3a51c9e400cff31a1f0d23aeb5085a54/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/libevas/libevas.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 41ceb49..46de4cb 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -203,6 +203,11 @@ else
 LIBEVAS_CONF_OPT += --disable-font-loader-eet
 endif
 
+# async image preload support needs threads support in toolchain
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBEVAS_CONF_OPT += --disable-async-preload
+endif
+
 # libevas installs the source code of examples on the target, which
 # are generally not useful.
 define LIBEVAS_REMOVE_EXAMPLES
