From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 16:30:39 +0100
Subject: [Buildroot] [git commit] utils/genrandconfig: drop qt4 fixups
Message-ID: <20190206153033.40F7481121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a11d61e104bb01146b032c461a12a7340e23cae2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that Qt4 is removed, these fixups can be removed as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/genrandconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 047740a411..a2190d6d25 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -310,17 +310,9 @@ def fixup_config(configfile):
        'BR2_PACKAGE_QT5BASE_GUI=y\n' in configlines:
         return False
     # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_QT_GUI_MODULE=y\n' in configlines:
-        return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
        'BR2_PACKAGE_FLANN=y\n' in configlines:
         return False
-    # or1k affected by binutils PR21464
-    if 'BR2_or1k=y\n' in configlines and \
-       'BR2_PACKAGE_QT_GUI_MODULE=y\n' in configlines:
-        return False
 
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
