From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 17:58:38 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <52394FAB.30109@mind.be>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20130917071737.4af20d60@skate> <20130917125352.GB13723@pc-eric>
 <20130917204539.7c788c2b@skate> <52394FAB.30109@mind.be>
Message-ID: <20130918175838.32d9763a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 18 Sep 2013 09:00:59 +0200, Arnout Vandecappelle wrote:

>   Perhaps it makes more sense to include the extra config for eudev and 
> systemd to the system menu? I think it's a bit strange to have to 
> navigate to a completely different, hard to find menu to enable systemd's 
> journal gateway...
> 
>   You can easily do this by moving the
> source "package/systemd/systemd.mk"
> line from package/Config.in to system/Config.in.

I already suggested that the selection of eudev vs. systemd should not
be in Target Packages, and Eric already made a proposal to solve this.
In fact, we don't need any new configuration option: when the systemd
init system is selected, then systemd is used. When another init
systemd is used, but the selected /dev management method is udev, then
we use eudev.

There's no need for more options. The only thing that Eric proposed is
to re-order the Init System selection vs. the /dev management selection
to make things a bit more logical.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
