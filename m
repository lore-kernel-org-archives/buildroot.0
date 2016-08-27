From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Aug 2016 00:54:29 +0200
Subject: [Buildroot] [PATCH RFC] Revert "Added local directory as source
 of kernel code"
In-Reply-To: <20160827222353.02bc0df2@free-electrons.com>
References: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
 <20160827222353.02bc0df2@free-electrons.com>
Message-ID: <20160827225429.GP5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-27 22:23 +0200, Thomas Petazzoni spake thusly:
> Peter, Yann,
> 
> Peter: do you have an opinion on this patch. If not, I think I'm going
> to apply it, so please raise your opinion if you disagree.
> 
> Yann: a few questions below.
> 
> On Tue, 28 Jun 2016 00:34:04 +0200, Yann E. MORIN wrote:
> > -config BR2_LINUX_KERNEL_CUSTOM_LOCAL
> > -	bool "Local directory"
> > -	help
> > -	  This option allows Buildroot to get the Linux kernel source
> > -	  code from a local directory.
> 
> What about Config.in.legacy handling?

Bummer...

> >  # Compute LINUX_SOURCE and LINUX_SITE from the configuration
> > -ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
> > +ifeq ($(LINUX_VERSION),custom)
> 
> Why are you doing this change?

Before, both local tarball and local directory could set LINUX_VERSION
to "custom". Now only the local tarball can. So I switched.

In restrospect, this change is not nice: all other cases deal with the
option from the choice, so we should indeed keep it for local tarball
too. Besides, LINUX_VERSION is derived from the local tarball option, so
better to use the "mother" option than the derived one.

I'll fix that and take care of legacy, then respin.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
