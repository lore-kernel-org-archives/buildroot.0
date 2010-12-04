From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 04 Dec 2010 20:26:12 +0100
Subject: [Buildroot] external toolchain and iconv in libglib2.mk
In-Reply-To: <004c01cb93e1$d1f3eda0$75dbc8e0$@zuerker.org>
References: <003201cb93d6$8162a080$8427e180$@zuerker.org>
	<1291483060.14151.2478.camel@coalu.atr>
	<004501cb93d7$a9c039b0$fd40ad10$@zuerker.org>
	<1291484261.14151.2480.camel@coalu.atr>
	<004c01cb93e1$d1f3eda0$75dbc8e0$@zuerker.org>
Message-ID: <1291490772.14151.2488.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok great,

It looks like something is wrong with your host. You do not seem to have
libiconv.so on your system, but still your /usr/include/iconv.h defines
a _LIBICONV_H.

So you might have a libc compiled with iconv support, but you're using
libiconv's header, that is strange...

Or maybe even more strange, you've got libc with iconv support and on
top of that you've installed libiconv, which is confusing glib...

I'm afraid you'll have to fix your system.

Regards,

--
Lionel Landwerlin

Le samedi 04 d?cembre 2010 ? 12:34 -0600, Heiko Zuerker a ?crit :
> (sorry, this time with a reply to the list)
> 
> Hey,
> 
> Here's the error message:
> gconvert.c:65:2: error: #error GNU libiconv not in use but included iconv.h is from libiconv
> 
> config.log without --with-libiconv=gnu 
> http://pastebin.com/WB433xVu
> 
> config.log with --with-libiconv=gnu
> http://pastebin.com/rbgZ6Saw
> 
