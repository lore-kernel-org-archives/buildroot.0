From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:35:49 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/avahi: add optional support
 for libcap
In-Reply-To: <1456077439-26606-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456077439-26606-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221213549.5767bca8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 18:57:19 +0100, Bernd Kuhls wrote:
> When libcap was compiled before, avahi daemon will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/avahi-daemon | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libavahi-common.so.3]
>  0x0000000000000001 (NEEDED)             Shared library: [libavahi-core.so.7]
>  0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
> [...]
> 
> The build system offers no option to en-/disable libcap support:
> http://git.0pointer.net/avahi.git/tree/configure.ac#n382
> 
> The check for libcap was placed inside the BR2_PACKAGE_AVAHI_DAEMON
> because only avahi-daemon uses libcap, it provides chroot support.

Still, the configure.ac test is done unconditionally (i.e regardless
of whether the daemon is enabled or not), so I believe we should also
do the same.

Peter, Yann, Arnout, your thoughts?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
