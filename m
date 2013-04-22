From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 22 Apr 2013 20:25:02 +0200
Subject: [Buildroot] [PATCH 2/7] arc: Add option for ARC-specific
 download site
In-Reply-To: <20130422174812.621ec3c4@skate>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
 <1366630651-6857-3-git-send-email-mjonker@synopsys.com>
 <20130422174812.621ec3c4@skate>
Message-ID: <5175807E.2010503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/13 17:48, Thomas Petazzoni wrote:
> Dear Mischa Jonker,
>
> On Mon, 22 Apr 2013 13:37:26 +0200, Mischa Jonker wrote:
>
>> >+config BR2_ARC_SITE
>> >+	string "Download site for ARC specific packages"
>> >+	default"http://www.synopsys.com/apps/arc-developer/"
>> >+	depends on BR2_arc || BR2_arceb
>> >+	help
>> >+	  This download site is used for packages that require specific
>> >+	  support for ARC, while this support is not yet pushed to the
>> >+	  respective open source project.
> Is there some realistic case for which this URL would need to be
> changed by the user? I think I'd prefer to hardcode the URL in the
> binutils/gcc/uClibc recipes, just like we do a special casing for
> AVR32, unless of course there is some compelling reason for making this
> configurable.

  +1 on that.

  But it may make sense to define the base URL once in some .mk file and 
use it in the other locations. You probably don't need to worry about the 
order of .mk file inclusion because the variable will only be expanded 
when a rule is executed, not when the .mk files are parsed. So it should 
be safe to define it in e.g. the toolchain/gcc/gcc.mk and use it in binutils.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
