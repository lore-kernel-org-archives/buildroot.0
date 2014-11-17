From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2014 18:59:18 +0100
Subject: [Buildroot] [PATCH] package/rpm: add missing dependency to
	openssl
In-Reply-To: <87h9xyd8wv.fsf@dell.be.48ers.dk>
References: <1416178563-624-1-git-send-email-yann.morin.1998@free.fr>
 <87h9xyd8wv.fsf@dell.be.48ers.dk>
Message-ID: <20141117175917.GA12473@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-11-17 00:26 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > We forcibly enable use of an extrernal openssl in rpm, so we must depend
>  > on it.
> 
>  > openssl is correctly selected from kconfig, but there is no build-time
>  > dependency to it.
> 
>  > It was not an issue so far, because openssl always sorts before rpm, so
>  > gets built before. Unless one wants to just build rpm to debug an
>  > autobuilder failure, that is.
> 
>  > Add that build-time dependency to openssl.
> 
> Committed, thanks.
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > ---
>  >  package/rpm/rpm.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>  > diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
>  > index af1642f..50e6d75 100644
>  > --- a/package/rpm/rpm.mk
>  > +++ b/package/rpm/rpm.mk
>  > @@ -7,7 +7,7 @@
>  >  RPM_VERSION_MAJOR = 5.2
>  >  RPM_VERSION = $(RPM_VERSION_MAJOR).0
>  >  RPM_SITE = http://rpm5.org/files/rpm/rpm-$(RPM_VERSION_MAJOR)
>  > -RPM_DEPENDENCIES = zlib beecrypt neon popt
>  > +RPM_DEPENDENCIES = zlib beecrypt neon popt openssl
> 
> A quick check seems to show that zlib isn't selected from Config.in. Is
> it needed (besides indirectly from openssl)?

Yes, rpm needs it, too. I'll cook a patch. Thanks for noticing.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
