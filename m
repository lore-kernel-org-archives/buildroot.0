From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 15:38:56 +0100
Subject: [Buildroot] [PATCH] package/sg3_utils: ensure to build against
 librt when needed
In-Reply-To: <20190210135130.15117-1-thomas.petazzoni@bootlin.com>
References: <20190210135130.15117-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190211153856.6b73c2bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Feb 2019 14:51:30 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The sg3_utils has provisions to build against librt when needed, but
> forgot to use that mechanism for the sg_turs program. This commit
> fixes that. The patch has been submitted upstream to the sg3_utils
> author.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/67b890a41d05497820ea4f44e187257dd6818b0b/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...le.am-add-missing-RT_LIB-for-sg_turs.patch | 29 +++++++++++++++++++
>  package/sg3_utils/sg3_utils.mk                |  2 +-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 package/sg3_utils/0002-src-Makefile.am-add-missing-RT_LIB-for-sg_turs.patch

Applied to master, thanks. FYI, the patch has been applied by the
upstream maintainer.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
