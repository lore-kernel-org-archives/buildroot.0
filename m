From: Mike Williams <mike@mikebwilliams.com>
Date: Wed, 13 Aug 2014 10:19:40 -0400
Subject: [Buildroot] timesyncd cannot start due to /var/tmp symlink
Message-ID: <CANPyyuP+QkxgxbEvh7k5SdX-a3wegU1KPAo9TbBCiXPs7o+O3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Reposting because I think I resurrected a dead patch thread last time:

Using the latest buildroot from git with systemd 215, timesyncd fails
to start with status 226/NAMESPACE. It appears to be due to
PrivateTmp=yes in the service file, and /var/tmp being a symlink. See
other bug reports for details:
https://bugzilla.redhat.com/show_bug.cgi?id=835131

Manually applying the steps in this patch to the target tree fixes the
problem and allows timesyncd to start properly:
http://lists.busybox.net/pipermail/buildroot/2014-July/101100.html

Thanks,
Mike
