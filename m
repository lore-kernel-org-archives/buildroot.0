From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 18 Jun 2019 09:01:52 +0200
Subject: [Buildroot] [PATCH 2/2] package/iputils: fix IPUTILS_PERMISSIONS
In-Reply-To: <20190618084948.0a451f1b@windsurf>
References: <20190616200919.4378-1-thomas.petazzoni@bootlin.com>
 <20190616200919.4378-2-thomas.petazzoni@bootlin.com>
 <20190617203235.GB8498@x230> <20190618084948.0a451f1b@windsurf>
Message-ID: <20190618070151.GD8350@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Hello,

> On Mon, 17 Jun 2019 22:32:36 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > The only thing to consider:
> > Upstream doesn't care much about systems without usr merge.
> > I wonder if systems without it (unset BR2_ROOTFS_MERGED_USR),
> > whether we want to have /bin/ping and symlinked it into /usr/bin/ping.
> > I see this is handled for coreutils (COREUTILS_BIN_PROGS).

> What COREUTILS_CLEANUP_BIN is doing is not to install a symlink
> between /bin/foo and /usr/bin/foo. Indeed, such a symlink is not
> necessary: both /bin and /usr/bin are in the PATH, so having /bin/foo
> and /usr/bin/foo is totally useless.

> What COREUTILS_CLEANUP_BIN does is to make sure that in a
> non-BR2_ROOTFS_MERGED_USR case, the symlinks to coreutils are installed
> in the same location as the corresponding Busybox applets, so that we
> properly handle the conflict between Busybox applets and full-blown
> variants, as I explained in my reply to your comments on PATCH 1/2.

Thanks for an explanation.

Kind regards,
Petr

> Best regards,

> Thomas
