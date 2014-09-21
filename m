From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 21 Sep 2014 09:46:30 +0300
Subject: [Buildroot] [PATCH v3] Add support for Flattened Image Trees
In-Reply-To: <1411071224-5386-1-git-send-email-yegorslists@googlemail.com>
References: <1411071224-5386-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20140921064630.GH29713@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Thu, Sep 18, 2014 at 10:13:44PM +0200, Yegor Yefremov wrote:
> This patch provides an option to specify a FIT source
> file (*.its), that will usually be stored in a board directory,
> and the resulting blob file name (*.itb).
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---

[snip]

> +config BR2_FIT_INSTALL_TARGET
> +	bool "Install Flattened Image Tree blob to /boot in target"
> +	depends on !BR2_TARGET_ROOTFS_INITRAMFS

I don't think it is reasonable to disable target FIT image install just 
because the user has enabled initramfs target generation. Wouldn't it be nicer 
to remove the /boot directory from the generated .cpio image? If this is too 
hard to do, I suggest to add a comment explaining this limitation to be 
displayed when BR2_TARGET_ROOTFS_INITRAMFS is enabled.

Thanks for working on this,
baruch

> +	help
> +	  Select this option to have the FIT image installed to
> +	  /boot in the target root filesystem.
> +
> +endif

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
