From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 3 Feb 2021 23:15:11 +0100
Subject: [Buildroot] [PATCH 1/1] board/orangepi-zero-plus2: switch to
 GPT for PARTLABEL support
In-Reply-To: <20210203195719.519992-1-geomatsi@gmail.com>
References: <20210203195719.519992-1-geomatsi@gmail.com>
Message-ID: <20210203221511.GO2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey, All,

On 2021-02-03 22:57 +0300, Sergey Matyukevich spake thusly:
> Patch that pins mmc indexes was not accepted to mainline kernel. Drop that
> patch and switch to GPT to use partition labels. For GPT the name of the
> partition in genimage.cfg is used as the label for that partition. Note
> that the default GPT partition table location conflicts with the SPL
> location, so move GPT table after bootloaders.

Applied to master, thanks, but see a very minor not, below...

> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
[--SNIP--]
> diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
> index 8091edad6f..29377bf149 100644
> --- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
> +++ b/board/orangepi/orangepi-zero-plus2/genimage.cfg
[--SNIP--]
> @@ -32,8 +36,11 @@ image sdcard.img {
>  		image = "boot.vfat"
>  	}
>  
> +	# 'rootfs' will be used as the partition label, used
> +	# with root=PARTLABEL=rootfs kernel commadn line

Aha! You even copied my typo! ;-)

Fixed when applying.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
