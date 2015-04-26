From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:16:41 +0200
Subject: [Buildroot] [PATCHv4 01/18] fs: only add non rootfs- targets to
 PACKAGES
In-Reply-To: <1430041876-16436-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1430041876-16436-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1430041876-16436-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150426121641.76bb1feb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Apr 2015 11:50:59 +0200, Thomas Petazzoni wrote:
> Commit 4570dbcb14b394d8f3c97baf4c9e5f4f225d1d37
> ("4570dbcb14b394d8f3c97baf4c9e5f4f225d1d37") added the dependencies of
> rootfs building logic to PACKAGES, only thinking about the case where
> rootfs building logic actually depends on real, normal packages
> (host-mtd, host-genext2fs, etc.). But some file systems (rootfs-ubi)
> depend on other filesystem images (rootfs-ubifs). And such targets
> should not be added to PACKAGES, otherwise an incorrect circular
> dependency is created.
> 
> This commit fixes that by only adding the rootfs building logic
> dependencies that do *not* start with rootfs- to the global PACKAGES
> variable.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Patch applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
