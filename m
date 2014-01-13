From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Date: Mon, 13 Jan 2014 14:04:15 -0200
Subject: [Buildroot] [PATCH v6 0/5] udev is now provided by systemd or
	eudev
In-Reply-To: <1389627907-7821-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1389627907-7821-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAKi4VAJs4xU0YNJGyf9nuU4YDpKKpcJydg=j8Jf3-_g0iJ_kUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Mon, Jan 13, 2014 at 1:45 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> This series converts udev to a virtual package, either provided by systemd or
> eudev.
>
> Starting with version 183, udev has been merged into systemd. This forces the
> use of systemd as the init system if /dev is to be dynamically managed by
> udev. eudev is a fork of udev, maintained by Gentoo, but isolated from
> systemd, so it can be used with any init system.
>
> Systemd has been bumped to v207 and a new eudev package has been added.
> Version 1.3 of eudev is in sync with systemd v207.
>
> The bump of systemd to v207 also introduces new options, like the activation
> of the journal gateway.
>
> In the end:
>
>   - if systemd is selected as init system, the /dev management will handled by
>     udev. No other choice possible.
>   - if busybox or SysV is chosen, the user can choose to manage /dev
>     statically, or dynamically using mdev or eudev.
>
> Changes v5 -> v6:
>   - fixed packages not properly converted to BR2_PACKAGE_HAS_UDEV
>     (reported by Samuel M.).
>   - forced inotify support in Linux if eudev is used for /dev management.
>   - forced inotify support in Linux if systemd is used as init system.
>   - updated information about systemd requirements.

Looks good. I'm successfully using this.

thanks

Lucas De Marchi
