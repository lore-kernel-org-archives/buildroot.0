From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 17:52:15 +0200
Subject: [Buildroot] [PATCH 4/7] boot/barebox: do not check hash for
 custom versions
In-Reply-To: <20150501153205.GC4206@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <895f0c166335e5dfb49a30dd8cf0b2986a5f7431.1430260630.git.yann.morin.1998@free.fr>
 <55437C59.2080502@mind.be> <20150501153205.GC4206@free.fr>
Message-ID: <5543A12F.9010800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/15 17:32, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2015-05-01 15:15 +0200, Arnout Vandecappelle spake thusly:
>> On 29/04/15 00:40, Yann E. MORIN wrote:
> [--SNIP--]
>>> @@ -18,6 +19,9 @@ else
>>>  # Handle stable official Barebox versions
>>>  BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
>>>  BAREBOX_SITE = http://www.barebox.org/download
>>> +ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_VERSION),y)
>>> +BR_NO_CHECK_HASH_FOR += $(BAREBOX_SOURCE)
>>> +endif
>>>  endif
>>
>>  Same comment as for U-Boot.
> 
> Same answer. ;-)

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
