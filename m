From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Feb 2014 18:38:14 +0100
Subject: [Buildroot] compiling kernel
In-Reply-To: <20140226014847.23839269@core2quad.morethan.org>
References: <1393369707.747.YahooMailNeo@web120205.mail.ne1.yahoo.com>
 <20140226014847.23839269@core2quad.morethan.org>
Message-ID: <530E2686.8040409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/02/14 08:48, Mike Zick wrote:
> On Tue, 25 Feb 2014 15:08:27 -0800 (PST)
> Basavaraj Hiremath <hraj50@yahoo.com> wrote:
> 
>> Hi,
>> Recently started using build root system, I have following questions,
>> could you clarify?
>>
>> 1. how can I compile kernel and root file system separately, so that
>> application user can use the kernel binary to create the root file
>> system(no need to have kernel code)?

 Compiling the kernel outside of buildroot is possible. You just
cross-compile it in the usual way, but pass
CROSS_COMPILE=<buildroot>/output/host/usr/bin/foo-bar-baz-
and
TARGET_DIR=<buildroot>/output/target

(the latter is for installing modules).

 If you use a pre-installed external toolchain, it's also possible to use
it directly for CROSS_COMPILE.

 Or you can make a separate buildroot config for the kernel and for the
rootfs, of course.

>>
> 
> The kernel (and any code linked to it) is GPLv2 -
> The source code must be available to whoever has the the binary.

 There may be other reasons to want to compile them separately.

> 
> The kernel can be separately compiled from the root file system,
> but breaking the terms of the GPLv2 license is not one of the reasons.
> 
> If your system image uses proprietary code, the BR_EXTERNAL tree is
> provided for that purpose.
> 
>> 2. Even after using the pre-built target tool chain, build root
>> compiles some of the host tools for the first time and later uses
>> these host tools. Can I have pre-built host tools required for the
>> build root similar to target tool chain? In multi user system on the
>> Linux machine, only one user need to compile the target tool chain
>> and host tools and rest of the user just create root file system
>> using these target tool chain and host tools.
>>
> 
> Yes.

 Actually, no. Buildroot will always rebuild the host-packages that it
needs. Not rebuilding them would be part of the SDK concept that we've
been thinking about for two years, but nobody has ever actually worked on
that...


 Regards,
 Arnout

> 
> Your best starting place would be to review the buildroot manual.
> Available both on-line and packaged with buildroot.
> 
> Mike 
>>
>> Thanks in advance,
>> Raj
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
