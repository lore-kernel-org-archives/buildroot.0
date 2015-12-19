From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Dec 2015 01:02:40 +0100
Subject: [Buildroot] [PATCH 06/13 v2] core/legal-info: install source
 archives in their own sub-dir
In-Reply-To: <20151218225310.GC10982@free.fr>
References: <cover.1450031251.git.yann.morin.1998@free.fr>
 <72f53f4f69afe29c7621731bae6eb536864501c5.1450031251.git.yann.morin.1998@free.fr>
 <5671FA46.2050903@mind.be> <20151218225310.GC10982@free.fr>
Message-ID: <56749EA0.0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-12-15 23:53, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-12-17 00:56 +0100, Arnout Vandecappelle spake thusly:
>> On 13-12-15 19:35, Yann E. MORIN wrote:
[snip]
>>> +$(2)_REDIST_SOURCES_DIR = $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))/$$($(2)_RAWNAME_VERSION)
>>
>>  Not directly related to this patch, but I find this
>> $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) bit extremely ugly.
>> $(LEGAL_INFO_DIR)/$(4)-sources is a lot nicer. Of course, that means we put
>> things in target-sources instead of plain sources, but I think that's an
>> improvement as well.
> 
> I'm not so sure it is better: we do not have the habit of prefixing
> target stuff with 'target-'. Only the host stuff we do prefix with
> 'host-'. Why would we derogate from that rule for legal-info?

 Hm, good point. Let's keep it like it is then.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
