From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Fri, 10 Aug 2012 12:47:33 +0300
Subject: [Buildroot] [PATCH] libpng: bump version and add apng support
 (required by firefox)
In-Reply-To: <20120810090232.7ca6f885@skate>
References: <50240DDE.4000901@petroprogram.com> <20120810090232.7ca6f885@skate>
Message-ID: <5024D8B5.2020605@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good morning Thomas

10.8.2012 10:02, Thomas Petazzoni kirjoitti:
> Hello Stefan,
>
> Le Thu, 09 Aug 2012 22:22:06 +0300,
> Stefan Fr?berg <stefan.froberg@petroprogram.com> a ?crit :
>
>> Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
>> ---
> Thanks for this patch. A few comments:
>
>  (1) Your patch has been line-wrapped by your e-mail client. Try to use
>      git send-email instead, which will guarantee that your patch
>      remains intact and can be applied properly.
Ok, I try to get used to using git for sending these patches.
Im still git newbie :-)

>  (2) As far as I know, the bump from libpng 1.4 to libpng 1.5 changes
>      the API, and is therefore causing build failures in other
>      packages. Have you tested things like DirectFB and other packages
>      that rely on libpng?
Well, firefox is working nicely.

And the only DirectFB depending package I have here is the graphical
version of links browser from buildroot.
Links start's okay too but freezes after exiting. But it had done it
before too, so I know it's not the issue of libpng
in this specific case.

But will I check what applications I have currently linked against that
1.5 version and test them all.

>  (3) Is this apng feature something that is being integrated in the
>      upstream version of libpng? In Buildroot, we don't like carrying
>      patches that add features to packages. Imagine we later want to
>      bump libpng to version 1.5.10 or 1.5.11, we'd have to refresh the
>      patch, which becomes complicated if we accumulate many large
>      patches.

That's a good guestion.

I had to check from http://en.wikipedia.org/wiki/APNG
and it says the following:

"The PNG group officially rejected APNG as an official extension on
April 20, 2007.[3]
There have been several subsequent proposals for a simple animated
graphics format based on PNG using several different approaches.[4]

Mozilla Firefox added support for APNG in version 3 trunk builds on
March 23, 2007.[5]
However, because libpng is the PNG Group's reference implementation of
the official specification,
APNG support can never be supported in the main libpng distribution so
long as it remains
unratified by the Group. Iceweasel 3 now supports APNG by using
Mozilla's unofficial variant of libpng."

So it seems that even tought APNG support is needed for libpng by
Firefox the PNG group will never add it :(

However, there is a solution:
Firefox tarball contains it's own private copy of libpng with apng
support included.

Ofcourse that's some extra disk space wasted for having two versions of
libpng (private and system-wide)
included in the final rootfs  and that's why I originally wanted to use
as much buildroot made system libs as possible.
But it's a simple matter to drop the "--with-system-png" from firefox
mozconfig and trash that apng patch.

By the way Thomas, how should I split my patches if they become too large ?
I have currently eight files for my firefox build and the total number
of lines is...well...large.

So, should I chunk it to separately patches with git ([PATCH 1/8],
[PATCH 2/8] etc ....) ,
with each patch containing just one file or how ?

Stefan

> Best regards,
>
> Thomas
