From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Feb 2014 22:34:52 +0100
Subject: [Buildroot] [PATCH v7 0/4] udev is now provided by systemd or
	eudev
In-Reply-To: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Fri, 7 Feb 2014 14:21:31 +0100")
References: <1391779295-19140-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <87r478qakj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > This series converts udev to a virtual package, either provided by systemd or
 > eudev.

 > Starting with version 183, udev has been merged into systemd. This forces the
 > use of systemd as the init system if /dev is to be dynamically managed by
 > udev. eudev is a fork of udev, maintained by Gentoo, but isolated from
 > systemd, so it can be used with any init system.

 > Systemd has been bumped to v207 and a new eudev package has been added.
 > Version 1.3 of eudev is in sync with systemd v207.

 > The bump of systemd to v207 also introduces new options, like the activation
 > of the journal gateway.

 > In the end:

 >   - if systemd is selected as init system, the /dev management will handled by
 >     udev. No other choice possible.
 >   - if busybox or SysV is chosen, the user can choose to manage /dev
 >     statically, or dynamically using mdev or eudev.

 > Changes v6 -> v7:
 >   - updated udev related symbols and improved help text in Config.in.legacy
 >     (suggested by ThomasDS).
 >   - removed redundant comments on dependencies for systemd and eudev
 >     (suggested by ThomasDS).
 >   - fixed packages not properly converted to BR2_PACKAGE_HAS_UDEV
 >     (reported by SamuelM).

Committed series to next, thanks!

-- 
Bye, Peter Korsgaard
