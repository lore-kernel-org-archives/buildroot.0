From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 22:21:32 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/lapack: avoid
 selecting lapack and clapack
Message-ID: <20200310211623.D3A3390858@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2abd449b9680c1069cff60f2ed927ded5f0729b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

lapack and clapack generate the same libraries liblapack.so and
libblas.so. So those two packages can't be selected at the same time.

This is a temporary fix waiting for a solution[2].

So:
- add !BR2_PACKAGE_CLAPACK to lapack/Config.in.

[1]: http://autobuild.buildroot.org/results/375/375078ed8f965ecf92eb9674bd071a518c3ef894//
[2]: http://lists.busybox.net/pipermail/buildroot/2019-August/255894.html

Signed-off-by: Alexandre PAYEN <alexandre.payen@smile.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Romain Naour <romain.naour@smile.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 24814a095814f3cf241ad12f90c701f98bee6849)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lapack/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lapack/Config.in b/package/lapack/Config.in
index 9687ace82d..6cd0810cb1 100644
--- a/package/lapack/Config.in
+++ b/package/lapack/Config.in
@@ -5,6 +5,7 @@ comment "lapack/blas needs a toolchain w/ fortran"
 config BR2_PACKAGE_LAPACK
 	bool "lapack/blas"
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN
+	depends on !BR2_PACKAGE_CLAPACK
 	# _fpu_control is used on PowerPC, but not available with uClibc
 	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
 	help
