From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 11:45:00 +0200
Subject: [Buildroot] systemd-timesyncd fails to start
In-Reply-To: <e98da8cb-40e1-c8bf-4393-dfff8c828d79@jikos.cz>
References: <e98da8cb-40e1-c8bf-4393-dfff8c828d79@jikos.cz>
Message-ID: <20161018114500.1a6f76e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Oct 2016 10:55:26 +0200, Petr Kulhavy wrote:

> there is a peculiar problem with systemd NTP synchronization, that in 
> the default rootfs the systemd-timesyncd.service always fails to start.
> The reason is that systemd-timesyncd requires the /var/tmp to be a 
> permanent storage and not just a link to /tmp.
> See the second comment on this page: 
> https://bbs.archlinux.org/viewtopic.php?id=151937
> And really, if I replace the symlink with an empty folder it starts working.
> 
> I'm wondering what is the proper way to fix this. By default buildroot 
> creates /var/tmp as a link to /tmp, however
> on some platforms the rootfs might be read-only or very limited in 
> space, so making /var/tmp permanent might break other things...
> 
> It would be greatly appreciated if anybody could shed more light on this.

I've added Yann E. Morin in Cc. He is working on a revamp of the root
filesystem skeleton for the systemd case, specifically to solve this
sort of problem.

You can have a look at
https://github.com/yann-morin-1998/buildroot/commits/yem/systemd-skeleton,
but I'm not sure it's the latest updated work from Yann.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
