From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 28 Dec 2013 13:29:47 +0100
Subject: [Buildroot] [PATCH 1 of 3 v2] Add feature removal schedule for
 deprecated features
In-Reply-To: <20131227200351.6c5b2216@skate>
References: <patchbomb.1387787746@argentina>
 <2d840ca671f83571813d.1387787747@argentina>
 <20131227200351.6c5b2216@skate>
Message-ID: <CAAXf6LUxx4fpgR1mrVfj7ExrODXX3sVLUCBEn3S3PumbqwpHbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Dec 27, 2013 at 8:03 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>>
>>  include::deprecated-list.txt[]
>> diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
>> new file mode 100644
>> --- /dev/null
>> +++ b/feature-removal-schedule.txt
>
> I'm not a big fan of having this file in the top-level directory of
> Buildroot. To me, this file is really meant for Buildroot developers to
> keep track of things to remove, and when. I'm not sure making this file
> highly visible to users by putting it in the top-level directory is
> very useful.
>
> Maybe in support/ ? docs/ would have been a good place, but it only
> contains our web site, so it would be weird to mix things.

I considered this file to be relevant not only for developers, but
also for users: it tells them when these deprecated features will/can
be removed. Previously, this could be several years, but now it should
be clear for everyone that we intend to remove deprecated features
after one year.

But it doesn't need to be at top-level for me, we can move it elsewhere.
support/ is fine for me.
An alternative is to make it part of the manual, thus in asciidoc
format. I'm not sure how to integrate this with the automatically
generated list of deprecated features; probably just replace the
automatic one with a manual one.

Yet another alternative is to annotate the Config.in files themselves
with an indication of the removal date, so that the automatic list can
include the date as well. This could be with a new set of symbols
BR2_DEPRECATED_GONE_IN_2012.11 for example, and a deprecated package
would then depend on this new symbol instead of BR2_DEPRECATED
directly. The new set of symbols would then each select/depend on
BR2_DEPRECATED.

>
>> @@ -0,0 +1,50 @@
>> +This file contains a list of deprecated features/packages in buildroot, and when
>> +they were deprecated. In general, deprecated features will remain available for
>> +at least four buildroot releases (one year). After this time, no guarantees are
>> +made.
>> +
>> +Note that several features/packages have been deprecated for a long time and
>> +should have been removed right now. Expect this to be corrected soon.
>> +
>> +
>
> One too many new line.

This was intentional, but I will remove it.

>
>> +To be removed in 2011.05:
>> +BR2_PACKAGE_SQUASHFS3
>> +BR2_TARGET_ROOTFS_SQUASHFS3
>
> Nitpicking, but even though this file is a plain text file, it would be
> nice to use some bullet lists:
>
> To be removed in 2011.05:
>  * BR2_PACKAGE_<bleh>

Ok, will change.

Thanks for your feedback,
Thomas
