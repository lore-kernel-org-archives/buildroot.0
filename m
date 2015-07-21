From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 23:17:11 +0200
Subject: [Buildroot] [PATCH] fs: build host-mkpasswd when
 BR2_ROOTFS_USERS_TABLES is used
In-Reply-To: <1437492967-6594-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1437492967-6594-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150721231711.77885b3c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Jul 2015 17:36:07 +0200, Thomas Petazzoni wrote:
> The code in fs/common.mk properly triggers the build of host-mkpasswd
> when at least one package specifies a <pkg>_USERS variable. However,
> when no selected package specifies a <pkg>_USERS variable but the user
> uses a custom users table through BR2_ROOTFS_USERS_TABLES, then we
> forget to build host-mkpasswd, leading to build failures if you don't
> have mkpasswd installed in your machine.
> 
> This commit fixes that by taking into account both the package users
> table and the custom users table when deciding to depend or not on
> host-mkpasswd.
> 
> Reported-by: Auke Willem Oosterhoff <oosterhoff@baopt.nl>
> Cc: Auke Willem Oosterhoff <oosterhoff@baopt.nl>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  fs/common.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
