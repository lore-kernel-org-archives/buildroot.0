From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 12:31:11 -0700
Subject: [Buildroot] RFC: systemd and service files cleanup
In-Reply-To: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <CAKbGBLj66AmB6kxrp1utLmZ+AhWN+-0aDERdD=4FtAi=UHT_ig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 19, 2015 at 10:56 AM, Mike Williams <mike@mikebwilliams.com> wrote:
> All,
>
> Currently, package service files for systemd are installed by buildroot in a variety of locations: /etc, /lib, and /usr/lib. For systemd, split /lib is deprecated and only checked if a split /lib and /usr/lib is enabled. /etc is meant for local customizations to the default service files. It is my opinion that buildroot should install all upstream package and buildroot-provided service files in /usr/lib, and this series cleans up our packages to do exactly that. Enabling them by default by linking them to /etc/systemd/system/multi-user.target.wants has been preserved.
>
> Upstream systemd's standard installation directory for its binaries is /usr/lib. It appears that historically, buildroot's systemd installation location has been switched between /lib and /usr/lib multiple times. I couldn't find any particular reason for this, so I've moved it back to /usr/lib along with its service files.
>
> Anyway, please send comments :).
>

Nice. Basically any systemd units installed by Buildroot should be in
/usr/lib/systemd/system and nothing from Buildroot should be installed
to /etc/systemd/system, so I agree with this series as a whole in
terms of direction.

Also, I have a related patch set, but it has only had very light
testing on my end:

http://git.uplinklabs.net/snoonan/projects/buildroot.git/log/?h=unified-bin

I come from the Arch Linux world, so I made a new skeleton that
matches the Arch base filesystem layout: with /bin, /sbin, /usr/bin,
and /usr/sbin all unified (likewise with /lib and /usr/lib). I haven't
convinced myself to post the series because I can't think of a
particularly good justification for it in the Buildroot context.
