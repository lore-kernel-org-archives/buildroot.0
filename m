From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 23:06:22 +0200
Subject: [Buildroot] [PATCH v3 1/2] gcc: fix ccache hash of patches in
 BR2_GLOBAL_PATCH_DIR
In-Reply-To: <1460521232-28778-2-git-send-email-hchunhui@mail.ustc.edu.cn>
References: <1460521232-28778-1-git-send-email-hchunhui@mail.ustc.edu.cn>
 <1460521232-28778-2-git-send-email-hchunhui@mail.ustc.edu.cn>
Message-ID: <20160418230622.1e0a377d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Apr 2016 04:20:31 +0000, Chunhui He wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> In commit f4682cf933, a hash of the patches applied to gcc was created
> to make sure that ccache can properly detect when the toolchain has
> changed. The patches applied to gcc consist of the buildroot patches in
> package/gcc, but also potentially patches in BR2_GLOBAL_PATCH_DIR.
> However, the path to the patches in BR2_GLOBAL_PATCH_DIR was corrected
> incorrectly, because it misses a /. So instead of:
> 
> $(BR2_GLOBAL_PATCH_DIR)/gcc-initial/*.patch
> 
> it would look for
> 
> $(BR2_GLOBAL_PATCH_DIR)gcc-initial/*.patch
> 
> In other words, if BR2_GLOBAL_PATCH_DIR doesn't end with /, the patches
> in BR2_GLOBAL_PATCH_DIR are not taken into account in the ccache hash.
> 
> To fix, add the missing /
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: He Chunhui <hchunhui@mail.ustc.edu.cn>
> ---
>  package/gcc/gcc.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
