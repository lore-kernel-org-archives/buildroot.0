From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:43:06 +0100
Subject: [Buildroot] [PATCH 1/4] fs/ext2: Remove support for
 auto-calculation of rootfs size
In-Reply-To: <1490372432-879-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1490372432-879-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <20170325144306.0a883fc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Mar 2017 17:20:29 +0100, S?bastien Szymanski wrote:
> Auto-calculation of the rootfs size cannot be done in a reliable way as
> it depends on the host filesystem and is broken on non ext4 host. [1] [2]
> So let the user specify the size he wants for his rootfs.
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=8831
> [2] https://bugs.busybox.net/show_bug.cgi?id=9496
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  Config.in.legacy        | 14 ++++++++++++++
>  fs/ext2/Config.in       | 12 ++----------
>  fs/ext2/ext2.mk         |  1 -
>  package/mke2img/mke2img | 20 +-------------------
>  4 files changed, 17 insertions(+), 30 deletions(-)

Applied to master after taking into account the suggestion of Arnout to
use a 60MB size by default.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
