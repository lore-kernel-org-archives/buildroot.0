From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 19:13:15 +0200
Subject: [Buildroot] [PATCH] perl-net-ssleay: fix configure
In-Reply-To: <1405381684-3844-1-git-send-email-yann.morin.1998@free.fr>
References: <1405381684-3844-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140715191315.374226d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 15 Jul 2014 01:48:04 +0200, Yann E. MORIN wrote:

> This is because perl-net-ssleay's buildsystem is really completely
> brain-damaged. Other perl extensions do not behave like that, and
> instead are doing the only same thing to do: not add single quotes

same -> sane

> around the definition, and just use what they were provided for
> lddlflags.

lddflags -> LDDLFLAGS.

> So, just do the same for perl-net-ssleay. Since tweaking (yet once
> more) their buildsystem is too complex, we just use a post-configure
> hook to fix up the mess, by removing single quotes around the definition
> of LDDLFLAGS.
> 
> Note: if only one option is specified, no single quotes are added,
> but out hook is a no-op in this case.

out -> our.

> +define PERL_NET_SSLEAY_FIX_MAKEFILE
> +	$(SED) "s/^LDDLFLAGS = '\(.*\)'/LDDLFLAGS = \1/" $(@D)/Makefile
> +endef
> +PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_FIX_MAKEFILE

I've fixed these and added a short comment above the hook definition to
explain what it is doing. Committed!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
