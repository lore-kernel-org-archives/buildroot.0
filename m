From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 20 Mar 2014 09:17:55 +0100
Subject: [Buildroot] [PATCH v4 2/2] libuci: new package
In-Reply-To: <20140319232343.71252ef2@skate>
References: <1395266096-7649-1-git-send-email-yegorslists@googlemail.com>
 <1395266096-7649-2-git-send-email-yegorslists@googlemail.com>
 <20140319232343.71252ef2@skate>
Message-ID: <CAGm1_ktEWi+dhAxxBYg=8i9BfBw6QiDNNbVO-4+z+N3GNsT=_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 19, 2014 at 11:23 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yegor Yefremov,
>
> On Wed, 19 Mar 2014 22:54:56 +0100, Yegor Yefremov wrote:
>
>> +config BR2_PACKAGE_LIBUCI
>> +     bool "libuci"
>> +     select BR2_PACKAGE_LIBUBOX
>> +     help
>> +       libuci is intended to centralize the whole configuration
>> +       of a device running OpenWrt. This package will also install
>
> What is a "device running OpenWrt" in the context of Buildroot ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

libuci provides just another config infrastructure. All config files
will be placed to /etc/config and you can read/write it's content via
libuci or UCI CLI. OpenWrt is using this approach and also develops
these packages. But it's usage is not limited to OpenWrt and can be
used by any distribution. See http://wiki.openwrt.org/doc/uci for more
details. I have found this tutorial for Ubunut:
http://www.wakoond.hu/2013/06/using-uci-on-ubuntu.html

I need these packages, because I have some programs I've developed for
OpenWrt, but would also like to use in BR. Another usage were to play
with swconfig (https://github.com/ringlej/swconfig). Of course you can
compile swconfig without uci support, but uci like config is much more
readable and handy: http://wiki.openwrt.org/doc/uci/network/switch.

And the real master plan were to port LuCI
(http://luci.subsignal.org/trac) or LuCI2 to BR, so that BR can get a
"standard" web-frontend.

I think OpenWrt is good tag for those familiar with this infrastructure.

Yegor
