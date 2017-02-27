From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Feb 2017 22:09:28 +0100
Subject: [Buildroot] [git commit] assimp: work around gcc bug on SuperH
In-Reply-To: <878torl57w.fsf@dell.be.48ers.dk>
References: <20170227203901.6122181861@busybox.osuosl.org>
 <878torl57w.fsf@dell.be.48ers.dk>
Message-ID: <20170227220928.50ad4bd2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Feb 2017 22:00:03 +0100, Peter Korsgaard wrote:

>  > +# workaround SuperH compiler failure when static linking (i.e -fPIC is
>  > +# not passed) in gcc versions 5.x or older. The -Os optimization level
>  > +# causes a "unable to find a register to spill in class
>  > +# __GENERAL_REGS__" error. -O2 works fine.  
> 
> Any specific reason for the unicode quotes?

Nope, this message was copy/pasted from the gcc output, so the quotes
come from here.

> > +ifeq ($(BR2_sh):$(BR2_STATIC_LIBS):$(BR2_HOST_GCC_AT_LEAST_6),y:y:)  
> 
> HOST_GCC? Don't you mean BR2_TOOLCHAIN_GCC_AT_LEAST_6?

Gaah. Shit. I'll fix this. Thanks for reviewing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
