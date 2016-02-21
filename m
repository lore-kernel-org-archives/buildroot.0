From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:43:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/quota: add optional support for
 e2fsprogs
In-Reply-To: <1456009925-11756-2-git-send-email-bernd.kuhls@t-online.de>
References: <1456009925-11756-1-git-send-email-bernd.kuhls@t-online.de>
 <1456009925-11756-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221144330.588667cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 00:12:05 +0100, Bernd Kuhls wrote:
> When e2fsprogs was compiled before, quota will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/quotacheck | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libcom_err.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libext2fs.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
> 
> Quote from configure log before this patch when e2fsprogs were missing:
> 
> checking ext2fs/ext2fs.h usability... no
> checking ext2fs/ext2fs.h presence... no
> checking for ext2fs/ext2fs.h... no
> checking for com_err in -lcom_err... no
> checking for ext2fs_initialize in -lext2fs... no
> configure: WARNING: Ext2 direct support won't be compiled. Libraries not found.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/quota/quota.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
