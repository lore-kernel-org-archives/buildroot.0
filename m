From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 22:48:39 +0100
Subject: [Buildroot] [PATCH 1/1] configs: add defconfig for Nationalchip
 gx6605s dev board.
In-Reply-To: <1488801152-13368-1-git-send-email-ren_guo@c-sky.com>
References: <1488801152-13368-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <20170320224839.6677ccd0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Mar 2017 19:52:32 +0800, Guo Ren wrote:
> gx6605s is a nice SOC for dvbs2 DVB product, and C-SKY inside.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> ---
>  DEVELOPERS                     |  2 +
>  board/csky/gx6605s/gdbinit     | 25 ++++++++++++
>  board/csky/post-image.sh       |  7 ++++
>  board/csky/readme.txt          | 92 ++++++++++++++++++++++++++++++++++++++++++
>  configs/csky_gx6605s_defconfig | 18 +++++++++
>  5 files changed, 144 insertions(+)
>  create mode 100644 board/csky/gx6605s/gdbinit
>  create mode 100755 board/csky/post-image.sh
>  create mode 100644 board/csky/readme.txt
>  create mode 100644 configs/csky_gx6605s_defconfig

I've applied the patch after doing one change, see below.

> diff --git a/board/csky/post-image.sh b/board/csky/post-image.sh
> new file mode 100755
> index 0000000..be71f51
> --- /dev/null
> +++ b/board/csky/post-image.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +# .gdbinit is the csky-linux-gdb default init script. eg:
> +# $ csky-linux-gdb vmlinux
> +# Gdb will read .gdbinit to load vmlinux by default.
> +# So, we need copy the gdbinit to the .gdbinit.
> +
> +install -D -m 0644 board/csky/gx6605s/gdbinit ${BINARIES_DIR}/.gdbinit

I've removed this entirely, and just changed the readme.txt
instructions to tell people to run:

  ./output/host/usr/bin/csky-linux-gdb -x board/csky/gx6605s/gdbinit output/images/vmlinux

By referencing the gdbinit file using the -x option, we don't have to
copy it around in an hidden file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
