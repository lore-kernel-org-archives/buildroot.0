From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 12:36:51 +0100
Subject: [Buildroot] [PATCHv4 1/4] dhcp: update dhclient-script
In-Reply-To: <1417107630-14909-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 27 Nov 2014 14:00:27 -0300")
References: <1417107630-14909-1-git-send-email-gustavo@zacarias.com.ar>
 <1417107630-14909-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vblzlfos.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The previous no-op dhclient-script is useless and in fact can lead
 > users to believe things will work.
 > dhclient-script is supposed to, among many other things, bring the
 > interface up for dhclient to pump an address, set the interface
 > address, set resolv.conf appropiately and set the default gateway.
 > It's a complex script since it has to deal with a lot of details so
 > let's just use the best fit which is the OpenWRT one since it uses the
 > "legacy" tools (ifconfig, route, ...) which can be easily provided by
 > busybox and/or net-tools.
 > There are newer and more feature-complete versions around but they
 > require full iproute2 ip and wouldn't fit as well with the busybox-only
 > approach.

 > License: likely GPLv2+
 > Source:
 > http://git.openwrt.org/?p=packages.git;a=blob;f=net/isc-dhcp/files/dhclient-script;h=4afebc0ad20ebac51c5baae5ed01c6713e3a0fd0;hb=HEAD

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
