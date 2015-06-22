From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 22 Jun 2015 14:06:15 +0200
Subject: [Buildroot] [V2 3/4] A20-OLinuXino-Lime: new board (mainline)
In-Reply-To: <1434741204-3988-4-git-send-email-francois.perrad@gadz.org>
References: <1434741204-3988-1-git-send-email-francois.perrad@gadz.org>
 <1434741204-3988-4-git-send-email-francois.perrad@gadz.org>
Message-ID: <5587FA37.7020800@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois,

Francois Perrad wrote:
> config device tree / mainline (4.0.5)
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   board/olimex/a20_olinuxino_lime/boot.cmd      |  5 ++
>   board/olimex/a20_olinuxino_lime/post-build.sh |  8 +++
>   board/olimex/a20_olinuxino_lime/readme.txt    | 86 +++++++++++++++++++++++++++
>   configs/olimex_a20_olinuxino_defconfig        | 41 +++++++++++++

To differentiate it from the Lime2 and the Micro, the defconfig should
be named configs/olimex_a20_olinuxino_lime_defconfig
                                      ^^^^^

It's not just a nitpick. I'm working on a -Micro these days and I will
probably send a defconfig for it. The -Micro must pull a different
U-Boot config, so the Buildroot defconfig will be different as well.

On the other hand, I _suspect_ the files in
boards/olimex/a20_olinuxino_lime can be generalized with minimal effort
to encompass both boards. But I cannot confirm that right now.

[...]

> diff --git a/board/olimex/a20_olinuxino_lime/readme.txt b/board/olimex/a20_olinuxino_lime/readme.txt
> new file mode 100644
> index 0000000..cc661a6
> --- /dev/null
> +++ b/board/olimex/a20_olinuxino_lime/readme.txt
> @@ -0,0 +1,86 @@
> +A20-OLinuXino-LIME
> +
> +Intro
> +=====
> +
> +This is a open hardware board,
> +see https://www.olimex.com/Products/OLinuXino/open-source-hardware

Why not a link to the board page itself as well?
It's https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME/

I build-tested this patch, I should have a board in a few days and be
able to run-test it as well.

[Build test only]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
