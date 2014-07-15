From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:20:29 +0200
Subject: [Buildroot] [PATCHv3 1/2] linux: add option to explicitly
 specify the kernel image name
In-Reply-To: <20140711124922.GA25220@waldemar-brodkorb.de>
References: <20140711124922.GA25220@waldemar-brodkorb.de>
Message-ID: <20140715222029.32f336dd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Fri, 11 Jul 2014 14:49:22 +0200, Waldemar Brodkorb wrote:
> For example the upcoming qemu-xtensa patch is using this feature,
> where the target is called "zImage", but the resulting kernel name
> is "Image.elf".
> 
> ---
> Changes v2 -> v3:
>   - improve subject (suggested by Thomas P.)
>   - LINUX_IMAGE_NAME defaults to LINUX_TARGET_NAME (suggested by Yann)
>   - improve help text (suggested by Yann)
> Changes v1 -> v2:
>   - add comment about default value (suggested by Arnout)
>   - reorder default value for LINUX_TARGET_NAME (suggested by Arnout)
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  linux/Config.in |   10 ++++++++++
>  linux/linux.mk  |   10 +++++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)

Thanks, I've applied this patch and the one adding the qemu
xtensa defconfig. However, regarding this second one, I'd really like
to see a followup patch adding a way of downloading the toolchain
overlay file, instead of having it inside Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
