From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 21:15:12 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/pkg-golang: add
 cflags/ldflags to GO_HOST_ENV
Message-ID: <20190623191453.93EC6880D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=126d0d2fcd696a103f7aed80beeed803a3216083
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

If a go host package is built using cgo, it needs access
to HOST_CFLAGS/HOST_LDFLAGS to utilize host packages it
might depend on.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Acked-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d65b6b337b6ddc7961aff5232062747a14cc9127)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
