From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Mar 2013 08:11:24 +0100
Subject: [Buildroot] [PATCH v3 1/2] package: Makefile.in: Add target
 compilation flags for NOMMU architecture.
In-Reply-To: <20130322152920.59b74891@skate>
References: <1363942902-6045-1-git-send-email-sonic.adi@gmail.com>
 <20130322152920.59b74891@skate>
Message-ID: <514FF89C.3060408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/03/13 15:29, Thomas Petazzoni wrote:
> Dear Sonic Zhang,
>
> On Fri, 22 Mar 2013 17:01:41 +0800, Sonic Zhang wrote:
[snip]
>> +ifneq ($(BR2_USE_MMU), y)
>> +TARGET_CFLAGS += -D__NOMMU__
>> +endif
>
> I'm still not entirely happy with that. This define is completely
> non-standard, I am not sure we want to have this at the global level.
> autotools-based packages should be fixed to check if fork() is
> available or not. For other packages, this special flag can be
> introduced on a per-package basis. But it's true that maybe a good
> number of packages will need that. Not sure here. What do others think?

  Since this is a non-standard flag, it would go together with some patch 
that adds the possibility of NOMMU builds. I would say that it's a good 
idea to have an explicit extra -DNOMMU in those .mk files.

  As to the large number of packages using it: it should anyway only be 
used for make-based packages (autotools and cmake should have different 
ways to detect NOMMU). So the number of packages using it wouldn't be 
that large.

  And finally, that do this that we have already (irda-utils and portmap) 
call it NO_FORK.

  Regards,
  Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
