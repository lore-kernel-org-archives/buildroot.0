From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Oct 2012 16:23:33 +0200
Subject: [Buildroot] Creating initrd
In-Reply-To: <1350049738.14474.52.camel@Homeserver>
References: <1349964303.8392.39.camel@Homeserver>
 <20121011164826.753f8312@skate>
 <1349968569.14474.10.camel@Homeserver>
 <20121011172356.6af76f39@skate>
 <1349976484.14474.20.camel@Homeserver>
 <20121011205348.4a861421@skate>
 <1349988968.14474.34.camel@Homeserver>
 <20121012091408.6184bb9f@skate>
 <1350049738.14474.52.camel@Homeserver>
Message-ID: <20121012162333.7fcc5273@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Wilkinson,

On Fri, 12 Oct 2012 09:48:58 -0400, Chris Wilkinson wrote:
> I had been using crosstool to build the kernel but now I see that BR
> can do that and using crosstool is unnecessary. I cleaned the kernel
> tree and the tar.bz2 is now 89MB. It is here
> 
> https://skydrive.live.com/redir?resid=834D8577B5544D4E!169&authkey=!
> AGZIOn-ye6O3anc

The .config file in this kernel tarball (which I assume is the kernel
configuration you're using) has gazillions of kernel modules enabled.
99.999999% of them are most likely useless in your setup. Those kernel
modules are the one that are causing your root filesystem to be 30+MB.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
