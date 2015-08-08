From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:49 -0000
Subject: [Buildroot] [git commit branch/next] package/glibc: enable lock
	elision on x86_64 hosts
Message-ID: <20150808105638.C6F77803C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3ff6cbb4205d7382fc4b2f728ea8bcf6345f8de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/glibc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0a37bb3..cbfbf32 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -90,6 +90,7 @@ define GLIBC_CONFIGURE_CMDS
 		--prefix=/usr \
 		--enable-shared \
 		$(if $(BR2_SOFT_FLOAT),--without-fp,--with-fp) \
+		$(if $(BR2_x86_64),--enable-lock-elision) \
 		--with-pkgversion="Buildroot" \
 		--without-cvs \
 		--disable-profile \
