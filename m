From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 19 Mar 2012 16:55:14 -0500
Subject: [Buildroot] Microblaze - UBoot Bootloader Support
Message-ID: <CAEBucnBJ88bpFaoVvp6fuU1aUZySOp+BFdY1=9Eq3h06tg+BPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Everyone,

I finished a paper today that was holding me up from working on the
Microblaze patches.  It seems like there has been a lot of work and
there is a pretty good solution now.

I'm looking into a boot loader and will be testing u-boot over the
next few days.  The Xilinx u-boot repo appears stagnant, so I'm going
to try to use the upstream u-boot support.  It looks like the
following will be necessary to support u-boot in Microblaze.

1. Copy a xparameters.h file.
Would be similar to the kernels dts copy routine.

2. Update the  CONFIG_SYS_BASE_ADDR variable.
Can be pulled from the kernel configuration, based on DTS or manual?
(I'll produce a manual patch for now but automating this in the future
seems appropriate)

We could go so far as to produce an ACE file and a PROM file for
booting standalone but I think we need to get base u-boot support in
first.

I'll be working on this today and hope to have a patch by the end of the night.

Thanks,

Spenser

-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
