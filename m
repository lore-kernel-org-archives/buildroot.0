From: Wetzel Andreas <Andreas.Wetzel@nanotronic.ch>
Date: Fri, 25 Sep 2015 11:12:00 +0000
Subject: [Buildroot] [PATCH 1/1] libwebsockets: add option to
 enable/disable ipv6 support
In-Reply-To: <20150923230236.5b5c5302@free-electrons.com>
References: <1443014194-24211-1-git-send-email-andreas.wetzel@nanotronic.ch>,
 <20150923230236.5b5c5302@free-electrons.com>
Message-ID: <0dc07792d2e04be6b1628563695e9e28@LysExc01.nanotronic.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Ok, I was not aware that you made IPv6 mandantory. Sorry for that.

Currently, IPv6 is always enabled for libwebsockets.
In a project we used a kernel without support for IPv6. libwebsockets (with ipv6 support) seem to cause problems if the kernel does not support IPv6 at all. That's why I thought such configuration option would make sense.

Size is no reason. Including IPv6 support is a matter of a few kilobytes.

So my resolution is to add IPv6 support to the linux kernel we use to.

Thank you,
Andi
________________________________________
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Sent: Wednesday, September 23, 2015 23:02
To: Wetzel Andreas
Cc: buildroot at busybox.net; Gustavo Zacarias
Subject: Re: [Buildroot] [PATCH 1/1] libwebsockets: add option to enable/disable ipv6 support

Dear Andreas Wetzel,

On Wed, 23 Sep 2015 15:16:34 +0200, Andreas Wetzel wrote:
> Added configuration option BR2_PACKAGE_LIBWEBSOCKETS_IPV6 that
> adds -DLWS_IPV6=ON/OFF to LIBWEBSOCKETS_CONF_OPTS.
>
> Signed-off-by: Andreas Wetzel <andreas.wetzel@nanotronic.ch>

We stopped supporting IPv6 as an optional feature in the toolchain, and
made it mandatory. So, to go in the same direction, I would suggest to
simply always enable IPv6 in libwebsockets.

What is the size overhead of enabling IPv6 ? If it's reasonable, then
we want IPv6 to be unconditionally enabled.

Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
