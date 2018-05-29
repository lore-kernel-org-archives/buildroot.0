From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Tue, 29 May 2018 12:47:42 +0000
Subject: [Buildroot] [PATCH 1/2] configs/stm32f429: force usage of
 BINUTILS 2.28.x
In-Reply-To: <42437f2b-2d35-fa5c-c695-fb29031c8cc9@smile.fr>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
 <42437f2b-2d35-fa5c-c695-fb29031c8cc9@smile.fr>
Message-ID: <77e41c93-8f94-272b-ec3c-1eb82f3d0c2d@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,
  I have pushed the 2 patches, it just take time to appear on patchwork.

  When the both will be available on patchwork, I will update the bugzilla with the link of two patch.

patch1: http://patchwork.ozlabs.org/patch/922037/
patch 2: http://patchwork.ozlabs.org/patch/922049/

Regards
Christophe

On 05/29/2018 02:39 PM, Romain Naour wrote:

Hi Christophe,

Le 29/05/2018 ? 14:09, Christophe PRIOUZEAU a ?crit :


Due to runtime issue with the usage of BINUTILS 2.29.x,
we need to use the version 2.28.x

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com><mailto:christophe.priouzeau@st.com>
---
 configs/stm32f429_disco_defconfig | 1 +



Thanks for the patch!

The defconfig stm32f469_disco is also affected by this issue.
Binutils version must be updated as well.

Best regards,
Romain



 1 file changed, 1 insertion(+)

diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
index 5237e9a..fc167d0 100644
--- a/configs/stm32f429_disco_defconfig
+++ b/configs/stm32f429_disco_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+BR2_BINUTILS_VERSION_2_28_X=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y







--


Best regards / Cordialement,

[cid:part1.D2E22D31.675807D7 at st.com]
Christophe Priouzeau | TINA: 166 7320 | Tel: +33 244027320

STMicroelectronics
ST oneline: www.st.com<http://www.st.com>







-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180529/cae358a8/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: st_mail.png
Type: image/png
Size: 9916 bytes
Desc: st_mail.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180529/cae358a8/attachment.png>
