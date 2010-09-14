From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Sep 2010 21:34:39 +0200
Subject: [Buildroot] [git commit master 1/1] gst-plugins-good: udp
	plugin needs ipv6 support
In-Reply-To: <AANLkTi=8jNQgz9pzBUJZWminQfXe7BM0_-AfikoKcexG@mail.gmail.com>
	(Frederik Pasch's message of "Tue, 14 Sep 2010 10:57:54 +0200")
References: <20100722143544.BEF0382B81@busybox.osuosl.org>
	<AANLkTi=8jNQgz9pzBUJZWminQfXe7BM0_-AfikoKcexG@mail.gmail.com>
Message-ID: <878w346rw0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frederik" == Frederik Pasch <fpasch@googlemail.com> writes:

Hi,

 >> diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
 >> index a326dc9..3b37b5e 100644
 >> --- a/package/multimedia/gst-plugins-good/Config.in
 >> +++ b/package/multimedia/gst-plugins-good/Config.in
 >> @@ -134,8 +134,12 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_SPECTRUM
 >> ? ? ? ?bool "spectrum"
 >> 
 >> ?config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_UDP
 >> + ? ? ? depends on BR2_INET_IPV6
 >> ? ? ? ?bool "udp"
 >> 
 >> +comment "udp requires a toolchain with IPv6 support"
 >> + ? ? ? depends on !BR2_INET_IPV6
 >> +
 >> ?config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOBOX
 >> ? ? ? ?bool "videobox"


 Frederik> Is there a reason why the udp-plugin shouldn't work with
 Frederik> ipv4-only toolchains?

Yes, it uses IPV6_* defines.

 Frederik> On my IPv4-only system the udpsrc-element of gst-plugins-good
 Frederik> works as expected...

Also with version 0.10.6? Here I have

  CC    gstudp-enumtypes.o
gstudpnetutils.c: In function 'gst_udp_set_loop_ttl':
gstudpnetutils.c:145: error: 'IPV6_MULTICAST_LOOP' undeclared (first use in this function)
gstudpnetutils.c:145: error: (Each undeclared identifier is reported only once
gstudpnetutils.c:145: error: for each function it appears in.)
gstudpnetutils.c:150: error: 'IPV6_MULTICAST_HOPS' undeclared (first use in this function)

-- 
Bye, Peter Korsgaard
