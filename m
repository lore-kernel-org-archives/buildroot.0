From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 8 Jun 2019 21:42:32 +0200
Subject: [Buildroot] [git commit] package/pkg-golang: add cflags/ldflags to
 GO_HOST_ENV
Message-ID: <20190608194254.9DC7B8ED65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d65b6b337b6ddc7961aff5232062747a14cc9127
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a go host package is built using cgo, it needs access
to HOST_CFLAGS/HOST_LDFLAGS to utilize host packages it
might depend on.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Acked-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-golang.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index b4e8a53065..72e8f6b7af 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -35,6 +35,8 @@ GO_TARGET_ENV = \
 	$(GO_COMMON_ENV)
 
 GO_HOST_ENV = \
+	CGO_CFLAGS="$(HOST_CFLAGS)" \
+	CGO_LDFLAGS="$(HOST_LDFLAGS)" \
 	$(GO_COMMON_ENV)
 
 ################################################################################
