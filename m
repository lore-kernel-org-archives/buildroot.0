From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Oct 2013 10:11:05 +0200
Subject: [Buildroot] Buildroot patchwork: decision on the 10 oldest
 patches, week 1
In-Reply-To: <20131006164227.0ab2a172@skate>
References: <20131006164227.0ab2a172@skate>
Message-ID: <CAAXf6LVkmwRhw2TGyGtjts1ePNkCj=5pGgTk00GWJFaECq-k7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Oct 6, 2013 at 4:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> The oldest patches in patchwork don't get a lot of attention (or even
> any attention at all). I had a discussion this week with Thomas De
> Schampheleire, and we would like to progressively clean up the backlog
> of patches we have in patchwork, especially the oldest one.
>
> So, every week, I'll be posting the list of the 10 oldest patches, with
> the original patch contributors in Cc. During one week, we have the
> opportunity to discuss the patch, whether it is still necessary or not,
> how it should be changed to be merged.
>
> In particular, I'm interested in knowing if the original contributor is
> still interested by the patch, or if someone else is interested in
> adopting the patch and sending an updated version, or if the patch no
> longer makes sense due to other changes made in Buildroot.
>
> All patches that have not received any comment or attention within the
> week will be removed from patchwork. This is aggressive, but we have
> patches sitting in patchwork since one year and half, and this cannot
> work.

Five days have past already, let's do an intermediate review:

>
> So, for this first week, the patches are:
>
>  1 New: add lava-test package
>    http://patchwork.ozlabs.org/patch/155498/
>    ludovic.desroches at atmel.com

Ludovic has rebased this patch and is currently testing this.

>
>  2 [v3] busybox: install S41inetd and inetd.conf if inetd is enabled in busybox.
>    http://patchwork.ozlabs.org/patch/164551/
>    keguang.zhang at gmail.com

This patch was already at its third iteration, and has received
comments from Peter and Arnout. At first sight, this could be
respinned with little effort based on the input of Arnout. I'm
reincluding Kelvin Cheung on this mail.
Kelvin, are you interested in resending this based on the input you
received on the last version?

>
>  3 [1/1] ccache: expose control interface via 'make ccache-options'
>    http://patchwork.ozlabs.org/patch/165382/
>    roylee17 at gmail.com

This patch has been updated by Tzu-Jung Lee and is ready to be merged now.

>
>  4 [V2] p910nd: Add p910nd lightweight printserver
>    http://patchwork.ozlabs.org/patch/165542/
>    david.c.purdy at gmail.com

No feedback yet.
In patchwork this is indicated as 'delegated to gustavoz'. Gustavo:
does this mean you are working on this, or plan on working this?

>
>  5 Added package v86d which provides a real-mode helper for uvesafb driver.
>    http://patchwork.ozlabs.org/patch/171840/
>    golubovsky at gmail.com

No feedback yet.

>
>  6 grub: fix stage2 link with recent binutils
>    http://patchwork.ozlabs.org/patch/173191/
>    net147 at gmail.com

This is supposed to fix a runtime bug (when installing grub). It is
including a patch also used on openwrt. This patch applies to grub
0.97 with one 'offset 2 lines' difference, but I'd say this is ok.
The patch against buildroot also applies cleanly. Everything builds correctly.

Although I don't have a setup to test this on, I would say we can
apply this as-is.

>
>  7 valgrind: valgrind/valgrind.h missing if --disable-tls enabled
>    http://patchwork.ozlabs.org/patch/176795/
>    stefan.froberg at petroprogram.com

Stefan: is this still a problem? Are you interested in updating this?
In fact, there is no commit message and I can't link the title with
the actual patch. Some more info would be nice...

>
>  8 [2/2] rdiff-backup: new package
>    http://patchwork.ozlabs.org/patch/176956/
>    avishorp at gmail.com

No feedback yet.

>
>  9 [1/2,v4] package: pkg-generic: Support building override source without copying in common package infrastructure.
>    http://patchwork.ozlabs.org/patch/177618/
>    sonic.adi at gmail.com

If I understand this correctly, it is changing the OVERRIDE_SRCDIR
mechanism to build in the overriden tree, instead of in a copy. I
though we would not support this intentionally, or am I wrong?

>
> 10 grub: add host support
>    http://patchwork.ozlabs.org/patch/177705/
>    rbraun at sceen.net

Arnout: you gave a positive reply on this patch, is it still valid.
Can we merge it as-is, or does the patch need more work? The patch
still applies cleanly and builds fine, however I found the output is
much larger than I expected (although this may be me not understanding
exactly). Is it normal to have grub stages exceeding 100MB ?

$ ls -lh /home/tdescham/repo/contrib/buildroot-review/output/host/boot/grub
total 1,7G
-rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:04 e2fs_stage1_5
-rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:04 fat_stage1_5
-rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 ffs_stage1_5
-rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 iso9660_stage1_5
-rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 jfs_stage1_5
-rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 minix_stage1_5
-rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 reiserfs_stage1_5
-rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:04 stage1
-rw-r--r-- 1 tdescham tdescham 257M okt 11 10:05 stage2
-rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 ufs2_stage1_5
-rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 vstafs_stage1_5
-rwxr-xr-x 1 tdescham tdescham 129M okt 11 10:05 xfs_stage1_5



Thanks all for your input,

Thomas
