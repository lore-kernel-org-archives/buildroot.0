From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 11 Aug 2012 02:22:33 +0300
Subject: [Buildroot] [PATCH] libpng: bump version and add apng support
 (required by firefox)
In-Reply-To: <20120810220052.6a596ce3@skate>
References: <50240DDE.4000901@petroprogram.com>
 <20120810090232.7ca6f885@skate> <5024D8B5.2020605@petroprogram.com>
 <20120810220052.6a596ce3@skate>
Message-ID: <502597B9.9010705@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>> By the way Thomas, how should I split my patches if they become too large ?
>> I have currently eight files for my firefox build and the total number
>> of lines is...well...large.
>>
>> So, should I chunk it to separately patches with git ([PATCH 1/8],
>> [PATCH 2/8] etc ....) ,
>> with each patch containing just one file or how ?
> You can send all the files related to a particular package as a single
> patch, even if it is large. However, we might be a bit reluctant to add
> a package that requires such a number of big patches. We'll wait your
> posting to see what those patches do, and whether they are acceptable
> inside Buildroot.

Not to worry, the patches are actually very small and I was surprised
how little I had to change code.

But the actual build process was very ... messy ... and i had spend most
of the last four months of (and lot's of hair tearing)
finding just the right combination of build switches to make the damn
thing compile and actually run.

Firefox extensions work now and It even plays YouTube videos with gnash
plugin. Yay! :-)

So the biggest files are firefox.mk, which I have commented extensively
so that nobody has to go for this trouble again, and mozconfig file.
I also have added optional feature that when enabled will try to make
Firefox as privacy enhanced as possible
(using NoScript  and AdblockPlus extension plus my own about:config
settings)

If the yasm package patch and that little cairo option addition patch
are both okay for you I will then send one final patch (few little
changes needed to sqlite.mk)
and then im ready to send the actual firefox.

Stefan

> Best regards,
>
> Thomas
