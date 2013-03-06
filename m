From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Mar 2013 21:54:14 +0100
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <1362602480.20183.169.camel@genx>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar> <1362500477.20183.74.camel@genx>
 <20130305194707.474ded42@skate> <1362592916.20183.152.camel@genx>
 <20130306195844.2f8c14b6@skate> <1362599417.20183.159.camel@genx>
 <069B5A25F9844945B625ADE7258AC94C061FF823@4rf-nz-orion.local.4rf.com>
 <20130306210831.4fbe8150@skate> <1362602480.20183.169.camel@genx>
Message-ID: <20130306215414.23271383@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Stile,

On Wed, 06 Mar 2013 12:41:20 -0800, John Stile wrote:

> Yes, the place holder is bad, so I took it out.
> I ran: make dhcpcd-dirclean
> 
> My buildroot-2011.11/.config  holds
> BR2_PACKAGE_DHCPCD=y
> BR2_INET_IPV6=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> 
> I cleaned up using:
> rm -rf \
> ./dl/dhcpcd-3.2.3.tar.bz2 \
> ./output/build/dhcpcd-3.2.3 \
> ./output/build/buildroot-config/br2/package/dhcpcd.h \
> ./output/target/etc/init.d/dhcpcd.sh \
> ./output/target/usr/bin/dhcpcd
> 
> But make still does not do anything for dhcpcd.

If you have dl/dhcpcd-3.2.3.tar.bz2 in your dl/ directory, then it
means that the package build process was started.

Can you do:

make dhcpcd-dirclean
make 2>&1 | tee logfile

Put the contents of logfile on http://code.bulix.org, and post the URL?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
