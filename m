From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Feb 2014 09:05:55 +0100
Subject: [Buildroot] [PATCH] webkit: disable on < ARMv5t
In-Reply-To: <53059EBE.6030902@mind.be>
References: <1392847730-14412-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53059EBE.6030902@mind.be>
Message-ID: <20140220090555.42dc8d0d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 20 Feb 2014 07:20:46 +0100, Arnout Vandecappelle wrote:

> > diff --git a/package/webkit/Config.in b/package/webkit/Config.in
> > index 0207a6d..daaec36 100644
> > --- a/package/webkit/Config.in
> > +++ b/package/webkit/Config.in
> > @@ -1,11 +1,18 @@
> > +config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
> > +	bool
> > +	# ARM needs BLX, so v5t+
> > +	default y if (BR2_arm || BR2_armeb) && \
> > +		!(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
> > +	default y if BR2_i386 || BR2_mips || BR2_mipsel || \
> > +		BR2_powerpc || BR2_sh || BR2_sparc || BR2_x86_64
> 
>  We normally write
> 
> 	depends on FOO
> 	depends on BAR
> 
> rather than
> 
> 	depends on FOO && BAR
> 
>  Shouldn't we do the same here?
> 
> 	default y if BR2_i386
> 	default y if BR2_mips

Are you talking about the first line (about ARM), or the second line
(for all the other architectures) ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
