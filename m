From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 23:11:14 +0200
Subject: [Buildroot] [git commit branch/next] mosh: don't show dependencies
	comment on unsupported arches
Message-ID: <20150808105644.6969D7FD83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e068ebe83a509e4a9164e29b686add5fb746c7d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Cc: Christian Stewart <christian@paral.in>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Christian Stewart" <c <yann.morin.1998@free.fr>hristian at paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mosh/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 2f5214c..4ad7d61 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,5 +1,6 @@
 comment "mosh needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !(BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64)
 
 config BR2_PACKAGE_MOSH
 	bool "mosh"
