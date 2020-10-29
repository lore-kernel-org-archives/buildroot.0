From: Vladimir Oltean <olteanv@gmail.com>
Date: Fri, 30 Oct 2020 00:43:35 +0200
Subject: [Buildroot] [PATCH] configs/mvebu: new defconfig for Turris MOX
In-Reply-To: <20201029233047.0a90ac31@nic.cz>
References: <20201029215629.2120636-1-olteanv@gmail.com>
 <20201029233047.0a90ac31@nic.cz>
Message-ID: <20201029224335.4bldipauu2pkvnx2@skbuf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 29, 2020 at 11:30:47PM +0100, Marek Behun wrote:
> Vladimir, is the stock boot.scr okay for buildroot? If you are building
> only ext2 image, you do not need btrfs root fs flags, for example.

Yes it's ok and I am not using btrfs, I preferred to not modify what I
found.

> BTW we updated the stock boot.scr to address some issues, mainly the
> USB3 comphy issue.
> 
> Look at
> https://gitlab.nic.cz/turris/turris-os-packages/-/blob/master/hardware/mox/mox-support/files/boot.txt

Aha, is this supposed to fix the boot hang with CONFIG_XHCI_HCD=y? At
the moment I left that disabled in the mox.config provided here. If it
fixes that issue, it is worth picking up your FDT fixup done in the
boot.scr. But what about the mainline DTS file for MOX, can't you just
fix that directly?

> I find MOX powerfull enough to run full distro like Gentoo. What
> usecase do you have for using buildroot there?

I am just using it as my home office switch, with a number of other
boards connected to it. I literally need a single init script which sets
up the bridging domains and VLAN domains that my boards need, and that's
about it. I was also planning to involve it in some 1588/TSN testing
with the other boards though.
