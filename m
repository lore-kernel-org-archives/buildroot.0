From: Chunhui He <hchunhui@mail.ustc.edu.cn>
Date: Wed, 13 Apr 2016 04:20:30 +0000
Subject: [Buildroot] [PATCH v3 0/2] gcc: apply patches stored in global
	patches directories
Message-ID: <1460521232-28778-1-git-send-email-hchunhui@mail.ustc.edu.cn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this is my patch v3 that applies patches in $(BR2_GLOBAL_PATCH_DIR)/gcc.

Arnout, thanks for your help!

Regards,
Chunhui


v3: - add files to HOST_GCC_COMMON_CCACHE_HASH_FILES to make sure that
      the ccache hash is updated appropriately.
    - fix indent.
    - include Arnout's patch that fix ccache hash.

v2: - move the $(GCC_VERSION) part of the suffix to the correct place.


Arnout Vandecappelle (Essensium/Mind) (1):
  gcc: fix ccache hash of patches in BR2_GLOBAL_PATCH_DIR

Chunhui He (1):
  gcc: apply patches stored in global patches directories

 package/gcc/gcc.mk | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

-- 
2.1.4
