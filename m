From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Tue, 27 Jul 2010 12:54:53 +0100
Subject: [Buildroot] Evaluation of make variables
In-Reply-To: <20100727134209.5fddfa7b@surf>
References: <1280226977.22687.37.camel@dubciaranr1.verifone.com>
	<20100727134209.5fddfa7b@surf>
Message-ID: <1280231693.22687.47.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar M?irt, 2010-07-27 ag 13:42 +0200, scr?obh Thomas Petazzoni:
> While I'd like to see the bootloaders use an infrastructure, the
> genpackage infrastructure is really designed for *packages* (with the
> concept of staging and target installation, which are meaningless
> concepts for bootloaders). I'm not sure just using the genpackage
> infrastructure is OK. But I'm open to see the result of your work and
> see how it looks.

Well my reason for looking at this was so that I could use Maxime's
git/svn patches to use a git repo to hold the U-Boot source.  As it
stands only Makefiles using gentargets can use this.  I would want to do
this for the linux kernel too.
Other details like ..._VERSION are not suited to the git/svn approach
either so I may just have to hack in the download part for my own
purposes.  If I think I have something that may be useful beyond that,
I'll post it.

> You can't use make ifeq/ifneq tests inside define...endef blocks.

Is this an inherent limitation of the make syntax or specific to the
layout of the buildroot makefiles?

> I.e, use no condition inside the hook implementation, and put the
> condition at the hook registration site.

I feared as much...
