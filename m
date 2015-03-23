From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Mar 2015 19:13:56 +0100
Subject: [Buildroot] [PATCH 1/1] busybox: add conditional dependency on
 libselinux (v2)
In-Reply-To: <1427044138-10848-1-git-send-email-chris@sombrio.com>
References: <1427044138-10848-1-git-send-email-chris@sombrio.com>
Message-ID: <20150323191356.43b26176@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Stone,

On Sun, 22 Mar 2015 13:08:58 -0400, Chris Stone wrote:
> If you select the selinux applets when configuring
> busybox then the busybox build fails due to a missing selinux.h file. This is
> because there is no dependency on libselinux in the busybox make. The lack of
> dependency is completely understandable, since there is no such dependency
> when a user does not configure in the selinux applets. The attached patch
> adds a conditional libselinux dependency to the busybox make when the
> libselinux package has been selected for the target. It is not unreasonable
> to assume that if a user selects libselinux, then he may also select the
> busybox selinux applets. Additionally, if the user has already selected
> libselinux for the target, then adding a dependency to libselinx to busybox
> does no harm, even if the user does not configure in the selinux applet.
> 
> Signed-off-by: Chris Stone <chris@sombrio.com>

I think this patch is a duplicate of
https://patchwork.ozlabs.org/patch/427118/, which amongst other patches
in the series, add SELinux support to Busybox
.
Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
