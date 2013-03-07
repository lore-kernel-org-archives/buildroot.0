From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 6 Mar 2013 20:51:04 -0800
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <1362620699.20183.193.camel@genx>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar>
 <1362500477.20183.74.camel@genx> <20130305194707.474ded42@skate>
 <1362592916.20183.152.camel@genx> <20130306195844.2f8c14b6@skate>
 <1362599417.20183.159.camel@genx>
 <069B5A25F9844945B625ADE7258AC94C061FF823@4rf-nz-orion.local.4rf.com>
 <20130306210831.4fbe8150@skate> <1362602480.20183.169.camel@genx>
 <20130306215414.23271383@skate> <1362603756.20183.170.camel@genx>
 <20130306221441.03439842@skate> <1362604828.20183.172.camel@genx>
 <20130306222902.2d736c06@skate> <1362610654.20183.176.camel@genx>
 <CAKcgs2wB=t_PY9hSEc2137Axov5=s8ugLnktRkbWgXBaXsVq2g@mail.gmail.com>
 <1362620699.20183.193.camel@genx>
Message-ID: <CAKcgs2yMcJMbJ+aM3XSpV7TdFdrAgTzZx0v6DL6qHv0gWv2SKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John,

> That did help.  Thank you.
> The build now fails because it can't find ifaddrs.h:
> ipv6.c:34:21: error: ifaddrs.h: No such file or directory
> net.c:56:21: error: ifaddrs.h: No such file or directory
>
> But I do see the file here:
> ./output/toolchain/uClibc-0.9.32/include/ifaddrs.h
>
> Is there a good way to specify the path in my .mk file?
Did you build your toolchain with Buildroot? In buildroot-2011.11,
this feature is not enabled in uClibc-0.9.32 configuration.
In order to enable it, you can follow these steps (if you built your
toolchain using buildroot):

1. in  toolchain/uClibc/uClibc-0.9.32.config, replace
# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
with
UCLIBC_SUPPORT_AI_ADDRCONFIG=y

2. run "make clean" then
3. run "make". Toolchain will be rebuilt with ifaddrs.h

This should get you going.
Gilles.
