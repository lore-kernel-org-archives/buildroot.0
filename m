From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 23:58:01 +0100
Subject: [Buildroot] [PATCH] xmlstarlet: fix static linking problem
In-Reply-To: <20161107181429.GA23343@waldemar-brodkorb.de>
References: <20161107181429.GA23343@waldemar-brodkorb.de>
Message-ID: <20161115235801.2c6a74b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 7 Nov 2016 19:14:29 +0100, Waldemar Brodkorb wrote:
> Instead of patching configure.ac we can just add the missing
> libraries to LIBS. Tested with m68k/arm static builds.
> This makes the patch obsolete and the autoreconf can be avoided.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/02f9fc5884d3a7d460b96937183362d6c3fc6fde
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...Fix-static-linking-problem-with-libgcrypt.patch | 46 ----------------------
>  package/xmlstarlet/xmlstarlet.mk                   |  4 +-
>  2 files changed, 1 insertion(+), 49 deletions(-)
>  delete mode 100644 package/xmlstarlet/0001-Fix-static-linking-problem-with-libgcrypt.patch

I've applied to master, thanks. However, it's worth mentioning that:

 1. My patch had in fact been merged upstream
 (https://sourceforge.net/p/xmlstar/code/ci/0380e4d1e2d02aec868b7199e71bbe56e8161223/)
 even if I agree it's by far not the best solution.

 2. The proper solution would be to improve the configure.ac script to
 use pkg-config directly. But since upstream is not very active, and
 hasn't done a release since 2014, I can understand that you may not
 been very motivated to do this work.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
