From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 10 May 2013 19:36:49 +0200
Subject: [Buildroot] [PATCH v2 0/1] linux.mk: change the linux tarball
	compression to xz
Message-ID: <1368207410-9626-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for your review.
You are right, but regarding linux compression, since there are xz-ed
tarballs for all versions even for linux-1.0, on www.kernel.org/pub/
so now I propose a small patch only for linux.
  
Changes in v2:
Change only linux tarball compression

Changes in v1:
After selecting BR2_LINUX_KERNEL or BR2_LINUX_KERNEL_CUSTOM_VERSION
configuration item, if any of linux tarball linux-$(LINUX_VERSION).tar.xx
in local tarball directory $(BR2_DL_DIR) exists, it used should be,
otherwise *we* set the compression of linux tarball to download to xz.

Regards,
Jerzy


Jerzy Grzegorek (1):
  linux.mk: change the linux tarball compression to xz

 linux/linux.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.7.9.5
