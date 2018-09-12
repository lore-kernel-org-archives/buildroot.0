From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 20:59:42 +0200
Subject: [Buildroot] [PATCH] vboot-utils: fix major() build failure due
 to glibc 2.28
In-Reply-To: <20180912111835.35443-1-giulio.benetti@micronovasrl.com>
References: <20180912111835.35443-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180912205942.1bfc4ebc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 13:18:35 +0200, Giulio Benetti wrote:
> glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
> and therefore <sys/sysmacros.h> must be included explicitly when
> major() are used.
> 
> This commit adds an upstream patch to directly include
> <sys/sysmacros.h> into cgpt_wrapper.c and dump_kernel_config_lib.c files
> where major() macro is used.
> 
> The upstream patch has been taken from:
> https://chromium.googlesource.com/chromiumos/platform/vboot_reference/+/435fbcee218b37a87368e2b22fa33366875d458c
> 
> Fixes:
> http://autobuild.buildroot.net/results/4a2/4a21307984cb16d7879149dd9b9b062181b0388f/
> http://autobuild.buildroot.net/results/899/899569165112fe577cf191cd4f0c698cbedeb9b1/
> http://autobuild.buildroot.net/results/0e5/0e527d231fa791ec8e3375804f1a0043f92d73d0/
> http://autobuild.buildroot.net/results/184/1849be60dd13c1debfbcfb8fba5cec113e81af62/
> http://autobuild.buildroot.net/results/38f/38fcefe4feabfd95692cf6b3f7ecf84259fca4de/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  ...05-include-sys-sysmacros.h-for-major.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/vboot-utils/0005-include-sys-sysmacros.h-for-major.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
