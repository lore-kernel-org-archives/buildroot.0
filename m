From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:26:48 +0100
Subject: [Buildroot] [PATCH] musl: workaround kernel if_ether.h header
 conflict
In-Reply-To: <17c4ddc5aab7fdf5461d265a1602a13f6f291708.1481863937.git.baruch@tkos.co.il>
References: <17c4ddc5aab7fdf5461d265a1602a13f6f291708.1481863937.git.baruch@tkos.co.il>
Message-ID: <20161217152648.4632f3b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Dec 2016 06:52:17 +0200, Baruch Siach wrote:
> Add a patch that defines _LINUX_IF_ETHER_H in netinet/if_ether.h to avoid the
> conflicting kernel if_ether.h.
> 
> Other musl distros (Alpine, Sabotage, Gentoo) patch[1] the kernel headers
> instead. This is not practical in Buildroot, since we allow the user to choose
> the kernel version.
> 
> This only fixes the normal case of including linux/if_ether.h (directly or
> indirectly) after netinet/if_ether.h.
> 
> Fixes (tcpreplay):
> http://autobuild.buildroot.net/results/a65/a65b27f9e288f94f041ced64313dbf55af47bf36/
> 
> [1] https://cgit.gentoo.org/proj/musl.git/diff/sys-kernel/linux-headers/files/libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch?id=8eddda8072add075ebf56cf6d288bc1450d6b5f8
> 
> Cc: Rich Felker <dalias@aerifal.cx>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> This patch will take effect in the autobuilder after a rebuild of musl
> toolchains.
> ---
>  package/musl/0002-avoid-kernel-if_ether.h.patch | 30 +++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/musl/0002-avoid-kernel-if_ether.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
