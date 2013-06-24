From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Jun 2013 18:54:32 +0200
Subject: [Buildroot] Beaglebone Black support
In-Reply-To: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
References: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
Message-ID: <51C879C8.1090908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/13 21:21, Frank Hunleth wrote:
> I'd like to get things in a form that I could contribute upstream and
> I'm not sure how to deal with the kernel. Both "kernels" referenced by
> people on the beageboard mailing lists, the beaglebone.org kernel and
> the Robert J. Nelson kernel, are really a list of patches (100s of
> them) and a shell script to download the 3.8.13 kernel and apply them.
> See here for an example:
>
> https://github.com/beagleboard/kernel/tree/3.8
>
> Angstrom deals with this by having a copy of the patches in
> meta-beagleboard and referencing them in the .bb file. See:
>
> https://github.com/beagleboard/meta-beagleboard/blob/master/common-bsp/recipes-kernel/linux/linux-mainline_3.8.bb
>
> However, copying the patches over to buildroot seems wrong and painful
> to maintain, but as far as I can tell, there's no official/maintained
> git repo with the beaglebone.org kernel patches.

  I'm not sure if it is already possible in buildroot to use a git URL 
for the patches, but if so, you could point that one to the Angstrom 
tree. At least, on condition that they are either numbered or have a 
series file.

  The kernel/tree/3.8 URL won't work of course because the patches are 
not all in the same directory.

  You can also check if one of the beaglebone repos (e.g. koenkooi) just 
works for bbb.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
