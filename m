From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 7 Jun 2021 21:16:49 +0200
Subject: [Buildroot] Is there a better version of vi?
In-Reply-To: <f7452a41879246d3a3bdbe185657ccdc@AcuMS.aculab.com>
References: <f7452a41879246d3a3bdbe185657ccdc@AcuMS.aculab.com>
Message-ID: <df983b32-db5a-1eda-cee5-0b15c181a32c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/06/2021 15:27, David Laight wrote:
> The version of vi is busybox is somewhat cutdown.
> I can't see an option to include either nvi or vim.

Symbol: BR2_PACKAGE_VIM [=n]

Type  : bool

Prompt: vim

  Location:

    -> Target packages

(1)   -> Text editors and viewers

  Defined at package/vim/Config.in:1

  Depends on: BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] &&
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS [=y]
  Selects: BR2_PACKAGE_NCURSES [=n]

 I suspect you didn't turn on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

 vim is pretty large though, adding nvi might be a good idea. Feel free to send
a patch!

 Regards,
 Arnout

> 
> While vim has grown all sorts of horrid extensions
> it would be nice to have a version that matches the
> code from the late 1980s.
> Most annoying is not having :g//p
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
