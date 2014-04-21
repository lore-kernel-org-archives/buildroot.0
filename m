From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 22:29:01 +0200
Subject: [Buildroot] [RFC] pkg-autotools: check if host-pkgconf should
 be part of the dependencies
In-Reply-To: <20140421201610.GJ3359@free.fr>
References: <1398105498-7055-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140421201610.GJ3359@free.fr>
Message-ID: <20140421222901.52941bf8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 21 Apr 2014 22:16:10 +0200, Yann E. MORIN wrote:

> > +define CHECK_PKG_CONFIG_HOOK
> > +	$(Q)if grep -q PKG_CHECK_MODULES $$($$(PKG)_SRCDIR)/configure.{ac,in}; then \
> 
> I know we do not support building on anything but a GNU userland.
> However, 'grep -q' is not portable. Can we just use the more poprtable
> constrcut 'grep ... >/dev/null 2>&1' instead?

Hum, well, will we ever run on anything but a GNU userland? We already
have tons of "grep -q" usage everywhere in the tree.

But anyway, I'll leave that up to Peter, I'm not going to merge myself
such a change that I've written myself.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
