From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Feb 2017 17:43:42 +0100
Subject: [Buildroot] [PATCH 2/2] logrotate: enable selinux support.
In-Reply-To: <20170207140411.2656-2-Adamduskett@outlook.com>
References: <20170207140411.2656-1-Adamduskett@outlook.com>
 <20170207140411.2656-2-Adamduskett@outlook.com>
Message-ID: <20170207174342.3957512b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Feb 2017 09:04:11 -0500, Adam Duskett wrote:
> Selinux is currently disabled staticly in logrotate. This patch
> fixes this by checking for libselinux and adding it as a dependecy
> if it has been selected.  The configure script is set to check for
> libselinux by default, so I only set --without-selinux implicitly
> if libselinux hasn't been selected, otherwise it's left alone.

No, we really want --with-selinux. If you don't pass --with-selinux,
then the default beaviour of this configure is to "check", which means
that if it finds SELinux support, it enables it, otherwise it moves on
with SELinux disabled.

But in Buildroot, if we enable SELinux support, we really want it. We
don't want package to silently ignore it if there's some kind of error.
Which is why for all optional dependencies, we always explicitly
enable/disable it.

I've fixed that up and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
