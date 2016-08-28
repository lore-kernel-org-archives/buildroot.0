From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 09:23:39 +0200
Subject: [Buildroot] [PATCH RFC] Revert "Added local directory as source
 of kernel code"
In-Reply-To: <20160827225429.GP5755@free.fr>
References: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
 <20160827222353.02bc0df2@free-electrons.com>
 <20160827225429.GP5755@free.fr>
Message-ID: <20160828092339.0b702649@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Aug 2016 00:54:29 +0200, Yann E. MORIN wrote:

> > >  # Compute LINUX_SOURCE and LINUX_SITE from the configuration
> > > -ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
> > > +ifeq ($(LINUX_VERSION),custom)  
> > 
> > Why are you doing this change?  
> 
> Before, both local tarball and local directory could set LINUX_VERSION
> to "custom". Now only the local tarball can. So I switched.
> 
> In restrospect, this change is not nice: all other cases deal with the
> option from the choice, so we should indeed keep it for local tarball
> too. Besides, LINUX_VERSION is derived from the local tarball option, so
> better to use the "mother" option than the derived one.

Exactly my thinking.

> I'll fix that and take care of legacy, then respin.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
