From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jul 2019 23:33:11 +0200
Subject: [Buildroot] [PATCH v4 10/15] arch/arm: some cores have a
 different name with gcc-9
In-Reply-To: <3271a2ff-fcd9-6169-a59e-6f29fca3c34f@mind.be>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-11-giulio.benetti@micronovasrl.com>
 <3271a2ff-fcd9-6169-a59e-6f29fca3c34f@mind.be>
Message-ID: <20190713213311.GG2680@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

Thanks for eventually applying the series. :-)

On 2019-07-13 23:13 +0200, Arnout Vandecappelle spake thusly:
> On 20/06/2019 12:07, Giulio Benetti wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [snip]
> > The ordering of the 'default' clauses in kconfig is important, with the
> > first default which conditions is satisfied, to be used, so we just add
> > the new core names under a more liberal condition than the older names.
> 
>  This is not so readable / readily understandable, IMO. Therefore, I've changed
> this into:

We depend on the default ordering in other places as well.

> [snip]
> > +	default "thunderx"	if BR2_thunderx && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
> > +	default "octeontx"	if BR2_thunderx
> 
> 	default "thunderx"	if BR2_thunderx && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
> 	default "octeontx"	if BR2_thunderx && BR2_TOOLCHAIN_GCC_AT_LEAST_9

You and I reallt have a differnt way toi see things, because I find this
less readable now...

But oh well...

Thanks for applying anyway. :-)

Regards,
Yann E. MORIN.

> etc.
> 
>  Regards,
>  Arnout
> 
> > +	default "thunderxt81"	if BR2_thunderxt81 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
> > +	default "octeontx81"	if BR2_thunderxt81
> > +	default "thunderxt83"	if BR2_thunderxt83 && !BR2_TOOLCHAIN_GCC_AT_LEAST_9
> > +	default "octeontx83"	if BR2_thunderxt83
> >  	default "thunderxt88"	if BR2_thunderxt88
> >  	default "thunderxt88p1"	if BR2_thunderxt88p1
> >  	default "xgene1"	if BR2_xgene1
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
