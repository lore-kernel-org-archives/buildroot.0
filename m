From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 03 Feb 2015 15:15:45 +0100
Subject: [Buildroot] [PATCH 1/3] fs/iso9660: allow building a hybrid ISO
 image
In-Reply-To: <54CFE871.5090902@mind.be>
References: <1421697177-12995-1-git-send-email-nrubinstein@aldebaran.com>
 <54CFE871.5090902@mind.be>
Message-ID: <54D0D811.40303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/02/15 22:13, Arnout Vandecappelle wrote:
> On 19/01/15 20:52, No? Rubinstein wrote:
>> This adds an option to build an ISO image using ISOLINUX as a
>> bootloader, as ISOLINUX provides "isohybrid", an utility that enables
>> using an ISO image as a bootable disk image.
>>
>> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
> 
>  Hi No?,
> 
>  While you're working on this, there is something else that you may be
> interested in doing.
> 
>  Currently, the iso image that is generated is not really the root filesystem,
> but it contains a cpio image with the real root filesystem. But in fact, there
> is no good reason to work that way, and it really complicates the build.
> Instead, it would be a lot more logical to create a real iso9660 root filesystem
> using the RockRidge extensions.
> 
>  That would also allow the iso9660 fs to finally use the ROOTFS_TARGET
> infrastructure, removing a lot of cruft.
> 
> 
>  If you're willing to work on this, you can add it as an additional patch to
> your series. It's very likely that it will need a couple of review cycles, so be
> prepared for that :-)


 By the way, take a look at these two very old patches by Jerome Sagnole:
http://patchwork.ozlabs.org/patch/328051/
http://patchwork.ozlabs.org/patch/328052/


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
