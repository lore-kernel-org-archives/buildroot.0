From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 14 Nov 2016 22:53:03 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-11-13
In-Reply-To: <20161114073015.24C9A20BE0@mail.free-electrons.com>
References: <20161114073015.24C9A20BE0@mail.free-electrons.com>
Message-ID: <1479160383.4567.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2016-11-14 at 08:30 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2016-11-13
> ================================
> 
> ??????successes : 220
> ???????failures : 52?
> ???????timeouts : 0??
> ??????????TOTAL : 272
> 

[snip]

> ?????????arm |???????????????????tremor-19427 | NOK |
> http://autobuild.buildroot.net/results/054f1c77b0e5d46b2dc53769469c0e
> d03e6b79ef

The ARM Cortex-M4 toolchain supports *only* Thumb-2 instructions,
whereas tremor has ARM assembly code and therefore cannot be build with
this toolchain.

I would just exclude the relevant CPU ARMv7-M (BR2_ARM_CPU_ARMV7M) for
simplicity, right?

Best regards,
J?rg Krause
