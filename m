From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 21:22:46 +0200
Subject: [Buildroot] [git commit] go: define a hidden boolean to specify if
	CGO linking is supported
Message-ID: <20160706193045.CA75682237@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70061a50bf952a749092e0b016fd764f4bffbdd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/go/Config.in.host | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index e1b13c0..d6d35dc 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -5,3 +5,11 @@ config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on !BR2_ARM_CPU_ARMV4
 	# MIPS R6 support in Go has not yet been developed.
 	depends on !BR2_mips_64r6
+
+config BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	# Go doesn't support CGO linking on MIPS64x platforms
+	# See: https://github.com/karalabe/xgo/issues/46
+	depends on !BR2_mips64 && !BR2_mips64el
