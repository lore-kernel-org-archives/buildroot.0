From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 14:41:04 +0100
Subject: [Buildroot] [PATCH] fs: prepare temp directory before running
 PRE_GEN hooks
In-Reply-To: <20171202115505.30997-1-yann.morin.1998@free.fr>
References: <20171202115505.30997-1-yann.morin.1998@free.fr>
Message-ID: <20171202144104.39d92cf6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Dec 2017 12:55:05 +0100, Yann E. MORIN wrote:
> Some filesystems have PRE_GEN hooks that create a directory structure
> under the temporary directory.
> 
> For example, iso9660 will create a sub-directory where it stores the
> kernel (in case of initramfs or initrd).
> 
> So, we must run the PRE_GEN hooks after we cleanup/create the temporary
> directory.
> 
> Fixes:
>     https://gitlab.com/buildroot.org/buildroot/-/jobs/42835965
>     https://gitlab.com/buildroot.org/buildroot/-/jobs/42835967
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
