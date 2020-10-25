From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 10:21:55 +0100
Subject: [Buildroot] [PATCH v1] package/rtl8821au: fix patch/compile for
 kernel < 5.6.x
In-Reply-To: <20201025085725.18356-1-ps.report@gmx.net>
References: <20201025085725.18356-1-ps.report@gmx.net>
Message-ID: <20201025102155.5680d0fd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Oct 2020 09:57:25 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Add missing semicolon for linux kernel verson < 5.6.x compile introduced
> by patch 0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch.
> 
> Fixes:
> 
>   os_dep/linux/rtw_proc.c:195:1: error: expected ?,? or ?;? before ?int?
>   195 | int rtw_drv_proc_init(void)
>       | ^~~
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...vert-file_operations-to-proc_ops-for-5.6.patch | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
