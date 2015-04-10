From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Apr 2015 23:57:57 +0200
Subject: [Buildroot] [PATCH 2/2] infra/pkg-kconfig: require an non-empty
 KCONFIG_FILE
In-Reply-To: <20150410204030.GE4313@free.fr>
References: <cover.1428512591.git.yann.morin.1998@free.fr>
 <c5c81694cabca70c5651fe42a7de99247275659c.1428512591.git.yann.morin.1998@free.fr>
 <55258DE8.9020207@mind.be> <20150408204917.GC4197@free.fr>
 <55282C0F.90501@mind.be> <20150410204030.GE4313@free.fr>
Message-ID: <55284765.7030404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/04/15 22:40, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-04-10 22:01 +0200, Arnout Vandecappelle spake thusly:
>> On 08/04/15 22:49, Yann E. MORIN wrote:
>> [snip]
>>> So, because neither "use defconfig" nor "use custom config" is set,
>>> KERNEL_SOURCE_CONFIG is not set, so LINUX_KCONFIG_FILE ends up empty.
>>
>>
>> BR2_LINUX_KERNEL_USE_DEFCONFIG and BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG are the
>> only two possibilities in the "Kernel configuration" choice, so one of them will
>> always be set.
> 
> No, neither would be set if you don't enable building a kernel. In that
> case, LINUX_KCONFIG_FILE is empty, but the $(eval $(kconfig-package)) is
> still called, and thus the test should fail. But it does not.

 Argh, stupid me... The documentation I pointed to explicitly says a few lines
lower:

Note that ifdef only tests whether a variable has a value. It does not expand
the variable to see if that value is nonempty.


 Therefore, I've un-rejected this patch, and I'm adding my

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
>>> However, our ifndef did not trigger so far.
>>
>>  The kernel isn't built in the autobuilders, so where would it trigger?
> 
> Well, obviously, locally. ;-)
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
