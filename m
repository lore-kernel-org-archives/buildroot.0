From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Sep 2018 16:56:38 +0200
Subject: [Buildroot] [PATCH 1/1] ipsec-tools: needs host-bison
In-Reply-To: <20180920084522.1dea57e8@windsurf>
References: <20180915095906.11558-1-fontaine.fabrice@gmail.com>
 <87o9ctp5if.fsf@dell.be.48ers.dk>
 <20180920084522.1dea57e8@windsurf>
Message-ID: <20180920145638.GA11717@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On 2018-09-20 08:45 +0200, Thomas Petazzoni spake thusly:
> On Wed, 19 Sep 2018 23:00:08 +0200, Peter Korsgaard wrote:
> 
> >  > diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
> >  > index ddae9a75f3..8672272538 100644
> >  > --- a/package/ipsec-tools/ipsec-tools.mk
> >  > +++ b/package/ipsec-tools/ipsec-tools.mk
> >  > @@ -9,7 +9,7 @@ IPSEC_TOOLS_SOURCE = ipsec-tools-$(IPSEC_TOOLS_VERSION).tar.bz2
> >  >  IPSEC_TOOLS_SITE = http://sourceforge.net/projects/ipsec-tools/files/ipsec-tools/$(IPSEC_TOOLS_VERSION)
> >  >  IPSEC_TOOLS_INSTALL_STAGING = YES
> >  >  IPSEC_TOOLS_MAKE = $(MAKE1)
> >  > -IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
> >  > +IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex host-bison  
> > 
> > Hmm, shouldn't this use BR2_BISON_HOST_DEPENDENCY /
> > BR2_FLEX_HOST_DEPENDENCY instead?
> 
> No, that's not what we have agreed so far. Our idea was that
> BR2_BISON_HOST_DEPENDENCY and BR2_FLEX_HOST_DEPENDENCY would be used
> only for the kconfig stuff in the kernel/u-boot and al, but that we
> would keep using our own host-flex/host-bison for the rest, and
> especially for target packages.

Exactly, yes.

> There are two reasons to that:
> 
>  (1) We can be pretty confident that the flex/bison stuff in kconfig
>      will have been tested/exercised against a wide variety of
>      flex/bison versions, so using whatever flex/bison version
>      available on the host system is good enough. However, for the rest
>      of the packages that use flex/bison, we can't be so sure, so
>      having our own flex/bison version allows us to be sure that things
>      "will work".
> 
>  (2) For target packages, using the system-provided flex/bison version
>      means that the generated code can be subtly different between
>      flex/bison versions, which makes the build non-reproducible. Hence,
>      it is important to have our own fixed version of flex/bison. For
>      host packages, that is probably less of a concern, but point (1)
>      remains valid.
> 
> Do we still agree on this position, or do you have
> counter-arguments ? :-)

That position is still mine, yes. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
