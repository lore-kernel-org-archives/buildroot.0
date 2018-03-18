From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 21:58:24 +0100
Subject: [Buildroot] [git commit] tmp2-tss: remove architecture restriction
Message-ID: <20180318222454.88CCB836EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03a82765b1238bc57ce39f164c2de8c471b91f33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Followingig a suggestion from Peter Korsgaard, remove the restriction to
x86 and x86_64. It is preferable to expose the package unless there is a
build time dependency on an architecture or the package is specific to a
certain SoC or board.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tss/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 1eb69d3e93..ebf0fd262d 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
-	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_LIBURIPARSER
 	help
 	  OSS implementation of the Trusted Computing Group's (TCG) TPM2
