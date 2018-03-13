From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Tue, 13 Mar 2018 15:00:58 +0100
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_00/15_v3=5D_fs=3A_support_pa?=
 =?iso-8859-1?q?rallel_filesystems_build?=
In-Reply-To: <cover.1520543724.git.yann.morin.1998@free.fr>
References: <cover.1520543724.git.yann.morin.1998@free.fr>
Message-ID: <7fff15a6-7724-4af2-a236-27d73b9514b2@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ?tvrtek 8. b?ezna 2018 22:15:35 CET, Yann E. MORIN wrote:
> TL;DR: filsystems are not parallel-safe, so we generate an intermediate
> tarball from target/, which then serves as input for the various
> filesystems; we also run pre-gen hooks under fakeroot, and get rid of
> post-fs package-provided hooks.

I like this -- it unbreaks a top-level parallel build for me. I no longer 
have to run `make -j32 target-finalize && make` :).

It also looks like something which will eventually enable genimage.sh to be 
run as a proper make-level target. That's important for me because I run 
genimage twice in a row; my second invocation takes the just-built image, 
puts that into a squashfs archive because of its compression, and uses the 
result to build another image for re-flashing the system via a USB stick.

Just build-tested for now, but I'll be happy to send a proper Tested-By 
once I verify that my board still boots with the result.

With kind regards,
Jan
