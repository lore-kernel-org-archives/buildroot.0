From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Mar 2012 19:15:07 +0100
Subject: [Buildroot] Using custom kernel headers instead toolchain
 headers
In-Reply-To: <1332321967.3685.13.camel@localhost>
References: <1332183352.6228.94.camel@desktop>
 <201203192319.22728.arnout@mind.be>
 <1332321967.3685.13.camel@localhost>
Message-ID: <20120321191507.487c8270@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 21 Mar 2012 13:26:07 +0400,
lexa <lexa@cfotr.com> a ?crit :

> I use heavy patched kernel and i need use custom kernel headers. If i
> choose using
> buildroot toolchain, can buildroot create kernel-headers from my custom
> kernel source and use this headers for build buildroot toolchain and
> other binaries?

Yes, you can put your modified kernel sources named linux-2.6.tar.bz2
in the dl/ folder, and select the BR2_KERNEL_HEADERS_SNAP. The internal
Buildroot toolchain build procedure will then use this kernel version
for the kernel headers of the toolchain.

Note that this isn't used a lot, so it might be possible that things
are broken, I haven't tested it right now.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
