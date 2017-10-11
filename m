From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Oct 2017 22:38:39 +0200
Subject: [Buildroot] [PATCH 0/3] Add support for Meson build
In-Reply-To: <CAAkeqgV=snat2dr7MpHOc9HE4MWf5eqHX3HJQVR6P+BZb5WN1w@mail.gmail.com>
References: <20170727094528.10745-1-joerg.krause@embedded.rocks>
 <866e116f-f9be-f138-4055-8ffe94ad2d19@imgtec.com>
 <1501150411.21202.1.camel@embedded.rocks>
 <bbae61aa-7e81-21b6-d7f8-2489b39e2893@imgtec.com>
 <20170727165026.4a5f59a1@windsurf.lan>
 <CAAkeqgWMAYm3B72AggbyamW3C6tEd27WdfyyW=EoBx4uFNhOyw@mail.gmail.com>
 <20171007135843.5a75c7f5@windsurf.home>
 <7d11c269-d453-6066-e6f1-2f68dd4b81d3@smile.fr>
 <CAAkeqgV=snat2dr7MpHOc9HE4MWf5eqHX3HJQVR6P+BZb5WN1w@mail.gmail.com>
Message-ID: <8186cfc2-f587-8d35-2560-2f2f314a186d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-10-17 05:51, Andrey Yurovsky wrote:
> Hi,
> 
> On Sat, Oct 7, 2017 at 6:06 AM, Romain Naour <romain.naour@smile.fr> wrote:
>> Thomas, Andrey, All,
>>
>> Le 07/10/2017 ? 13:58, Thomas Petazzoni a ?crit :
>>> Hello,
>>>
>>> On Fri, 6 Oct 2017 15:39:03 -0700, Andrey Yurovsky wrote:
>>>
>>>> On Thu, Jul 27, 2017 at 7:50 AM, Thomas Petazzoni
>>>> <thomas.petazzoni@free-electrons.com> wrote:
>>>>> No, let's wait to have a few Meson-based packages in Buildroot, and
>>>>> then we'll have a package infrastructure. This will allow us to see
>>>>> what are the commonalities, what are the differences, etc.
>>>>
>>>> systemd 235 is released (https://lwn.net/Articles/735691/) and it
>>>> drops autoconf/automake and only has meson as the build system (in 234
>>>> they warned this would happen next) so perhaps that's a good starting
>>>> point for buildroot to integrate meson support? I'm happy to help out
>>>> if no one else was already working on it.
>>>
>>> This would indeed be a very compelling reason to support meson.
>>
>> Also the next enlightenment release (0.22) will only support meson.
>>
> 
> I was able to add a package/pkg-meson.mk wrapper (that seems to be
> missing from the Meson patch set, or did I completely miss it?) and

 Yes, our original idea was that there should be a few packages using meson
before we add an infra for it. But since there are quite a few packages that
will use the meson infra, and since it seems pretty straightforward, it can
indeed be done right away (at least according to me, Thomas may have a different
opinion).

> built the previously submitted libmpdclient version bump via the
> $(eval $(meson-package)) wrapper. I'll work on version bumping systemd
> and converting it to use that wrapper as well. If possible I'd like to
> get this more or less right, what would a reasonable patch set look
> like? I was thinking, as a patch set:
> 1. resubmit the Meson patches (package/meson, documentation) by J?rg Krause

 If you're anyway adding pkg-meson.mk, then the documentation doesn't make much
sense (in that form). Better do it after pkg-meson.mk.

> 2. add package/pkg-meson.mk
> 3. resubmit the libmpdclient version bump patch by J?rg Krause but
> with $(eval $(meson-package)) changes
> 4. submit the systemd version bump and meson conversion patch(es)
> 
> That way we have the infrastructure, documentation, and two packages
> utilizing the infrastructure in one set to review. Does that sound
> alright?

 Yes it does!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
