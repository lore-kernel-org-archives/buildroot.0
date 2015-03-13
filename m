From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 13 Mar 2015 09:19:49 +0100
Subject: [Buildroot] [PATCH] ARC: bump tools to 2014.12 release
In-Reply-To: <1426231128.2836.13.camel@synopsys.com>
References: <1422879584-18485-1-git-send-email-abrodkin@synopsys.com>
 <20150304120358.591484a9@free-electrons.com>
 <1426231128.2836.13.camel@synopsys.com>
Message-ID: <03223383-0BA2-4CEE-8B8C-DF1F0F224C38@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

Le 13 mars 2015 08:18:48 UTC+01:00, Alexey Brodkin <Alexey.Brodkin@synopsys.com> a ?crit :
>Hi Thomas,
>
>On Wed, 2015-03-04 at 12:03 +0100, Thomas Petazzoni wrote:
>> Dear Alexey Brodkin,
>> 
>> On Mon,  2 Feb 2015 15:19:44 +0300, Alexey Brodkin wrote:
>> > Now when new shiny tools are released by Synopsys we're ready for
>> > version update in Buildroot again.
>> > 
>> > More details about arc-2014.12 release are available here:
>> >
>https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2014.12
>> > 
>> > Following patches were removed from GCC since they are a part of
>release
>> > now:
>> >  * 200-size_type_unsigned_int.patch
>> >  * 300-ptrdiff_type_int.patch
>> >  * 400-call-arc_hazard-before-branch-shortening.patch
>> >  * 401-fix-length-attribute-for-casesi_load-pattern.patch
>> >  *
>402-fix-length-of-instructions-that-are-in-delay-slot-and-needs-to-be-predicated.patch
>> >  * 403-update-casesi_compact_jump-instruction-length.patch
>> > 
>> > But since arc-2014.12 tools are still based on GCC 4.8 following
>patches
>> > ar still relevant so moving to the new folder to match ARC gcc
>bump.
>> >  * 100-libstdcxx-uclibc-c99.patch
>> >  * 910-gcc-poison-system-directories.patch
>> > 
>> > Binutils are still based on 2.23 so following patch still makes
>sense:
>> >  * 600-poison-system-directories.patch
>> > 
>> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>> > 
>> > Cc: Anton Kolesov <akolesov@synopsys.com>
>> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> > Cc: Peter Korsgaard <peter@korsgaard.com>
>> 
>> It seems like the update of GDB for ARC is causing some build
>problems:
>> 
>>  
>http://autobuild.buildroot.org/results/d62/d62f472d70f60281dfe94cffc46a3e0566fd4a3d/build-end.log
>> 
>> It's trying to build a shared libbfd.so using a statically compiled
>> libiberty.a which wasn't built with -fPIC. I don't know if the
>problem
>> is specific to ARC GDB or not.
>
>Sorry for late reply.
>
>I've just tried to re-build with defconfig from this autobuild and for
>me it got successfully to the end.
>
>I'm on master branch @ commit:
> --->8---
> commit 6a3a9784db170ec05b300f228cf8a4bc48d838ec
> Author: Michael Trimarchi <michael@amarulasolutions.com>
> Date:   Sun Mar 8 09:28:13 2015 +0100
>
>    python-spidev: new package
> --->8---
>
>I'll downgrade to the same commit as mentioned in autobuild:
> --->8---
> commit b9f39b2b389754bb53294311b938310283fda638
> Author: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Date:   Tue Mar 3 15:43:09 2015 -0300
>
>    whois: bump to version 5.2.5
> --->8---
>and will give it another try, but frankly I don't expect any
>differences
>because I didn't find any sensible commits in between these 2
>snapshots.
>

Can you have a look at this patch:
https://patchwork.ozlabs.org/patch/449686/

The issue seem to be related to avr32 removal.

Best regards,
Romain

>-Alexey
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Envoy? de mon t?l?phone Android avec K-9 Mail. Excusez la bri?vet?.
