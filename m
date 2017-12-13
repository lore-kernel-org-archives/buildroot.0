From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Dec 2017 19:23:32 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: add config option for uboot
 environment padding byte
In-Reply-To: <20171212062751.3e1eb993@windsurf.png.is.keysight.com>
References: <1513018028-18256-1-git-send-email-johannes.schmitz1@gmail.com>
 <20171212062751.3e1eb993@windsurf.png.is.keysight.com>
Message-ID: <20171213182332.GB7364@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Johannes, All,

On 2017-12-12 06:27 +0100, Thomas Petazzoni spake thusly:
> On Mon, 11 Dec 2017 19:47:08 +0100, Johannes Schmitz wrote:
[--SNIP--]
> > +config BR2_TARGET_UBOOT_ENVIMAGE_PADDING_BYTE
> > +	hex "Padding byte"
> > +	default 0x00
> > +	help
> > +	  The byte used for padding at the end of the environment image.
> 
> I'm still not sure what is the point of customizing the padding byte.
> Does someone has a use-case for that ? If not, I'm not sure it makes
> sense to add a Buildroot option for it.

As far as I understand, this is because the U-Boot on Johannes' board
would expect the padding byte to be 0x00 when the default for mkenvimage
is 0xFF.

I have no idea why U-Boot expects 0x00 in Johannes' case, though. The
only thing I can think of is that the 'default' byte value on flash
after a page-erase depends on the technology: for NOR, the value after
erase ix 0x00, while for NAND, it is 0xFF. So maybe that's the reason...

But any case, as you said in a further reply, adding that new option
does not add much complexity.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
