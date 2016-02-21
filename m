From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Feb 2016 22:46:26 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/avahi: add optional support
	for libcap
In-Reply-To: <87y4adaj6z.fsf@dell.be.48ers.dk>
References: <1456077439-26606-1-git-send-email-bernd.kuhls@t-online.de>
 <20160221213549.5767bca8@free-electrons.com>
 <87y4adaj6z.fsf@dell.be.48ers.dk>
Message-ID: <20160221214626.GE3456@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Thomas, Peter, All,

On 2016-02-21 21:43 +0100, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Dear Bernd Kuhls,
>  > On Sun, 21 Feb 2016 18:57:19 +0100, Bernd Kuhls wrote:
>  >> When libcap was compiled before, avahi daemon will use it as optional
>  >> dependency:
>  >> 
>  >> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/avahi-daemon | grep NEEDED | sort
>  >> 0x0000000000000001 (NEEDED)             Shared library: [libavahi-common.so.3]
>  >> 0x0000000000000001 (NEEDED)             Shared library: [libavahi-core.so.7]
>  >> 0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
>  >> [...]
>  >> 
>  >> The build system offers no option to en-/disable libcap support:
>  >> http://git.0pointer.net/avahi.git/tree/configure.ac#n382
>  >> 
>  >> The check for libcap was placed inside the BR2_PACKAGE_AVAHI_DAEMON
>  >> because only avahi-daemon uses libcap, it provides chroot support.
> 
>  > Still, the configure.ac test is done unconditionally (i.e regardless
>  > of whether the daemon is enabled or not), so I believe we should also
>  > do the same.
> 
>  > Peter, Yann, Arnout, your thoughts?
> 
> It's safer to do it unconditionally (and we are unlikely to have
> problems with dependency loops with avahi/libcap, so that's not an issue
> either).
> 
> So I would prefer to have it outside the _DAEMON conditional as well.

Yes, agreed.

With a comment explaining so, of course.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
