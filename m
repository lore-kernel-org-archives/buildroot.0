From: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Date: Mon, 19 Jul 2021 10:43:01 +0200
Subject: [Buildroot] Fw: [RESEND,
 PATCH 2/2] configs/stm32f469_disco: add framebuffer test application
In-Reply-To: <AM0PR10MB2817E905F5392BCEDF88E05EE3E19@AM0PR10MB2817.EURPRD10.PROD.OUTLOOK.COM>
References: <20210716164243.17988-1-dariobin@libero.it>
 <20210716164243.17988-2-dariobin@libero.it>
 <AM0PR10MB2817E905F5392BCEDF88E05EE3E19@AM0PR10MB2817.EURPRD10.PROD.OUTLOOK.COM>
Message-ID: <9fa31969-805a-c9cc-76df-3012a4794ddc@foss.st.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ok, for me.

Acked-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>

Regards
Christophe Priouzeau
On 7/19/21 10:38 AM, Christophe PRIOUZEAU wrote:
> 
> 
> ------------------------------------------------------------------------
> *From:* Dario Binacchi <dariobin@libero.it>
> *Sent:* Friday, July 16, 2021 6:42 PM
> *To:* buildroot at buildroot.org <buildroot@buildroot.org>
> *Cc:* Christophe PRIOUZEAU <christophe.priouzeau@st.com>; Dario Binacchi 
> <dariobin@libero.it>
> *Subject:* [RESEND, PATCH 2/2] configs/stm32f469_disco: add framebuffer 
> test application
> It's a test suite for Linux framebuffer. You can run, for example,
> fb-test-rect that displays random rectangles on the screen. But first,
> you need to enable the framebuffer:
> 
> ~ # echo 0 0 > /sys/class/graphics/fb0/pan
> ~ # fb-test-rect
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
Acked-by: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
> ---
>  ?configs/stm32f469_disco_defconfig | 1 +
>  ?1 file changed, 1 insertion(+)
> 
> diff --git a/configs/stm32f469_disco_defconfig 
> b/configs/stm32f469_disco_defconfig
> index 1440aefd95..b6de6748a0 100644
> --- a/configs/stm32f469_disco_defconfig
> +++ b/configs/stm32f469_disco_defconfig
> @@ -15,6 +15,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
>  ?BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  ?BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
>  ?BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> +BR2_PACKAGE_FB_TEST_APP=y
>  ?BR2_TARGET_ROOTFS_EXT2=y
>  ?BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
>  ?# BR2_TARGET_ROOTFS_TAR is not set
> -- 
> 2.17.1
> 
> 
> ST Restricted
> 


-- 
Best regards / Cordialement,

Christophe Priouzeau | Tel: +33 244027320
STMicroelectronics
ST online: www.st.com<http://www.st.com/>
