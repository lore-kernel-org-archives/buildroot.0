From: Mike Zick <minimod@morethan.org>
Date: Thu, 5 Jun 2014 16:34:51 -0500
Subject: [Buildroot] BR-2014.05 Arm Config
Message-ID: <20140605163451.4af6d6d5@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While browsing:


I spotted this:

> # for some cores, VFPv4 is optional
> config BR2_ARM_CPU_MAYBE_HAS_VFPV4
>         bool
>         select BR2_ARM_CPU_MAYBE_HAS_VFPV3
> 
> config BR2_ARM_CPU_HAS_VFPV4
>         bool
>         select BR2_ARM_CPU_HAS_VFPV3
>

Are those ^^^ '_has_' selections typos?
Shouldn't they be: *_HAS_VFPV4 ?

Note: 
Yes, I know that VFPV4 hardware will run VFPV3 code.

Hmm (thinks himself to himself) . . . .
Changing this might lead to a lot of changes of
*_HAS_VFPV3 
into
*_HAS_VFPV3 || *_HAS_VFPV4
through-out the configuration system.

But at the moment, it looks like selecting any VFPV4
specific features is not possible (if there is such a thing).

Mike
