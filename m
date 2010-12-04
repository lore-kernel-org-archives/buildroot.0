From: Heiko Zuerker <heiko@zuerker.org>
Date: Sat, 4 Dec 2010 13:34:29 -0600
Subject: [Buildroot] external toolchain and iconv in libglib2.mk
In-Reply-To: <1291490772.14151.2488.camel@coalu.atr>
References: <003201cb93d6$8162a080$8427e180$@zuerker.org>	<1291483060.14151.2478.camel@coalu.atr>	<004501cb93d7$a9c039b0$fd40ad10$@zuerker.org>	<1291484261.14151.2480.camel@coalu.atr>	<004c01cb93e1$d1f3eda0$75dbc8e0$@zuerker.org>
	<1291490772.14151.2488.camel@coalu.atr>
Message-ID: <004e01cb93ea$44a07d70$cde17850$@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Lionel Landwerlin
> Sent: Saturday, December 04, 2010 1:26 PM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] external toolchain and iconv in libglib2.mk
> 
> Ok great,
> 
> It looks like something is wrong with your host. You do not seem to have
> libiconv.so on your system, but still your /usr/include/iconv.h defines a
> _LIBICONV_H.

Libiconv.so is there
 
> So you might have a libc compiled with iconv support, but you're using
> libiconv's header, that is strange...

Yes that was the issue. I copied iconv.h from glibc and now it works.
 
> Or maybe even more strange, you've got libc with iconv support and on top
> of that you've installed libiconv, which is confusing glib...
> 
> I'm afraid you'll have to fix your system.

No worries, as long as I know what's going on, I can fix it.

Thanks for your quick help!

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org
