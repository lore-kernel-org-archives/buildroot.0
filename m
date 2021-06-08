From: David Laight <David.Laight@ACULAB.COM>
Date: Tue, 8 Jun 2021 08:16:00 +0000
Subject: [Buildroot] Is there a better version of vi?
In-Reply-To: <df983b32-db5a-1eda-cee5-0b15c181a32c@mind.be>
References: <f7452a41879246d3a3bdbe185657ccdc@AcuMS.aculab.com>
 <df983b32-db5a-1eda-cee5-0b15c181a32c@mind.be>
Message-ID: <9b3a166571d646a49a887d73a1d4aaf0@AcuMS.aculab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle
> Sent: 07 June 2021 20:17
> 
> On 03/06/2021 15:27, David Laight wrote:
> > The version of vi is busybox is somewhat cutdown.
> > I can't see an option to include either nvi or vim.
> 
> Symbol: BR2_PACKAGE_VIM [=n]
> 
> Type  : bool
> 
> Prompt: vim
> 
>   Location:
> 
>     -> Target packages
> 
> (1)   -> Text editors and viewers
> 
>   Defined at package/vim/Config.in:1
> 
>   Depends on: BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] &&
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS [=y]
>   Selects: BR2_PACKAGE_NCURSES [=n]
> 
>  I suspect you didn't turn on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

Probably because it is hidden!

>  vim is pretty large though,

It also contains a lot of pointless crap.
Killing all the 'plugins' would be a start.

My current build is for an x86 with an SSD - size doesn't
really matter.
OTOH I've removed python to save build time - not needed.

> adding nvi might be a good idea. Feel free to send a patch!

:-)
I wonder if the fixes I did to netBSD's version got back
to (whatever) the main repository is.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
