From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Wed, 3 Jun 2015 18:27:53 -0300
Subject: [Buildroot] [PATCH v2 2/2] arch: tidy up binary formats config
In-Reply-To: <556F682B.1030306@mind.be>
References: <1432227249-15345-1-git-send-email-guido@vanguardiasur.com.ar>
 <1433340749-7711-1-git-send-email-guido@vanguardiasur.com.ar>
 <1433340749-7711-2-git-send-email-guido@vanguardiasur.com.ar>
 <556F682B.1030306@mind.be>
Message-ID: <20150603212753.GA2858@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 03, 2015 at 10:48:43PM +0200, Arnout Vandecappelle wrote:
> On 06/03/15 16:12, Guido Mart?nez wrote:
> > @@ -272,13 +276,13 @@ config BR2_BINFMT_SUPPORTS_SHARED
> >  # Set up target binary format
> >  choice
> >  	prompt "Target Binary Format"
> > -	default BR2_BINFMT_ELF if !(BR2_bfin || BR2_m68k)
> > -	default BR2_BINFMT_FDPIC if BR2_bfin
> > -	default BR2_BINFMT_FLAT if BR2_m68k
> > +	default BR2_BINFMT_ELF		if BR2_USE_MMU
> > +	default BR2_BINFMT_FDPIC	if BR2_ARCH_HAS_FDPIC_SUPPORT
> > +	default BR2_BINFMT_FLAT		if !BR2_USE_MMU
> 
>  I think this should either be without condition at all, or with a condition
> that matches the previous ones, i.e. if !BR2_USE_MMU && !BR2_ARCH_HAS_FDPIC_SUPPORT.
Ugh, right, either fully use the short circuiting or not at all. I'd say
we use no conditions on FLAT.

>  Also we normally don't do any vertical alignment at all, so just put a single
> space instead of tabs.
OK, agreed.

Would it be better for me to resend or is this simple enough to be fixed
up when commiting?

Thanks!

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
