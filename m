From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 18:41:18 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <5239CF75.2050807@mind.be>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20130917071737.4af20d60@skate> <20130917125352.GB13723@pc-eric>
 <20130917204539.7c788c2b@skate> <52394FAB.30109@mind.be>
 <20130918175838.32d9763a@skate> <5239CF75.2050807@mind.be>
Message-ID: <20130918184118.3794c883@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 18 Sep 2013 18:06:13 +0200, Arnout Vandecappelle wrote:

> > I already suggested that the selection of eudev vs. systemd should
> > not be in Target Packages, and Eric already made a proposal to
> > solve this. In fact, we don't need any new configuration option:
> > when the systemd init system is selected, then systemd is used.
> > When another init systemd is used, but the selected /dev management
> > method is udev, then we use eudev.
> >
> > There's no need for more options. The only thing that Eric proposed
> > is to re-order the Init System selection vs. the /dev management
> > selection to make things a bit more logical.
> 
>   For systemd, journal compression and journal gateway still have to
> be selectable. IMHO it is not nice for the user to have to navigate
> to a completely unrelated place in order to enable those. So my
> suggestion is to include the Config.in that has these extra options
> immediately below the systemd selection in the system menu.

Hum, right. Probably makes sense, yes.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
