From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 15:33:02 +0200
Subject: [Buildroot] [Patch v2 0/1] systemd: bump to v213
In-Reply-To: <1401918049-10503-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1401918049-10503-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140608153302.2cc49ded@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Wed,  4 Jun 2014 23:40:48 +0200, Eric Le Bihan wrote:
> This patch bumps systemd to v213.
> 
> This version features systemd-timesyncd, a SNTP daemon, which is useful on
> machines without a RTC, like Raspberry Pi.

Applied, thanks.

> Note that in order to have systemd and this daemon to run properly, some
> changes to /var, /run and /etc/resolv.conf in the target skeleton should be
> made. This can be done in a post-build script (see
> https://github.com/elebihan/buildroot-ext-elb/commit/557d5df324db4ec12d1b98bed7c1a899eb24bdb6
> for an example).

I think we should find a way of making this automatic. I believe it is
quite related to something we've discussed last week with Maxime: maybe
the skeleton should become a proper package, and should be freed from
everything Busybox-specific. Then, we can have additional
skeleton-busybox and skeleton-systemd packages, or some other mechanism
to introduce the specificities needed by these init systems (maybe
directly in the busybox and systemd packages).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
