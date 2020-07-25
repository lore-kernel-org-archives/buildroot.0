From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2020 22:23:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltris: fix build with gcc 4.8
In-Reply-To: <20200725164559.398518-1-fontaine.fabrice@gmail.com>
References: <20200725164559.398518-1-fontaine.fabrice@gmail.com>
Message-ID: <20200725202331.GG19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-07-25 18:45 +0200, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/991d601b30831df61c78dc7109a2f4ab9ace3f84
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../ltris/0001-fix-build-with-gcc-4.8.patch   | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/ltris/0001-fix-build-with-gcc-4.8.patch
> 
> diff --git a/package/ltris/0001-fix-build-with-gcc-4.8.patch b/package/ltris/0001-fix-build-with-gcc-4.8.patch
> new file mode 100644
> index 0000000000..d6bbf6a946
> --- /dev/null
> +++ b/package/ltris/0001-fix-build-with-gcc-4.8.patch
> @@ -0,0 +1,20 @@
> +Fix build with gcc 4.8
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://sourceforge.net/p/lgames/patches/28]
> +Index: ltris/src/bowl.c
> +===================================================================
> +--- ltris/src/bowl.c	(r?vision 421)
> ++++ ltris/src/bowl.c	(copie de travail)
> +@@ -828,9 +828,10 @@
> + */
> + void bowl_init_block_masks() 
> + {
> ++	int i;
> + 	int masksize = sizeof(block_masks[0].mask); // same for all
> + 
> +-	for (int i = 0; i < 7; i++) {
> ++	for (i = 0; i < 7; i++) {
> + 		block_masks[i].rx = 2;
> + 		block_masks[i].ry = 2;
> + 		memset(block_masks[i].mask, 0, masksize );
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
