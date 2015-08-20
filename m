From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Aug 2015 23:58:57 +0200
Subject: [Buildroot] [git commit] package/librtas: only show comment on
	supported architectures
Message-ID: <20150820215956.377C4801F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42f1e5ce5b60c3b62c410e2d4702df6f3cb3a869
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

librtas is only available for PPC and PPC64, so only show the comment
about the (e)glibc dependency for those archs.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Sam Bobroff <sam.bobroff@au1.ibm.com>
Reviewed-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/librtas/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/librtas/Config.in b/package/librtas/Config.in
index e437fa1..2e6063f 100644
--- a/package/librtas/Config.in
+++ b/package/librtas/Config.in
@@ -10,4 +10,5 @@ config BR2_PACKAGE_LIBRTAS
 	  http://librtas.sourceforge.net/
 
 comment "librtas needs an (e)glibc toolchain"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
