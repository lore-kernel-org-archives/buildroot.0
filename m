From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 08:43:46 +0200
Subject: [Buildroot] [PATCH] meson: Use AR via wrapper
In-Reply-To: <20181009203406.GM2869@scaer>
References: <20181009192422.20809-1-abrodkin@synopsys.com>
 <20181009203406.GM2869@scaer>
Message-ID: <20181010084346.1a394876@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Oct 2018 22:34:06 +0200, Yann E. MORIN wrote:
> > -ar = '@TARGET_CROSS at ar'
> > +ar = '@TARGET_CROSS at gcc-ar'  
> 
> I was curioous as to see for how long gcc provided that wrapper. It
> turns out that at least 4.9 did.

Actually, we support external toolchains older than gcc 4.9. So no, it
is not good to use gcc-ar unconditionally.

So, it's like I replied on the LTO-enabling patch for systemd, we need
a global Config.in option that tells us if the toolchain supports LTO
or not, and another if the user wants to use LTO.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
