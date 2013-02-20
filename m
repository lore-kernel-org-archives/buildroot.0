From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Thu, 21 Feb 2013 00:14:23 +0100 (CET)
Subject: [Buildroot] libmad and AVR32 optimisations
In-Reply-To: <CAKcgs2zty=9pybVT7FwDMmSK0omc1x9tgwmDkgiMbixjFkv-oA@mail.gmail.com>
References: <CAKcgs2zty=9pybVT7FwDMmSK0omc1x9tgwmDkgiMbixjFkv-oA@mail.gmail.com>
Message-ID: <771436318.25518.1361402063381.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gilles,

On Wednesday, February 20, 2013 11:58:29 PM, Gilles Talis wrote:
> All,

> There is small issue in the AVR32 optimization patch [1]. This is root cause
> for autobuild failures: e01f5a5484299dce1797966445f3972583c67b22 and
> 7ed0563fbbfc19c93ec5be35d3b6a95e496b4c5d.

> Reason is that some fixed-point math routines are implemented in
> architecture-specific files. If "architecture-specific optimizations" option
> is disabled from the build configuration, these routines are not compiled,
> but libmad is built with references to these functions though.

> My question is: is this issue worth fixing? I assume that libmad users will
> usually enable all possible architecture-specific optimizations.

> Thanks
> Gilles.

> [1] package/libmad/libmad-0.15.1b-optimization.patch.avr32

This patch was clearly made for specific libmad settings. Rather than fixing it,
it would be easier to simply add a "depends on !BR2_avr32" to the config options
that fail on AVR32.

Best regards,
Beno?t
