From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Aug 2016 00:16:10 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
	kconfig snippet
In-Reply-To: <87poosaa9d.fsf@dell.be.48ers.dk>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
 <20160827161601.2fd0e8f5@free-electrons.com>
 <87poosaa9d.fsf@dell.be.48ers.dk>
Message-ID: <20160829221610.GC5829@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

On 2016-08-28 22:50 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  > On Sun, 17 Jul 2016 12:34:26 +0200, Yann E. MORIN wrote:
>  >> +# Ensure the kconfig snippet is generated (for MANUAL_GEN_LISTS, below):
>  >> +MANUAL_DEPENDENCIES += prepare-kconfig
> 
>  > It's a bit crazy the complexity that we have just to allow our manual
>  > to have the list of all packages in Buildroot. I'm not even sure this
>  > section of the manual is that useful, to be honest. But oh well, that's
>  > supported today, so we have to continue support it.
> 
> Why do we _HAVE_ to continue to support it?
> 
> If we don't find the complexity worth the added value (I personally
> don't, I think we could just ask people to look under package/ for the
> list of packages), then we should just remove it.

I'm not entirely against removing the list of out packages from our
manual.

Yet, for some users of br2-external trees, they may still want to have
the list of their packages in their manuals, build with the asciidoc
infrastructure.

It is entirely imaginable that such users of br2-external have packages
annotated with some documentation for those packages, and want to
include that doc in their manual, so need to generate that list from
Kconfig.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
