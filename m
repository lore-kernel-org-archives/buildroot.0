From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 12 Oct 2011 11:32:59 +0200
Subject: [Buildroot] [PATCH v2] New package: ImLib2
In-Reply-To: <201110121125.08933.arnout@mind.be>
References: <1318328770-9496-1-git-send-email-yegorslists@googlemail.com>
 <201110111817.28102.arnout@mind.be>
 <CAGm1_kuSe7ubgejMu0YHfcoh8NDdgFENtLz2iKJWyjFKATdgVQ@mail.gmail.com>
 <201110121125.08933.arnout@mind.be>
Message-ID: <4E955ECB.7000209@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 12.10.2011 11:25, schrieb Arnout Vandecappelle:
> 
> On Wednesday 12 October 2011 11:18:34, Yegor Yefremov wrote:
>> On Tue, Oct 11, 2011 at 6:17 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>
>>> On Tuesday 11 October 2011 12:26:10, yegorslists at googlemail.com wrote:
>>>
>>> [snip]
>>>
>>>> +config BR2_PACKAGE_IMLIB2_X
>>>> + select BR2_PACKAGE_XLIB_LIBX11
>>>> + select BR2_PACKAGE_XLIB_LIBXEXT
>>>> + bool "X support"
>>>> +endif
>>>
>>> Shouldn't this depend on BR2_PACKAGE_XORG7 ?
>>
>> Thanks for reviewing. I checked these two packages_ libx11 and libxext
>> and they seem to selected by xorg anyway, so I replaced them by
>> dependency on  BR2_PACKAGE_XORG7.
> 
>  libXext indeed selects libX11, but I don't see how libXext would be automatically selected...

What about  BR2_PACKAGE_XSERVER_XORG_SERVER [=y] && BR2_PACKAGE_XORG7 [=y] && !BR2_avr32 [=n]?
