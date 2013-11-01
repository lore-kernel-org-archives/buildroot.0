From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 1 Nov 2013 09:07:07 +0100
Subject: [Buildroot] Buildroot patchwork: decision on the 10 oldest
 patches, week 1
In-Reply-To: <CAAXf6LVkmwRhw2TGyGtjts1ePNkCj=5pGgTk00GWJFaECq-k7Q@mail.gmail.com>
References: <20131006164227.0ab2a172@skate>
 <CAAXf6LVkmwRhw2TGyGtjts1ePNkCj=5pGgTk00GWJFaECq-k7Q@mail.gmail.com>
Message-ID: <CAAXf6LVSr65gz+JSR6ar+KtzT=RawSWDTDpk=Gp+hEa0-Z4-hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Fri, Oct 11, 2013 at 10:11 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
[..]

Here is the outcome of this first patchwork cleanup session:

>
>>
>> So, for this first week, the patches are:
>>
>>  1 New: add lava-test package
>>    http://patchwork.ozlabs.org/patch/155498/
>>    ludovic.desroches at atmel.com
>
> Ludovic has rebased this patch and is currently testing this.

Ludovic updated and resubmitted this patch, thanks!

>
>>
>>  2 [v3] busybox: install S41inetd and inetd.conf if inetd is enabled in busybox.
>>    http://patchwork.ozlabs.org/patch/164551/
>>    keguang.zhang at gmail.com
>
> This patch was already at its third iteration, and has received
> comments from Peter and Arnout. At first sight, this could be
> respinned with little effort based on the input of Arnout. I'm
> reincluding Kelvin Cheung on this mail.
> Kelvin, are you interested in resending this based on the input you
> received on the last version?

No response, marked as Rejected.

>
>>
>>  3 [1/1] ccache: expose control interface via 'make ccache-options'
>>    http://patchwork.ozlabs.org/patch/165382/
>>    roylee17 at gmail.com
>
> This patch has been updated by Tzu-Jung Lee and is ready to be merged now.

Patch has been accepted in buildroot master. Thanks!

>
>>
>>  4 [V2] p910nd: Add p910nd lightweight printserver
>>    http://patchwork.ozlabs.org/patch/165542/
>>    david.c.purdy at gmail.com
>
> No feedback yet.
> In patchwork this is indicated as 'delegated to gustavoz'. Gustavo:
> does this mean you are working on this, or plan on working this?

Gustavo said he would take this up. Marked as 'Changes requested' in patchwork.

>
>>
>>  5 Added package v86d which provides a real-mode helper for uvesafb driver.
>>    http://patchwork.ozlabs.org/patch/171840/
>>    golubovsky at gmail.com
>
> No feedback yet.
>
>>
>>  6 grub: fix stage2 link with recent binutils
>>    http://patchwork.ozlabs.org/patch/173191/
>>    net147 at gmail.com
>
> This is supposed to fix a runtime bug (when installing grub). It is
> including a patch also used on openwrt. This patch applies to grub
> 0.97 with one 'offset 2 lines' difference, but I'd say this is ok.
> The patch against buildroot also applies cleanly. Everything builds correctly.
>
> Although I don't have a setup to test this on, I would say we can
> apply this as-is.
>
>>
>>  7 valgrind: valgrind/valgrind.h missing if --disable-tls enabled
>>    http://patchwork.ozlabs.org/patch/176795/
>>    stefan.froberg at petroprogram.com
>
> Stefan: is this still a problem? Are you interested in updating this?
> In fact, there is no commit message and I can't link the title with
> the actual patch. Some more info would be nice...
>
>>
>>  8 [2/2] rdiff-backup: new package
>>    http://patchwork.ozlabs.org/patch/176956/
>>    avishorp at gmail.com
>
> No feedback yet.
>
>>
>>  9 [1/2,v4] package: pkg-generic: Support building override source without copying in common package infrastructure.
>>    http://patchwork.ozlabs.org/patch/177618/
>>    sonic.adi at gmail.com
>
> If I understand this correctly, it is changing the OVERRIDE_SRCDIR
> mechanism to build in the overriden tree, instead of in a copy. I
> though we would not support this intentionally, or am I wrong?
>
>>
>> 10 grub: add host support
>>    http://patchwork.ozlabs.org/patch/177705/
>>    rbraun at sceen.net
>
> Arnout: you gave a positive reply on this patch, is it still valid.
> Can we merge it as-is, or does the patch need more work? The patch
> still applies cleanly and builds fine, however I found the output is
> much larger than I expected (although this may be me not understanding
> exactly). Is it normal to have grub stages exceeding 100MB ?
>
> $ ls -lh /home/tdescham/repo/contrib/buildroot-review/output/host/boot/grub
> total 1,7G
> -rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:04 e2fs_stage1_5
> -rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:04 fat_stage1_5
> -rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 ffs_stage1_5
> -rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 iso9660_stage1_5
> -rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 jfs_stage1_5
> -rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 minix_stage1_5
> -rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 reiserfs_stage1_5
> -rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:04 stage1
> -rw-r--r-- 1 tdescham tdescham 257M okt 11 10:05 stage2
> -rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 ufs2_stage1_5
> -rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 vstafs_stage1_5
> -rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 xfs_stage1_5
>

All the other patches did not receive further feedback, and are thus
marked as Rejected.


Best regards,
Thomas
