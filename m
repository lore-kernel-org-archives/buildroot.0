From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Oct 2013 23:18:20 +0200
Subject: [Buildroot] Buildroot patchwork: decision on the 10 oldest
 patches, week 1
In-Reply-To: <CAAXf6LVkmwRhw2TGyGtjts1ePNkCj=5pGgTk00GWJFaECq-k7Q@mail.gmail.com>
References: <20131006164227.0ab2a172@skate>
 <CAAXf6LVkmwRhw2TGyGtjts1ePNkCj=5pGgTk00GWJFaECq-k7Q@mail.gmail.com>
Message-ID: <525B0E1C.1070908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/13 10:11, Thomas De Schampheleire wrote:
>> 10 grub: add host support
>> >    http://patchwork.ozlabs.org/patch/177705/
>> >    rbraun at sceen.net
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

  That indeed doesn't look good.

  For some reason, the ELF objects have two load addresses: 0x00002000 
and 0x080480d4. Therefore objdump generates a full 128MB dump filled with 
zeroes. It possibly has to do with recent binutils - this grub 0.97 is 
already more than 8 years old.

  I wouldn't spend too much effort on grub anymore, and instead focus on 
grub2.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
