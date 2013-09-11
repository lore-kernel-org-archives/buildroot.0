From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Sep 2013 19:03:40 +0200
Subject: [Buildroot] [PATCH 2/3] Add support for BR2_EXTERNAL
In-Reply-To: <OF916AAFB6.8E78891C-ON86257BE3.000A49F0-86257BE3.000B5AF0@rockwellcollins.com>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378646129-4167-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF916AAFB6.8E78891C-ON86257BE3.000A49F0-86257BE3.000B5AF0@rockwellcollins.com>
Message-ID: <20130911170340.GA3410@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2013-09-10 21:03 -0500, rjbarnet at rockwellcollins.com spake thusly:
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/08/2013 
> 08:15:28 AM:
> 
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  Config.in             |  6 ++++--
> >  Makefile              | 29 +++++++++++++++++++++++++----
> >  docs/manual/manual.mk |  2 +-
> 
> One idea that I have, is for the make file that is genreated for the an
> external output directory, if we could preserve the the value of 
> BR2_EXTERNAL
> as follows. I don't think my logic is fully there but there is more of a 
> sudo implementation:
> 
> diff --git a/support/scripts/mkmakefile b/support/scripts/mkmakefile
> --- a/support/scripts/mkmakefile
> +++ b/support/scripts/mkmakefile
> @@ -27,6 +27,7 @@ makedir := \$(dir \$(call lastword,\$(MAKEFILE_LIST)))
> 
>  MAKEARGS := -C $1
>  MAKEARGS += O=\$(if \$(patsubst /%,,\$(makedir)),\$(CURDIR)/)\$(patsubst 
> %/,%,\$(makedir))
> +MAKEARGS += BR2_EXTERNAL=\$(realpath \$(BR2_EXTERNAL))

Why realpath? I think we should pass the exact value of BR2_EXTERNAL.

Otherwise, I agree that this could be usefull.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
