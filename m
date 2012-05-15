From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 May 2012 22:02:44 +0200
Subject: [Buildroot] [PATCH v3 01/22] legal-info: infrastructure to
 collect legally-relevant material
In-Reply-To: <4FB138C0.3070308@lucaceresoli.net>
References: <1336421443-5871-1-git-send-email-luca@lucaceresoli.net>
 <1336421563-5986-1-git-send-email-luca@lucaceresoli.net>
 <4FAEEDD0.6020602@mind.be> <4FB138C0.3070308@lucaceresoli.net>
Message-ID: <4FB2B664.3070407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/14/12 18:54, Luca Ceresoli wrote:
> Arnout Vandecappelle wrote:
>> On 05/07/12 22:12, Luca Ceresoli wrote:
[snip]
>>> +TARGETS_LEGAL_INFO:=$(patsubst %,%-legal-info,\
>>> + $(filter-out host-makedevs,\
>>> + $(TARGETS) $(BASE_TARGETS) $(TARGETS_HOST_DEPS) $(HOST_DEPS))))
>>
>> I guess host-makedevs is filtered out here because it has no tar file?
>> In that case, the same should be done for makedevs and mcookie. But maybe
>> it's better to define the SITE_METHOD of these packages as local. Then they
>> will be registered as "not saved" in the manifest.
>
> My ignorance, I didn't know about the existence of mcookie in Buildroot.
> I would like to omit entirely these packages from the legal-info list, as they are
> actually a part of Buildroot.
> But since using filter-out is pretty dirty, I think a clean implementation would be
> to exclude from legal-info processing all packages with an empyt _SOURCE variable.
> The assumption here is that if they don't have an external source, they are part of
> Buildroot.
>
> Do you think this is a good idea?

  Good plan!

[snip]
>> I'm not sure if it would work, but maybe this could be moved out
>> of the GENTARGETS and defined as a pattern rule, like all the other
>> stuff. That saves a lot of double $$.
>
> When I tried to do this change, it turned out that it would add more lines
> than the dollars it removes, so I reverted everything.
> I can't exclude it might be done in a better way that I was able to do,
> anyway.

  I can take a shot at it once this stuff gets committed.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
