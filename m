From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jul 2012 16:38:40 -0300
Subject: [Buildroot] [PATCH] Clarify MIPS ABIs support
In-Reply-To: <20120726210102.6f65719c@skate>
References: <1343162828-13060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <50102DAA.1030400@mind.be> <20120725202503.7ecae923@skate>
 <20120725203109.5d295941@skate> <20120725211514.1ee35d6a@skate>
 <20120726210102.6f65719c@skate>
Message-ID: <50119CC0.5050303@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/26/12 16:01, Thomas Petazzoni wrote:

> Le Wed, 25 Jul 2012 21:15:14 +0200,
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :
> 
>> In other words, something like:
>>
>> From d8b0cd864463dedb8a934d1b2181d1ce074f525f Mon Sep 17 00:00:00 2001
>> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Date: Wed, 25 Jul 2012 21:12:59 +0200
>> Subject: [PATCH] Simplify x86 target architecture variant handling
>>
>> Instead of having two separate list of choices for select the target
>> architecture variant for i386 and x86_64, with many CPU choices
>> duplicated (because all modern x86 CPUs can be both used as i386 or
>> x86_64), merge them into a single list. In the x86_64 case, all the
>> x86 CPUs that do not support the 64 bits instruction set are hidden.
>>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> What do you think of this proposal (see below).
> 
> Thanks!
> 
> Thomas

Looks good in principle.
A small addition...

config BR2_x86_pentium_m
        bool "pentium mobile"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
        depends on !BR2_x86_64

Also i'd go for a more generic naming for the opterons, i.e. k8,
k8-sse3, amdfam10 (instead of barcelona) but they're just details that
can be addressed later with a few additions for newer gcc versions in
another patch.
Regards.
