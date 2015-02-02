From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Feb 2015 22:13:21 +0100
Subject: [Buildroot] [PATCH 1/3] fs/iso9660: allow building a hybrid ISO
 image
In-Reply-To: <1421697177-12995-1-git-send-email-nrubinstein@aldebaran.com>
References: <1421697177-12995-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <54CFE871.5090902@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/01/15 20:52, No? Rubinstein wrote:
> This adds an option to build an ISO image using ISOLINUX as a
> bootloader, as ISOLINUX provides "isohybrid", an utility that enables
> using an ISO image as a bootable disk image.
> 
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>

 Hi No?,

 While you're working on this, there is something else that you may be
interested in doing.

 Currently, the iso image that is generated is not really the root filesystem,
but it contains a cpio image with the real root filesystem. But in fact, there
is no good reason to work that way, and it really complicates the build.
Instead, it would be a lot more logical to create a real iso9660 root filesystem
using the RockRidge extensions.

 That would also allow the iso9660 fs to finally use the ROOTFS_TARGET
infrastructure, removing a lot of cruft.


 If you're willing to work on this, you can add it as an additional patch to
your series. It's very likely that it will need a couple of review cycles, so be
prepared for that :-)


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
