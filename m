From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Mar 2018 10:01:49 +0200
Subject: [Buildroot] [V3 1/2] dropbear: bump to version 2018.76
In-Reply-To: <CAB0FRsstPgEOQCPJgCWn91y-PB3umhgpX9vn0qof5J-knPPkXQ@mail.gmail.com>
References: <20180321160329.20768-1-francois.perrad@gadz.org>
 <20180326221829.656d3d2a@windsurf.home>
 <CAB0FRsstPgEOQCPJgCWn91y-PB3umhgpX9vn0qof5J-knPPkXQ@mail.gmail.com>
Message-ID: <20180328100149.1d0a05b8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Mar 2018 09:57:57 +0200, Fran?ois Perrad wrote:

> > Could you have a look ?
> 
> The presence of crypt() is detected by the configure script.

So, if it's detected by the configure script, there should be no
problem, no ?

> in dropbear-2017-75/options.h, the logic was :
>     /* This requires crypt() */
>     #ifdef HAVE_CRYPT
>     #define ENABLE_SVR_PASSWORD_AUTH
>     #endif
> 
> in dropbear-2018-76/sysoptions.h, the logic is now :
>     #if DROPBEAR_SVR_PASSWORD_AUTH && !HAVE_CRYPT
>         #error "DROPBEAR_SVR_PASSWORD_AUTH requires `crypt()'."
>     #endif
> 
> So, without something like BR2_TOOLCHAIN_HAS_CRYPT,
> we must always disable the option DROPBEAR_SVR_PASSWORD_AUTH in
> localoptions.h.

I don't understand. On one hand, you say that the presence of crypt()
is detected by the configure script, and on the other hand, you say
that we must tell Dropbear explicitly whether crypt() is available or
not.

Could you clarify ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
