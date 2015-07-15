From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jul 2015 11:01:10 +0200
Subject: [Buildroot] [PATCH] libsigsegv: unavailable for powerpc with
 uclibc
In-Reply-To: <20150706173812.113b4336@free-electrons.com>
References: <1436191311-23939-1-git-send-email-gustavo@zacarias.com.ar>
 <20150706173812.113b4336@free-electrons.com>
Message-ID: <20150715110110.23ba4d7f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gustavo,

On Mon, 6 Jul 2015 17:38:12 +0200, Thomas Petazzoni wrote:

> On Mon,  6 Jul 2015 11:01:51 -0300, Gustavo Zacarias wrote:
> 
> > +	# No ucontext support in uclibc for powerpc
> > +	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
> >  	help
> >  	  Library for handling page faults in user mode.
> >  
> >  	  http://libsigsegv.sourceforge.net/
> > +
> > +comment "libsigsegv needs an (e)glibc toolchain"
> > +	depends on BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC
> 
> What about musl? :-)

Any news?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
