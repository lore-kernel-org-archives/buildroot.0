From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 20 Mar 2015 14:18:39 +0100
Subject: [Buildroot] RFC: systemd and service files cleanup
In-Reply-To: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
References: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <CAHXCMMJBdnDBSqdqCL1Hbx9dmUQ2obxD-kDBTpPuoO=pkTgYvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike, all,

On Thu, Mar 19, 2015 at 6:56 PM, Mike Williams <mike@mikebwilliams.com> wrote:
> All,
>
> Currently, package service files for systemd are installed by buildroot in a variety of locations: /etc, /lib, and /usr/lib. For systemd, split /lib is deprecated and only checked if a split /lib and /usr/lib is enabled. /etc is meant for local customizations to the default service files. It is my opinion that buildroot should install all upstream package and buildroot-provided service files in /usr/lib, and this series cleans up our packages to do exactly that. Enabling them by default by linking them to /etc/systemd/system/multi-user.target.wants has been preserved.
>
> Upstream systemd's standard installation directory for its binaries is /usr/lib. It appears that historically, buildroot's systemd installation location has been switched between /lib and /usr/lib multiple times. I couldn't find any particular reason for this, so I've moved it back to /usr/lib along with its service files.
>
> Anyway, please send comments :).

Thanks for helping improving this point. :)

Just one global comment:
In the series, you change all relative symlink with absolute one.
We use to use relative symlink to avoid confusing people looking at
the target tree because they are still right.

I don't have strong opinion about this, so let's see what others think about it.

Regards,

-- 
Samuel
