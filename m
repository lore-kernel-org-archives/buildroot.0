From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 15:56:14 +0200
Subject: [Buildroot] Why is /var/log symlinked to a tmpfs?
In-Reply-To: <1494763200132-164905.post@n4.nabble.com>
References: <1494763200132-164905.post@n4.nabble.com>
Message-ID: <20170514155614.50032272@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 May 2017 05:00:00 -0700 (PDT), PTaylor.us wrote:
> First, I must say that buildroot is a great tool. Thank you.
> 
> I am using buildroot branch 2016.11.x.
> 
> Why is /var/log a symlink to /tmp (which is mounted with a tmpfs). My
> understanding is that */var/log should be persistent across reboots*. I'm
> very curious why the default skeleton was setup like this. It is causing
> problems, for one, with journald where the "fix" I've seen suggested on this
> mailing list is to set the logging to "volatile". 

The reason why /var/log is a symlink to a tmpfs is because we want to
support the root filesystem to be mounted read only.

We know the current skeleton has some issues with journald (see
https://bugs.busybox.net/show_bug.cgi?id=7892), and Yann E. Morin is
working on a patch series to address this, see:

  https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton
  https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton-2

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
