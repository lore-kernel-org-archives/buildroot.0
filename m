From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 4 Oct 2015 13:29:53 +0200
Subject: [Buildroot] [PATCH] toolchain: Remove useless printf
In-Reply-To: <20151004112707.GA7334@free.fr>
References: <1443957460-26432-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20151004112707.GA7334@free.fr>
Message-ID: <CAGduivyAtCU=1k215HaB8LW_tPOON8Gib3MHeeibGNBqjcnEmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 4, 2015 at 1:27 PM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Maxime, All,
>
> On 2015-10-04 13:17 +0200, Maxime Hadjinlian spake thusly:
> > Introduced by previous patch 0f75b2635ee564fbbdb9ea631cf39fa8731d6d6c,
> > this printf doesn't serve any purposes.
>
> This is even worth than that. It actually breaks the build because there
> is not format to printf:
>     printf: usage: printf [-v var] format [arguments]
>
> So the glibc build fails.
>
> With that fixed in the commit log;
>
>     Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
>
> > Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>
> And I think this would also be valid;
>
> Reported-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
Yes, I noticed I forgot that when I hit 'y' on git send-email, sorry :/.
Should I send a v2 with a better commit log or should it be done when the
commit is done ?

>
> ;-)
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  toolchain/helpers.mk | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> > index a4fa815..1452ec6 100644
> > --- a/toolchain/helpers.mk
> > +++ b/toolchain/helpers.mk
> > @@ -79,9 +79,7 @@ copy_toolchain_lib_root = \
> >                       fi ; \
> >                       LIBPATH="`readlink -f $${LIBPATH}`"; \
> >               done; \
> > -     done; \
> > -\
> > -     printf
> > +     done
> >
> >  #
> >  # Copy the full external toolchain sysroot directory to the staging
> > --
> > 2.5.3
> >
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151004/3ece82e3/attachment.html>
