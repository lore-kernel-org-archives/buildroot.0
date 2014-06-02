From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 13:29:11 +0200
Subject: [Buildroot] [git commit] mpg123: correct powerpc cpu variant
	selection
Message-ID: <20140602113147.037229CE7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d1f4cc5c3234e285667f8e79b59fd1268c4669a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/d8a/d8af8f991b4429cf06081ddf2f08043861842a50/

ppc_nofpu should (as the name indicates) only be used for powerpc.

It is not clear to me if this code works for powerpc64(le) as well, so this
is only selected for classic ppc32.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpg123/mpg123.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index ac64132..712738e 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -30,12 +30,14 @@ ifeq ($(BR2_i386),y)
 MPG123_CPU = x86
 endif
 
+ifeq ($(BR2_powerpc),y)
 ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 MPG123_CPU = altivec
 endif
 ifeq ($(BR2_SOFT_FLOAT),y)
 MPG123_CPU = ppc_nofpu
 endif
+endif # powerpc
 
 ifeq ($(BR2_x86_64),y)
 MPG123_CPU = x86-64
