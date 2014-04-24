From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 24 Apr 2014 14:47:42 -0500
Subject: [Buildroot] [PATCH 1/1] linux: Don't enable DEVTMPFS support
 for kernels older than 3.x.
In-Reply-To: <87bnvr2ped.fsf@dell.be.48ers.dk>
References: <1397849296-5517-1-git-send-email-rjbarnet@rockwellcollins.com>	<20140418213924.6d5a3ebf@skate>
 <53564749.5060409@lucaceresoli.net>
 <OF4212D2FC.25E3AE63-ON86257CC3.004F7CF7-86257CC3.007CFC5D@rockwellcollins.com>
 <87bnvr2ped.fsf@dell.be.48ers.dk>
Message-ID: <OF203E3A69.EF307CEE-ON86257CC4.006C7E39-86257CC4.006CBA0C@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Peter Korsgaard <jacmet@gmail.com> wrote on 04/24/2014 01:49:14 AM:

> >>>>> "rjbarnet" == rjbarnet  <rjbarnet@rockwellcollins.com> writes:
> 
> Hi,
> 
>  > We recently ran into a issue where brought a board forward to use 
Buildroot
>  > 2014.02 that we kept at a kernel version of 2.6.33. Yes, I agree that 
we should
>  > be using a new kernel but the work to port to a newer version is too 
great but
>  > we needed to upgrade some package versions. The system was unable to 
boot
>  > because DEVTMPFS_MOUNT was enabled in kernel config. We traced the 
issue back
>  > to Buildroot automatically enabling these options in our kernel 
config. There
>  > was no way to not include this kernel config option when
>  > BR2_ROOTFS_DEVICE_CREATION_STATIC is enabled.
> 
> Huh, but we ONLY enable it if BR2_ROOTFS_DEVICE_CREATION_STATIC isn't
> enabled - So why not just enabled it?

I meant to say, "when BR2_ROOTFS_DEVICE_CREATION_STATIC is NOT enabled". 
Sorry for the confusion and thanks for the clarification.

Thanks,
-Ryan
