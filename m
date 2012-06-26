From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jun 2012 16:23:21 +0200
Subject: [Buildroot] [PATCH 3/3] libpcap: canusb support needs pthreads
In-Reply-To: <1340720390-22117-3-git-send-email-gustavo@zacarias.com.ar>
References: <1340720390-22117-1-git-send-email-gustavo@zacarias.com.ar>
 <1340720390-22117-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120626162321.0859b162@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 26 Jun 2012 11:19:50 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> canusb support in libpcap uses pthreads but the configure script doesn't
> account for -lpthread usage so it doesn't get added into LIBS which in
> turn doesn't add the appropiate entry in pcap-config, causing build
> failures for programs that link to libpcap that don't use pthreads
> themselves (for example tcpdump).
> Also add the conditional dependency on BR2_PACKAGE_LIBUSB for canusb.

So maybe we need an additional BR2_TOOLCHAIN_HAS_THREADS dependency
somewhere?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
