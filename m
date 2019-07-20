From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jul 2019 15:38:40 +0200
Subject: [Buildroot] [PATCH 0/2 v3] arch: allow passing compile flags
 (branch yem/arc-atomic)
In-Reply-To: <20190718225740.509c41f1@windsurf>
References: <cover.1563483157.git.yann.morin.1998@free.fr>
 <20190718225740.509c41f1@windsurf>
Message-ID: <20190720153840.62587aff@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Jul 2019 22:57:40 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Thu, 18 Jul 2019 22:52:46 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > Yann E. MORIN (2):
> >       toolchain: allow architectures to enforce compilation flags
> >       arch/arc: always needs -matomic with atomix extensions  
> 
> Thanks, I've applied the series. I extended the commit log of the
> second patch, because it was really terse.
> 
> Following this, I believe it would make sense to move the two remaining
> uses of TARGET_ABI in package/Makefile.in to the appropriate arch/
> file, and drop TARGET_ABI entirely. Indeed, those ABI options are
> really mandatory, if they don't get passed to the cross-compiler,
> things are going to be clearly wrong.

Also, in relation to this, I think we could probably revert commit
18855d79e2e86dc646182bd6f4861c491a05c624 one the TARGET_ABI flags are
encoded into the compiler wrapper.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
