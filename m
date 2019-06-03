From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon,  3 Jun 2019 11:21:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-golang: add cflags/ldflags to
 GO_HOST_ENV
Message-ID: <20190603092101.8658-1-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a go host package is built using cgo, it needs access
to HOST_CFLAGS/HOST_LDFLAGS to utilize host packages it
might depend on.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---

This fixes current build errors of mender-artifact-3.0.0:

http://autobuild.buildroot.net/results/dd1a6dac03dd3b68ee63761c33dbb01c328d4f14/build-end.log

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
--
2.11.0
