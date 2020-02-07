From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 7 Feb 2020 22:45:01 +0100
Subject: [Buildroot] [PATCH v16 2/4] package/gdb: depend on libiberty
In-Reply-To: <20200207023834.877032-3-aduskett@gmail.com>
References: <20200207023834.877032-1-aduskett@gmail.com>
 <20200207023834.877032-3-aduskett@gmail.com>
Message-ID: <a30c7c70-27ab-290a-3e38-08e4575f39de@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam, All,

On 2/7/20 3:38 AM, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> If present, GDB may use a system installed libiberty. As such, we must ensure
> that host-libiberty is installed first.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

> ---
> v13 -> v14:
>    - Fix typo in the comment. (Arnout)
> 
> v1 -> v11:
>    - Add this patch to the series
> 
>   package/gdb/gdb.mk | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 46d745a897..01f7e14460 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -35,7 +35,9 @@ endif
>   # For the host variant, we really want to build with XML support,
>   # which is needed to read XML descriptions of target architectures. We
>   # also need ncurses.
> -HOST_GDB_DEPENDENCIES = host-expat host-ncurses
> +# As for libiberty, gdb may use a system-installed one if present, so
> +# we must ensure ours is installed first.
> +HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses
>   
>   # Disable building documentation
>   GDB_MAKE_OPTS += MAKEINFO=true
> 

-- 
Giulio Benetti
Benetti Engineering sas
