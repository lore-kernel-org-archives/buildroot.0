From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Apr 2015 23:19:25 +0200
Subject: [Buildroot] Intel Edison support
In-Reply-To: <CA+-urNRPe3bv+FH9He==b2_aa_NCnDXwxUJGGZqfUsNGyZt74w@mail.gmail.com>
References: <CA+-urNRPe3bv+FH9He==b2_aa_NCnDXwxUJGGZqfUsNGyZt74w@mail.gmail.com>
Message-ID: <5530275D.90305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/04/15 14:33, Frank Hunleth wrote:
> Hi all,
> 
> I have support for the Intel Edison working in Buildroot. It took a while to
> figure out everything that Intel's Yocto distribution was doing, but after you
> simplify it down, it doesn't seem so bad. I'd send the patch up for review, but
> it is dwarfed by two massive patch files on u-boot and the kernel that I had to
> copy from Intel's Yocto distro [1]. It seems better if BR could download the
> Yocto distro, extract the patch files, and use them when needed. It also doesn't
> seem right for BR to have to carry around a couple mega-patches. Is this
> possible and is there an example somewhere?
> 
> If you would like to see my current patches for Edison support, they are
> available here: https://github.com/fhunleth/buildroot-edison.

 There is a github upload of the official Edison yocto layer at [2]. You could
download the relevant patches from there with BR2_LINUX_KERNEL_PATCH. When you
do that, please make sure that the sha is included in the URL, so [3] and not [4].

 Regards,
 Arnout


> [1] http://www.intel.com/support/edison/sb/CS-035180.htm

[2] https://github.com/instantinfrastructure/edison-src
[3]
https://raw.githubusercontent.com/instantinfrastructure/edison-src/7002c964adb5a69cabdd11346769a7a1b66a8c01/device-software/meta-edison/recipes-kernel/linux/files/upstream_to_edison.patch
[4]
https://raw.githubusercontent.com/instantinfrastructure/edison-src/device-software/meta-edison/recipes-kernel/linux/files/upstream_to_edison.patch


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
