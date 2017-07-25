From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Date: Tue, 25 Jul 2017 21:55:18 +0200
Subject: [Buildroot] [.config file] Generating buildroot-like .config
 file from "linux-like" .config file
In-Reply-To: <CAB_D2UwsHdCsfcOm2BZXrzW6AB12n+tqWkVj3KubbSpSnXPZvA@mail.gmail.com>
References: <CAB_D2Uz6n6zdA2C3_Pbx6uV39_Zs=J=VfLOzs0Mtfi-agUocKQ@mail.gmail.com>
 <20170725141319.lrbqod4juauli3dd@latitude>
 <CAB_D2UzwSwa6SXs9fW1Eg-A+EziOEg58Daa=PXjtK2ZWs1q4Sw@mail.gmail.com>
 <CAB_D2UwsHdCsfcOm2BZXrzW6AB12n+tqWkVj3KubbSpSnXPZvA@mail.gmail.com>
Message-ID: <20170725195518.weotlgmo37zfwl2k@latitude>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 25, 2017 at 05:03:03PM +0200, vr roriz wrote:
> I found a possible path for this procedure. On menuconfig, under Kernel
> config, I can define a custom config file (for the Kernel). Then I can save
> this "mirroring" with a savedefconfig. I will test.
> 
> Source:
> https://stackoverflow.com/questions/1414968/how-do-i-configure-the-linux-kernel-within-buildroot
> 
> Is that the way people usually do that?

I think it usually works in the following way:

1) You create a Linux defconfig, and store it under
   arch/<architecture>/configs/<board>_defconfig, if it doesn't exist
   already.
2) You use a kernel branch or patch that contains this Linux defconfig.
3) You let BR2_LINUX_KERNEL_DEFCONFIG point to this defconfig.
4) Optionally, you create a *buildroot* defconfig that contains the
   relevant BR2_LINUX_KERNEL_DEFCONFIG line.

It's important to know which defconfig is a kernel defconfig and which
one is a buildroot defconfig.

For project specific modifications of the kernel config, there are also
some other mechanisms, like BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES and
those listed at http://nightly.buildroot.org/manual.html#outside-br-custom.


Jonathan Neusch?fer
