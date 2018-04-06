From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:31:47 +0200
Subject: [Buildroot] [PATCH 1/2] llvm: add dependency on
 !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
In-Reply-To: <20180406090013.20187-1-thomas.petazzoni@bootlin.com>
References: <20180406090013.20187-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180406213147.68952dd3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Apr 2018 11:00:12 +0200, Thomas Petazzoni wrote:
> LLVM uses std::shared_future, which until gcc 7.x isn't available on
> architectures that don't provide lock-free atomics, see
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735.
> 
> Buildroot already has a BR2_TOOLCHAIN_HAS_GCC_BUG_64735 option to
> handle such a case, so simply add this new dependency to LLVM. It will
> make sure LLVM doesn't get built on ARMv5 platforms using a gcc older
> than 7.x.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/ada497f6a8d20fa1a9adb2b17a138d7b726a6cdc/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/llvm/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Both patches applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
