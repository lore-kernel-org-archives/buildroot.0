From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 11 Aug 2012 14:29:24 +0300
Subject: [Buildroot] [PATCH] libpng: bump version and add apng support
 (required by firefox)
In-Reply-To: <20120811085055.1bc901c8@skate>
References: <50240DDE.4000901@petroprogram.com>
 <20120810090232.7ca6f885@skate> <5024D8B5.2020605@petroprogram.com>
 <20120810220052.6a596ce3@skate> <502597B9.9010705@petroprogram.com>
 <20120811085055.1bc901c8@skate>
Message-ID: <50264214.8020208@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

11.8.2012 9:50, Thomas Petazzoni kirjoitti:
> So the biggest files are firefox.mk, which I have commented extensively
> so that nobody has to go for this trouble again, and mozconfig file.
> How complicated do you feel the Firefox version bumps will be,
> considering the work you had to do for a specific version?

I think the bumps will be trivial.

The firefox.mk is more or less in stable state now and
simply changing FIREFOX_VERSION should be enough.

Ofcourse adding more optional configure options like DBus support,
libnotify etc.,
can be added later but right now it will build a very minimal binary and
im satisfied with that.

The mozconfig file which is Mozilla way of feeding all the configure
switches to build process
is pretty much stable and static now and will unlikely change for very
long time.

And the only changes I had to make to actual code was to replace finite()
with more standard isinf() and handle glibc specific malloc_usable_size and
execinfo.h stuff.

When I started the version number was 11.0 and now they have released
14.0 so those things might be
even fixed by now. :-)

If not, then I will try to contact upstream for including those minor
fixes and if failing that Im
more than willing to keep those lil patches updated.

Stefan

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
>
> Best regards,
>
> Thomas
