From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 08 May 2014 08:59:01 +0200
Subject: [Buildroot] [PATCH] toolchain package: set version as 'virtual'
 instead of 'undefined'
In-Reply-To: <CAAXf6LUsgmETOjUQhCZ1fPAhXOyneYFpuu8G=XKX0W9yx4nuKg@mail.gmail.com>
References: <0533846efc9952901283.1399373479@argentina>
 <20140506140745.1b072d2c@skate>
 <CAAXf6LXWCeGiH9bNsM=qaJ2bzH9RyOzu3FZpGxsmBsQyxHQMgw@mail.gmail.com>
 <20140506143845.0c802ae9@skate>
 <CAAXf6LUsgmETOjUQhCZ1fPAhXOyneYFpuu8G=XKX0W9yx4nuKg@mail.gmail.com>
Message-ID: <536B2B35.90906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/05/14 14:46, Thomas De Schampheleire wrote:
> On Tue, May 6, 2014 at 2:38 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Thomas De Schampheleire,
>>
>> On Tue, 6 May 2014 14:26:31 +0200, Thomas De Schampheleire wrote:
>>
>>>> Shouldn't we instead migrate these to use the virtual package
>>>> infrastructure, and make this infrastructure define this magic 'virtual'
>>>> version?
>>>
>>> For toolchain and toolchain-buildroot that would be possible, but for
>>> toolchain-external not, right?
>>
>> Right. But toolchain-external is not a virtual package, so setting its
>> version to 'virtual' would anyway be strange, no?
> 
> Not more strange than setting the version to 'undefined' :-D
> 
> Any other string than 'undefined' is fine for me too.
> 
> Btw, for makedevs and mkpasswd, the version is also 'undefined' as the
> source is included in buildroot.
> I was first going to change their version to 'buildroot', but it makes
> the messages a bit strange:
> 
>>>> host-makedevs buildroot Configuring...

MAKEDEVS_VERSION = buildroot-$(BR2_VERSION)

?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
