From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Jul 2017 15:45:16 +0200
Subject: [Buildroot] [PATCH v2 2/7] arch/xtensa: allow specifying path
 to tarball file
In-Reply-To: <1499602921-25097-3-git-send-email-jcmvbkbc@gmail.com>
References: <1499602921-25097-1-git-send-email-jcmvbkbc@gmail.com>
 <1499602921-25097-3-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20170709154516.1e95e778@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Jul 2017 05:21:56 -0700, Max Filippov wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> currently, specifying a custom Xtrensa core is done with two variables:
>   - the core name
>   - the directory containing the overlay tarball
> 
> However, the core name only serves to construct the tarball name, and is
> not used whatsoever to configure any of the toolchain components
> (binutils, gcc or gdb), except through the files that are overlayed in
> their respective source trees.
> 
> This has two main drawbacks:
>   - the overlay file must be named after the core,
>   - the tarball can not be compressed.
> 
> Furthermore, it also makes it extremely complex to implement a download
> of that tarball.
> 
> So, those two variables can be squeezed into a single variable, that is
> the complete path of the overlay tarball.
> 
> Update the qemu-xtensa defconfig accordingly.
> 
> Note: we do not add a legacy entry for BR2_XTENSA_CORE_NAME, since it
> was previously a blind option in the last release, and there's been no
> release since we removed BR2_XTENSA_CUSTOM_NAME. So, we just update the
> legacy comments for BR2_XTENSA_CUSTOM_NAME, since that's all the user
> could have seen in any of our releases so far.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
> Changes v1->v2:
> - replace ARCH_XTENSA_CORE_NAME with ARCH_XTENSA_OVERLAY_FILE in overlay
>   application conditions in package makefiles.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
