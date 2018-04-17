From: Laurent GONZALEZ <br22@gezedo.com>
Date: Tue, 17 Apr 2018 09:04:39 +0200
Subject: [Buildroot] [PATCH] package/binutils: Cortex-M targets require
 version <2.29
In-Reply-To: <20180417084904.0a80d93c@windsurf.numericable.fr>
References: <da109542-e77b-364e-cd54-12c7bbbcead7@gezedo.com>
 <20180417084904.0a80d93c@windsurf.numericable.fr>
Message-ID: <51708b71-bb77-623e-31c4-54c5cd678a69@gezedo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/04/2018 08:49, Thomas Petazzoni wrote:
> Hello Laurent, > > Thanks for this bug report and patch! > > On Mon, 16 Apr 2018 14:21:18 +0200, Laurent GONZALEZ wrote: >> binutils 2.29 changed the implementation of adr pseudo instruction >> it breaks linux kernel and impacts Cortex-M targets (eg. stm32) > > Do you have a reference for this issue ? I assume it is going to be > fixed at some point, because it is not possible to stay forever with > older binutils version, right ? Is there a binutils bug filled in for > this problem ? Unfortunately, I think binutils will not change. The new adr behavior
broke linux kernel, ffmpeg and ssl. Nowadays, only linux kernel has
not been fixed. We can either avoid bintutils <2.29 or patch the
kernel.

> > >> choice prompt "Binutils Version" - default >> BR2_BINUTILS_VERSION_2_29_X if !BR2_arc - default >> BR2_BINUTILS_VERSION_ARC if BR2_arc + default >> BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_CPU_ARMV7M + default >> BR2_BINUTILS_VERSION_2_29_X if !BR2_arc && !BR2_ARM_CPU_ARMV7M + >> default BR2_BINUTILS_VERSION_ARC if BR2_arc && !BR2_ARM_CPU_ARMV7M > > This solution only ensures that the default is not binutils 2.29, > but it does not prevent the user from choosing 2.29 for a Cortex-M > target. Instead, we would need to add some "depends on > !BR2_ARM_CPU_ARMV7M" on the binutils 2.29 option. Good catch, i'll submit a new patch asap.

--
Laurent



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180417/3c2b91dd/attachment.html>
