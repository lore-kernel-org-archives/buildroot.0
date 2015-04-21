From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 21 Apr 2015 12:03:45 -0400
Subject: [Buildroot] [PATCH 2/2] pkg-generic: prepend downloaded patches
 w/ package
In-Reply-To: <20150421163924.0387bdb4@free-electrons.com>
References: <1429462679-4769-1-git-send-email-fhunleth@troodon-software.com>
 <1429462679-4769-2-git-send-email-fhunleth@troodon-software.com>
 <55357904.1080608@mind.be>
 <CA+-urNTh3ONseXzFEqx3ALLqLJBmpH-RvV1vQu9bHhx-uEQQFQ@mail.gmail.com>
 <20150421153045.6927584f@free-electrons.com>
 <CA+-urNTcHpvcg1Y7rFCVWAUsE2RjEO0QhBvFca2gAcyLWm8URw@mail.gmail.com>
 <20150421163924.0387bdb4@free-electrons.com>
Message-ID: <CA+-urNSyn4yeWby45jjzKL=Ms267q+DtFvy5AJ-=bZjCYt0w9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 21, 2015 at 10:39 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Frank Hunleth,
>
> On Tue, 21 Apr 2015 10:20:46 -0400, Frank Hunleth wrote:
>
>> > There are obviously some implications (organization of files in
>> > BR2_PRIMARY_SITE and on sources.buildroot.net), but isn't this the
>> > easiest solution, after all? Or am I missing something?
>>
>> Yes. This would be another route barring the new issue that I just ran
>> into with _PATCH.
>>
>> The issue occurs when Intel updates their kernel or u-boot patches
>> without updating which kernel or u-boot that they use. The remote file
>> name of the patches is still the same (upstream_to_edison.patch). The
>> kernel or u-boot package versions are also still the same. So unless I
>> append some additional versioning information to the filename stored
>> in $(DL_DIR), the new patch won't be downloaded.
>
> Indeed my proposal would not solve this problem.
>
> Alternate options:
>
>  1/ Fix upstream. Talk to the Intel people doing this sort of awful
>     mess to fix their workflow and rename patches with appropriate
>     versions.

:)

I'll try this and report back what happens.

>
>  2/ Have a way of passing the expected hash for custom patches to
>     download, so that the Buildroot download infra can notice that the
>     hashes are not correct anymore, and will redownload.
>
>     Maybe:
>
>       BR2_TARGET_UBOOT_PATCH="http://intel.com/stupid.patch{md5:2394fc9ba9094f8e6d0a59490a1fa65e}"
>
>     ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
