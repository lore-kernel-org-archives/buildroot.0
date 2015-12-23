From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 23 Dec 2015 19:26:58 +0100
Subject: [Buildroot] [PATCH v3 5/7] package/nodejs: remove version choice
In-Reply-To: <20151223185653.19830dfe@free-electrons.com>
References: <1450872968-5834-1-git-send-email-martin@barkynet.com>
 <1450872968-5834-5-git-send-email-martin@barkynet.com>
 <20151223185653.19830dfe@free-electrons.com>
Message-ID: <20151223182658.GB3426@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, Thomas, All,

On 2015-12-23 18:56 +0100, Thomas Petazzoni spake thusly:
> On Wed, 23 Dec 2015 12:16:06 +0000, Martin Bark wrote:
> > diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> > index eb3aeec..1aac38e 100644
> > --- a/package/nodejs/Config.in
> > +++ b/package/nodejs/Config.in
> > @@ -6,6 +6,7 @@ config BR2_PACKAGE_NODEJS
> >  	depends on !BR2_MIPS_SOFT_FLOAT
> >  	# ARM needs BLX, so v5t+
> >  	depends on !BR2_ARM_CPU_ARMV4
> > +	depends on BR2_PACKAGE_NODEJS_0_10_X || BR2_PACKAGE_NODEJS_5_X
> 
> I don't like that the main BR2_PACKAGE_NODEJS option depends on
> BR2_PACKAGE_NODEJS_0_10_X || BR2_PACKAGE_NODEJS_5_X.
> 
> Instead, please do something like:
> 
> BR2_PACKAGE_NODEJS_VERSION
> 	string
> 	default "5.3.0"   if BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 && BR2_USE_WCHAR
> 	default "0.10.41"
> 
> And then use BR2_PACKAGE_NODEJS_VERSION in nodejs.mk to find which
> version to use.

And even if it is not a visible option, please keep it in the if-nodejs
conditional block.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
