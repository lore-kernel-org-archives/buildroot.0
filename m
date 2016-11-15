From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 15 Nov 2016 23:09:09 +0100
Subject: [Buildroot] [PATCH] package/tremor: fix build with Thumb only
 ARM archs
In-Reply-To: <83e53e9a-4cc5-f02e-53c6-499c68ffa259@mind.be>
References: <20161115204658.14288-1-joerg.krause@embedded.rocks>
 <83e53e9a-4cc5-f02e-53c6-499c68ffa259@mind.be>
Message-ID: <1479247749.25678.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2016-11-15 at 22:18 +0100, Arnout Vandecappelle wrote:
> 
> On 15-11-16 21:46, J?rg Krause wrote:
> > Some ARM architectures like ARNv7-M only supports Thumb
> > instructions,
> > but the tremor build configuration enables ARM assembly code
> > unconditionally for all arm triplets by defining _ARM_ASSEM_.
> > 
> > We are overriding this by undefining this macro for ARM
> > architectures
> > not supporting ARM instructions.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/054/054f1c77b0e5d46b2dc53769
> > 469c0ed03e6b79ef/
> > http://autobuild.buildroot.net/results/ba1/ba1760b1428584f70e44dbff
> > b8218ff3ee55e702/
> > http://autobuild.buildroot.net/results/2a6/2a687853cf0bc832fef29f88
> > de0d85bd495fe87d/
> > http://autobuild.buildroot.net/results/cb6/cb6c560bf31834aadbe3d13a
> > 118b31ea8190159b/
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Many thanks for the review!

> ?However, just to be sure, could you do a test with a toolchain for a
> cpu that
> does have ARM instructions, but is configured with
> BR2_ARM_INSTRUCTIONS_THUMB?

Tested successfully with BR2_cortex_a9 and BR2_ARM_CPU_HAS_THUMB2.

Best regards,
J?rg Krause
