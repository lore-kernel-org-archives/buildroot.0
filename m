From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 19:34:15 +0100
Subject: [Buildroot] [PATCH v2 0/6] package: udev is now provided by
 systemd or eudev
In-Reply-To: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1379679847-16141-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20131102193415.5f3ac96f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 20 Sep 2013 14:24:01 +0200, Eric Le Bihan wrote:

> This series converts udev to a virtual package, either provided by systemd or
> eudev.
> 
> Starting with version 183, udev has been merged into systemd. This forces the
> use of systemd as the init system if /dev is to be dynamically managed by
> udev. eudev is a fork of udev, maintained by Gentoo, but isolated from
> systemd, so it can be used with any init system.
> 
> Systemd has been bumped to v206 and a new eudev package has been added.
> Version 1.2 of eudev is in sync with systemd v206 (v1.3 will be in sync with
> v207).
> 
> The bump of systemd to v206 also introduces new options, like the activation
> of the journal gateway.
> 
> In the end:
> 
>   - if systemd is selected as init system, the /dev management will handled by
>     udev. No either choice possible.
>   - if busybox or SysV is chosen, the user can choose to manage /dev
>     statically, or dynamically using mdev or eudev.

Thanks! I've made a few comments on PATCH 3/6, mainly around
bisectability and other questions.

However, I wanted to test this patch set, especially to understand
better the impact on the System configuration, but the patches no
longer apply. Would you mind fixing the few comments, and resending an
updated series on top of the latest master?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
