From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 11 Aug 2012 13:54:53 +0300
Subject: [Buildroot] [PATCH] libpng: bump version and add apng support
 (required by firefox)
In-Reply-To: <20120811085055.1bc901c8@skate>
References: <50240DDE.4000901@petroprogram.com>
 <20120810090232.7ca6f885@skate> <5024D8B5.2020605@petroprogram.com>
 <20120810220052.6a596ce3@skate> <502597B9.9010705@petroprogram.com>
 <20120811085055.1bc901c8@skate>
Message-ID: <502639FD.5090109@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

11.8.2012 9:50, Thomas Petazzoni kirjoitti:
> Hello,
>
> Le Sat, 11 Aug 2012 02:22:33 +0300,
> Stefan Fr?berg <stefan.froberg@petroprogram.com> a ?crit :
>
>> Not to worry, the patches are actually very small and I was surprised
>> how little I had to change code.
> Great!
>
>> But the actual build process was very ... messy ... and i had spend most
>> of the last four months of (and lot's of hair tearing)
>> finding just the right combination of build switches to make the damn
>> thing compile and actually run.
> Yeah, I believe you that building Firefox is certainly not a piece of
> cake. Congrats to you for working on this!
>
>> Firefox extensions work now and It even plays YouTube videos with gnash
>> plugin. Yay! :-)
> Woh! I presume it only works under X.org, right?

Yes but there is also an configure option
"--enable-default-toolkit=cairo-gtk2-dfb" for directfb and
whitch I have not tested at all and I remember that I have seen
somewhere in the net a way to
build firefox to use just DirectFB + Gtk2 and no Xorg at all.

There is also "--enable-mobile-optimize" configure switch whitch I
suspect will only affect building for Android phone
(at least theres are lot's of   #ifdef ANDROID stuff in the code)

So that switch combined with directfb could make a really small firefox
binary, at least for phones.

>> So the biggest files are firefox.mk, which I have commented extensively
>> so that nobody has to go for this trouble again, and mozconfig file.
> How complicated do you feel the Firefox version bumps will be,
> considering the work you had to do for a specific version?
>
>> I also have added optional feature that when enabled will try to make
>> Firefox as privacy enhanced as possible
>> (using NoScript  and AdblockPlus extension plus my own about:config
>> settings)
>>
>> If the yasm package patch and that little cairo option addition patch
>> are both okay for you I will then send one final patch (few little
>> changes needed to sqlite.mk)
>> and then im ready to send the actual firefox.
> I will try to catch up a bit on my Buildroot backlog today, hoping that
> the 3G connection will be more cooperative than the other days.

Great!

Stefan

> Best regards,
>
> Thomas
