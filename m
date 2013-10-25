From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 25 Oct 2013 16:51:59 +0200
Subject: [Buildroot] [PATCH v2 1/2] packages/Config.in: Alphabetical
 entries sorting
In-Reply-To: <1382692364-25912-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1382692364-25912-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAAXf6LVHy=Gpbe=km7zLgYE0QKSNO8FfZZqHBLTX=YPKsHaahg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Fri, Oct 25, 2013 at 11:12 AM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> This patch moves :
>   "Filesystem and flash utilities" menu
>   "X applications" category
>   "JSON/XML" menu
> so they are in alphabetical order with the rest of the file.
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> Changes v1 -> v2:
>   - Remove the move of "Misc devices firmwares" (suggested by Thomas De
>     Schampheleire)
> ---
>  package/Config.in | 114 +++++++++++++++++++++++++++---------------------------
>  1 file changed, 57 insertions(+), 57 deletions(-)
>
> diff --git a/package/Config.in b/package/Config.in
> index 0e6f86c..7147a0f 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -129,6 +129,32 @@ source "package/vala/Config.in"
>  source "package/yasm/Config.in"
>  endmenu
>
> +menu "Filesystem and flash utilities"
> +source "package/cifs-utils/Config.in"
> +source "package/cramfs/Config.in"
> +source "package/curlftpfs/Config.in"
> +source "package/dosfstools/Config.in"
> +source "package/e2fsprogs/Config.in"
> +source "package/ecryptfs-utils/Config.in"
> +source "package/exfat/Config.in"
> +source "package/exfat-utils/Config.in"
> +source "package/f2fs-tools/Config.in"
> +source "package/flashbench/Config.in"
> +source "package/genext2fs/Config.in"
> +source "package/genromfs/Config.in"
> +source "package/kobs-ng/Config.in"
> +source "package/makedevs/Config.in"
> +source "package/mtd/Config.in"
> +source "package/nfs-utils/Config.in"
> +source "package/ntfs-3g/Config.in"
> +source "package/squashfs/Config.in"
> +source "package/squashfs3/Config.in"
> +source "package/sshfs/Config.in"
> +source "package/sunxi-tools/Config.in"
> +source "package/unionfs/Config.in"
> +source "package/xfsprogs/Config.in"
> +endmenu
> +
>  menu "Games"
>  source "package/doom-wad/Config.in"
>  source "package/gnuchess/Config.in"
> @@ -187,18 +213,6 @@ source "package/qt5/Config.in"
>  source "package/x11r7/Config.in"
>  source "package/weston/Config.in"
>
> -comment "X libraries and helper libraries"
> -source "package/liberation/Config.in"
> -source "package/libsexy/Config.in"
> -source "package/x11r7/xkeyboard-config/Config.in"
> -
> -comment "X Window managers"
> -source "package/blackbox/Config.in"
> -source "package/enlightenment/Config.in"
> -source "package/fluxbox/Config.in"
> -source "package/matchbox/Config.in"
> -source "package/metacity/Config.in"
> -
>  comment "X applications"
>  source "package/alsamixergui/Config.in"
>  source "package/docker/Config.in"
> @@ -222,31 +236,17 @@ source "package/xterm/Config.in"
>  source "package/xvkbd/Config.in"
>  endmenu
>
> -menu "Filesystem and flash utilities"
> -source "package/cifs-utils/Config.in"
> -source "package/cramfs/Config.in"
> -source "package/curlftpfs/Config.in"
> -source "package/dosfstools/Config.in"
> -source "package/e2fsprogs/Config.in"
> -source "package/ecryptfs-utils/Config.in"
> -source "package/exfat/Config.in"
> -source "package/exfat-utils/Config.in"
> -source "package/f2fs-tools/Config.in"
> -source "package/flashbench/Config.in"
> -source "package/genext2fs/Config.in"
> -source "package/genromfs/Config.in"
> -source "package/kobs-ng/Config.in"
> -source "package/makedevs/Config.in"
> -source "package/mtd/Config.in"
> -source "package/nfs-utils/Config.in"
> -source "package/ntfs-3g/Config.in"
> -source "package/squashfs/Config.in"
> -source "package/squashfs3/Config.in"
> -source "package/sshfs/Config.in"
> -source "package/sunxi-tools/Config.in"
> -source "package/unionfs/Config.in"
> -source "package/xfsprogs/Config.in"
> -endmenu
> +comment "X libraries and helper libraries"
> +source "package/liberation/Config.in"
> +source "package/libsexy/Config.in"
> +source "package/x11r7/xkeyboard-config/Config.in"
> +
> +comment "X Window managers"
> +source "package/blackbox/Config.in"
> +source "package/enlightenment/Config.in"
> +source "package/fluxbox/Config.in"
> +source "package/matchbox/Config.in"
> +source "package/metacity/Config.in"
>
>  menu "Hardware handling"
>  menu "Misc devices firmwares"

Have you opened menuconfig after your change?
You now moved the above two X groups into the top-level menu, instead
of inside the Graphics menu.

Best regards,
Thomas
