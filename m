From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 15:08:12 +0200
Subject: [Buildroot] [git commit] legacy: i386 is legacy, inform the user
Message-ID: <20160509200131.046D781D5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7aaa730ce296b8f4ab4272141ad463290944863b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we dropped support for i386, we added the corresponding opiton to
the legacy menu, but forgot to select BR2_LEGACY.

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 897a6d2..824a220 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -189,6 +189,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2
 
 config BR2_x86_i386
 	bool "x86 i386 support removed"
+	select BR2_LEGACY
 	help
 	  The support for the i386 processors of the x86 architecture
 	  has been removed.
