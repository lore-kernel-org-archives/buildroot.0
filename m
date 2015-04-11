From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 15:35:13 +0200
Subject: [Buildroot] [git commit] package/e2fsprogs: Show toolchain comment
	only on mmu archs
Message-ID: <20150411133531.86F0580E17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e9766ed67fbf703eddf8dcb0192dff2a6629127
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: put BR2_USE_MMU dependency first, as suggested by Yann.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index f5011d1..ad33983 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -99,4 +99,5 @@ config BR2_PACKAGE_E2FSPROGS_UUIDGEN
 endif
 
 comment "e2fsprogs needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR
