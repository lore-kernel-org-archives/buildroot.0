From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 10 Oct 2013 08:54:54 +0200
Subject: [Buildroot] [PATCH 2 of 4] libnfnetlink: add license information
In-Reply-To: <8738oayyue.fsf@dell.be.48ers.dk>
References: <patchbomb.1381226814@argentina>
 <5c8fa6d049957876145a.1381226816@argentina>
 <8738oayyue.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWjxyh1hGoXzEA6OptjEcEZGEF=Lnv7jogKGyC7rye3=w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Oct 9, 2013 at 10:27 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>  Thomas> ---
>  Thomas>  package/libnfnetlink/libnfnetlink.mk |  2 ++
>  Thomas>  1 files changed, 2 insertions(+), 0 deletions(-)
>
>  Thomas> diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
>  Thomas> --- a/package/libnfnetlink/libnfnetlink.mk
>  Thomas> +++ b/package/libnfnetlink/libnfnetlink.mk
>  Thomas> @@ -9,5 +9,7 @@ LIBNFNETLINK_SOURCE = libnfnetlink-$(LIB
>  Thomas>  LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
>  Thomas>  LIBNFNETLINK_AUTORECONF = YES
>  Thomas>  LIBNFNETLINK_INSTALL_STAGING = YES
>  Thomas> +LIBNFNETLINK_LICENSE = GPLv2+
>  Thomas> +LIBNFNETLINK_LICENSE_FILES = COPYING
>
> Hmm, I don't see that in any of the source files:
>
> grep -rls 'any later'
> m4/libtool.m4
> configure
> config.sub
> ltmain.sh
> build-aux/compile
> build-aux/config.sub
> build-aux/ltmain.sh
> build-aux/missing
> build-aux/depcomp
> build-aux/config.guess
> COPYING
> missing
> depcomp
> config.guess
>
> and src/libnfnetlink.c explicitly states:
>
>  * This program is free software; you can redistribute it and/or modify it
>  * under the terms of the GNU General Public License version 2 as published
>  * by the Free Software Foundation.
>
> So I dropped the '+' and committed, thanks.

Seems the libnfnetlink authors are a bit sloppy with respect to
licensing: the README file states:
"This library is released under GPLv2+."
After reading this I didn't check the sources.

The netfilter website also states different things:
http://www.netfilter.org/licensing.html mentions GPLv2 only
while http://www.netfilter.org/about.html#license says GPLv2+ only or
any later version.

I'll send a mail to the netfilter coreteam about this.

Best regards,
Thomas
