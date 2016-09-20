From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 19:19:31 +0200
Subject: [Buildroot] [PATCH 3/3 v3] aufs-util: new package
In-Reply-To: <e5d42509736f56a587767b61bf0f9ceb8efd41e4.1468759218.git.yann.morin.1998@free.fr>
References: <cover.1468759218.git.yann.morin.1998@free.fr>
 <e5d42509736f56a587767b61bf0f9ceb8efd41e4.1468759218.git.yann.morin.1998@free.fr>
Message-ID: <20160920191931.50c54f93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 14:50:39 +0200, Yann E. MORIN wrote:
> From: Christian Stewart <christian@paral.in>
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> [Atul:
>  - Updated the default to empty.
>  - Updated the license to GPLv2.
>  - Used patches instead of SED commands.
>  - CC and LD are replaced by TARGET_CC and TARGET_LD.
> ]
> Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> [yann.morin.1998 at free.fr:
>   - drop the headers_install command
>   - instead, instruct the kernel to install them
>   - add patches 0002..0004
>   - properly build the host tools
>   - don't depend on the aufs extension, for kernel already patched
>   - fix comment
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied with those changes:

    [Thomas:
     - Remove the patch 0004-no-override-readdir64.patch, since it no longer
       applies to the latest version of aufs-util. Instead, add a post-patch
       hook that tweaks the Makefile to remove the problematic rdu64.o from
       the build process.
     - Use directly the kernel headers from the kernel source tree, rather
       than having to install them. This only requires a minor trick to
       define "__user" to empty.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
