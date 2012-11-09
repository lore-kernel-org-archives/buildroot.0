From: Chris Zankel <chris@zankel.net>
Date: Thu, 08 Nov 2012 20:49:19 -0800
Subject: [Buildroot] [PATCH 0/2] add support for xtensa back to buildroot
In-Reply-To: <20121108082247.55eac2b2@skate>
References: <509b2928.67dc440a.70c6.6325@mx.google.com>
 <20121108082247.55eac2b2@skate>
Message-ID: <509C8B4F.6000308@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I understand your concern, and I guess it won't help that I had patches
to clean up Buildroot for Xtensa laying around for over a year :-[ So,
my promise would be to actually submit patches when I have them.

Part of the problem was that it wasn't just Buildroot, but other parts
(uClibc, kernel, etc.) were also missing or having outdated changes, so
it would have required to push a lot of patches. I have been working to
get those patches in the corresponding trees first, and Buildroot
actually now builds and runs out of the box on Xtensa with just those
two patches and a generic patch for uClibc-snapshot. So, maintainability
and detecting breakage will be much easier, and I intend to verify it on
a more regular basis.

I'll send an updated version of the two patches where Crosstool-NG is
disabled for Xtensa.

Thanks,
-Chris




On 11/07/2012 11:22 PM, Thomas Petazzoni wrote:
> Dear Chris Zankel,
>
> On Wed, 07 Nov 2012 19:38:14 -0800, Chris Zankel wrote:
>
>> It would be great if you could add support for Xtensa back to buildroot.
>> I understand that it was removed because it required a lot of additional
>> files and special handling, which became obsolete and hard to maintain
>> over time.
>> These two patches are much more aligned with other architectures with only
>> very minimal overhead. I also just recently updated uClibc and can build
>> buildroot out of the box, so we can now better support and maintain it.
> I just skimmed through the patches, but it indeed looks a lot more
> reasonable than the support we originally had for Xtensa, thanks for
> this work!. One thing that should be added is to make sure that the
> Crosstool-NG backend cannot be selected for Xtensa, as it doesn't
> support this architecture.
>
> Also, the issue we had with the original Xtensa implementation is that
> the original submitters sent some patches that we merged, and
> subsequently never maintained them. Do you have plans to use this
> Xtensa architecture on a regular basis, and help us fixing build issues
> related to this architecture? Of course, we don't require you any sort
> of strict commitment or anything like that, I'd just like to know how
> much you'll be using this architecture.
>
> Thanks again for having worked on this,
>
> Thomas
