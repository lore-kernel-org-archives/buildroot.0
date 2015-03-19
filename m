From: Mike Williams <mike@mikebwilliams.com>
Date: Thu, 19 Mar 2015 13:56:32 -0400
Subject: [Buildroot] RFC: systemd and service files cleanup
Message-ID: <1426787807-29510-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Currently, package service files for systemd are installed by buildroot in a variety of locations: /etc, /lib, and /usr/lib. For systemd, split /lib is deprecated and only checked if a split /lib and /usr/lib is enabled. /etc is meant for local customizations to the default service files. It is my opinion that buildroot should install all upstream package and buildroot-provided service files in /usr/lib, and this series cleans up our packages to do exactly that. Enabling them by default by linking them to /etc/systemd/system/multi-user.target.wants has been preserved.

Upstream systemd's standard installation directory for its binaries is /usr/lib. It appears that historically, buildroot's systemd installation location has been switched between /lib and /usr/lib multiple times. I couldn't find any particular reason for this, so I've moved it back to /usr/lib along with its service files.

Anyway, please send comments :).

Mike Williams
