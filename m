From: Martin Bark <martin@barkynet.com>
Date: Sun, 20 Dec 2015 17:03:01 +0000
Subject: [Buildroot] [PATCH v2 3/5] package/nodejs: correct 0.10.x
	option name
In-Reply-To: <56748D0E.6030501@mind.be>
References: <1450394426-3349-1-git-send-email-martin@barkynet.com>
 <1450394426-3349-3-git-send-email-martin@barkynet.com>
 <20151218211213.GD27578@free.fr> <56748D0E.6030501@mind.be>
Message-ID: <CAFGQKxcvcrBMbjkJN70ZVm=oEmOeKLXF2wSac0t6hyBYJZxdZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Arnout,

On 18 December 2015 at 22:47, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 18-12-15 22:12, Yann E. MORIN wrote:
>> Martin, All,
>>
>> On 2015-12-17 23:20 +0000, Martin Bark spake thusly:
>>> The nodejs options incorrectly started BR2_BR2_xxx.  This change corrects
>>> the name for 0.10.x releases to BR2_PACKAGE_NODEJS_0_10_X
>>>
>>> Signed-off-by: Martin Bark <martin@barkynet.com>
>>>
>>> ---
>>> Changes v1 -> v2
>>>  - New in v2
>>> ---
>>>  Config.in.legacy         | 8 ++++++++
>>>  package/nodejs/Config.in | 6 +++---
>>>  2 files changed, 11 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Config.in.legacy b/Config.in.legacy
>>> index db1eeae..5d9a3ee 100644
>>> --- a/Config.in.legacy
>>> +++ b/Config.in.legacy
>>> @@ -186,6 +186,14 @@ config BR2_PACKAGE_INFOZIP
>>>        to avoid ambiguities with Info-Zip's UnZip which has been added
>>>        in the unzip package.
>>>
>>> +config BR2_BR2_PACKAGE_NODEJS_0_10_X
>>> +    bool "nodejs 0.10.x option renamed"
>>> +    select BR2_LEGACY
>>> +    select BR2_PACKAGE_NODEJS_0_10_X
>>
>> No, you can't select an option that is in a choice. All you can do in
>> this case is tell the user to check his configuration, and refer him
>> to the version choice.
>
>  Actually, you can do the same like we do for legacy string options:
>
> config BR2_PACKAGE_NODEJS_0_10_X
>         bool "v0.10.41"
>         default y if BR2_BR2_PACKAGE_NODEJS_0_10_X
>
>  In that case you should also add a comment to Config.in.legacy to remind us to
> remove it again when the legacy option is removed.
>
>  We should probably add this to the documentation at the top of Config.in.legacy.

Thanks for the info, i did not know this.  I'll be sending an update
patch set soon.

Thanks

Martin

>
>  Regards,
>  Arnout
>
>
>>
>> Regards,
>> Yann E. MORIN.
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
