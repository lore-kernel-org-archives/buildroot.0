From: tarek_el-sherbiny at waters.com <tarek_el-sherbiny@waters.com>
Date: Thu, 19 Apr 2018 09:36:58 +0100
Subject: [Buildroot] [PATCH 0/1] grub2: force -fno-stack-protector in
 CPPFLAGS
Message-ID: <20180419083659.22462-1-tarek_el-sherbiny@waters.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tarek El-Sherbiny <tarek_el-sherbiny@waters.com>

grub2 fails to configure when BR2_SSP_ALL is enabled, with the following configure error:

checking for target linking format... unknown
configure: error: no suitable link format found
package/pkg-generic.mk:211: recipe for target 'output/build/grub2-2.02/.stamp_configured' failed

This problem has been previously fixed by here:
commit 2a27294e9ade6130a12ced9a1f152c51431a870e

However, a more recent change which was introduced in 2018.02.x branch has broken the build:
commit 20a4583ebf7fe97ea22a1ea11621dd44a8114ca5

This patch will implement the same workaround but for the correct flags.


Tarek El-Sherbiny (1):
  grub2: force -fno-stack-protector in CPPFLAGS

 boot/grub2/grub2.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.14.1


===========================================================
The information in this email is confidential, and is intended solely for the addressee(s). 
Access to this email by anyone else is unauthorized and therefore prohibited.  If you are 
not the intended recipient you are notified that disclosing, copying, distributing or taking 
any action in reliance on the contents of this information is strictly prohibited and may be unlawful.
===========================================================
