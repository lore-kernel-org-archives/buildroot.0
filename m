From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 14:44:17 +0200
Subject: [Buildroot] [PATCH 2/2] package/xenomai: disable obstack support
In-Reply-To: <20170331202604.18153-2-romain.naour@gmail.com>
References: <20170331202604.18153-1-romain.naour@gmail.com>
 <20170331202604.18153-2-romain.naour@gmail.com>
Message-ID: <20170401144417.08a84fd7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Mar 2017 22:26:04 +0200, Romain Naour wrote:
> Obstack support in Xenomai is broken when the libc doesn't support
> obstack support itself. Make sure we disable obstack support for all
> libc since it was removed in uClibc-ng since 1.0.21 release and it's
> always disabled with Glibc.

What makes you say it's always disabled in glibc?

What's the status with musl?

Also, Xenomai seems to have some replacement code when obstack support
is not available from the C library. How does that interfact with
ELIDE_CODE ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
