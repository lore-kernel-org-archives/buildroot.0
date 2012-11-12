From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2012 22:18:30 +0100
Subject: [Buildroot] [PATCH for-2012.11 1/5] pkg-infra: introduce errors
 for legacy API
In-Reply-To: <20121112220539.7e41409b@skate>
References: <1352750912-16012-1-git-send-email-arnout@mind.be>
 <1352750912-16012-2-git-send-email-arnout@mind.be>
 <20121112220539.7e41409b@skate>
Message-ID: <50A167A6.5000705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/12/12 22:05, Thomas Petazzoni wrote:
>
> On Mon, 12 Nov 2012 21:08:28 +0100, Arnout Vandecappelle
>
>> +# Include legacy before the other things, because package .mk files
>> +# may rely on it.
>> +ifneq ($(BR2_DEPRECATED),y)
>> +include Makefile.legacy
>> +endif
>
> BR2_LEGACY here maybe?

  No that would not make sense - we want to get the error message if BR2_LEGACY
is selected (automatically, by Config.in.legacy).

The idea of the condition is to have an escape path, if you don't want to deal
with all the stuff that is misconfigured (not only legacy config symbols but also
host-pkg-config etc.), you can just build with BR2_DEPRECATED=y and see how far
you get.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
