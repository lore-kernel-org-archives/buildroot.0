From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 11:26:42 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-06-20
In-Reply-To: <1498033808.3113.1.camel@embedded.rocks>
References: <20170621063055.8A34C20A28@mail.free-electrons.com>
 <1498033808.3113.1.camel@embedded.rocks>
Message-ID: <20170621112642.3e993fde@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Jun 2017 10:30:08 +0200, J?rg Krause wrote:

> >         sh4a |                libupnpp-0.15.2 | http://autobuild.buil
> > droot.net/results/df23cd5e77f61caf3f30cf43c91bc161a88def3a  
> 
> Odd, as libupnpp has BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 defined, but the
> sh4a toolchain is GCC 4.7.

Not odd at all: libupnpp indeed depends on gcc >= 4.9. But libupnpp is
selected by upmpdcli, which only depends on gcc >= 4.7. So the libupnpp
dependencies have not been properly propagated to upmpdcli.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
