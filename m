From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Jul 2012 18:38:12 +0200
Subject: [Buildroot] [PATCH] Clarify MIPS ABIs support
In-Reply-To: <20120725211514.1ee35d6a@skate>
References: <1343162828-13060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <50102DAA.1030400@mind.be> <20120725202503.7ecae923@skate>
 <20120725203109.5d295941@skate> <20120725211514.1ee35d6a@skate>
Message-ID: <50117274.6030703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/25/12 21:15, Thomas Petazzoni wrote:
> Le Wed, 25 Jul 2012 20:31:09 +0200,
> Thomas Petazzoni<thomas.petazzoni@free-electrons.com>  a ?crit :
>
>> >  Thinking more about this, the way we do things for i386 vs. x86_64 is
>> >  not optimal: there are two complete distinct sets of entries for the
>> >  processor types. One for i386, one for x86_64. However, there should
>> >  normally be a big overlap between the two, since all x86_64 processors
>> >  support the i386 architecture. So maybe we should have a single list,
>> >  with certain processor not being visible in the i386. This would ensure
>> >  consistency between the list of processors available on i386 and x86_64.
> In other words, something like:
>
>  From d8b0cd864463dedb8a934d1b2181d1ce074f525f Mon Sep 17 00:00:00 2001
> From: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>
> Date: Wed, 25 Jul 2012 21:12:59 +0200
> Subject: [PATCH] Simplify x86 target architecture variant handling


  I haven't tested it, but looks good at first sight.

  That said, you still agree with a separate BR2_mips and BR2_mips64, right?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
