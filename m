From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 23 Oct 2013 15:24:02 +0200
Subject: [Buildroot] [PATCH] packages/Config.in: more alphabetical
	sorting
In-Reply-To: <1382349586-8197-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1382349586-8197-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAAXf6LWoi82w_eyJuvm3=8+6Xkvr32BxqmtbrWT=0yC4oovocQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Mon, Oct 21, 2013 at 11:59 AM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> Following the patch 2e53cb9e014df87a29aed17d0b2582232df94e4f, here some
> more sorting inside each menus.
>
> Also, menus and categories have been moved for them to appear in
> the alphabetical order.

I would have split this in two patches, because now we cannot easily
check whether you changed the order within a moved block.

>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/Config.in | 109 +++++++++++++++++++++++++++---------------------------
>  1 file changed, 54 insertions(+), 55 deletions(-)
>
> diff --git a/package/Config.in b/package/Config.in
> index 0e6f86c..3db7089 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -9,8 +9,8 @@ source "package/bellagio/Config.in"
>  source "package/faad2/Config.in"
>  source "package/ffmpeg/Config.in"
>  source "package/flac/Config.in"
> -source "package/gstreamer/Config.in"
>  source "package/gstreamer1/Config.in"
> +source "package/gstreamer/Config.in"

Why should gstreamer1 come before gstreamer?
If you use 'sort' on these two lines, it will indeed put gstreamer1
before gstreamer, but that is not true if you just ask to sort
'gstreamer1' and 'gstreamer'. This is because sort depends on the
locale, and standard locales will ignore -, /, etc. when sorting. So
when asking to sort 'gstreamer/C' and 'gstreamer1/C', what you're
really sorting is 'gstreamerC' and 'gstreamer1C', so that gstreamer1C
is first (1 < C).
To get real ASCII order, you can set LC_ALL=C before sorting.

Anyway, I don't think we should sort on the full line, but rather on
the package name, hence gstreamer < gstreamer1.

>  source "package/lame/Config.in"
>  source "package/libvpx/Config.in"
>  source "package/madplay/Config.in"
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
> +source "package/squashfs3/Config.in"
> +source "package/squashfs/Config.in"
> +source "package/sshfs/Config.in"
> +source "package/sunxi-tools/Config.in"
> +source "package/unionfs/Config.in"
> +source "package/xfsprogs/Config.in"
> +endmenu
> +
>  menu "Games"
>  source "package/doom-wad/Config.in"
>  source "package/gnuchess/Config.in"
> @@ -154,8 +180,8 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  source "package/fbset/Config.in"
>  endif
>  source "package/fbterm/Config.in"
> -source "package/fbv/Config.in"
>  source "package/fb-test-app/Config.in"
> +source "package/fbv/Config.in"

This is again caused by locale-dependent behavior of sort. In fact,
strict ASCII ordering would put fb-test-app before any fbX, so before
fbdump. This is probably better.

>  source "package/imagemagick/Config.in"
>  source "package/linux-fusion/Config.in"
>  source "package/lite/Config.in"
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
> @@ -220,44 +234,21 @@ source "package/xscreensaver/Config.in"
>  source "package/xstroke/Config.in"
>  source "package/xterm/Config.in"
>  source "package/xvkbd/Config.in"
> -endmenu
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
>  endmenu
>
>  menu "Hardware handling"
> -menu "Misc devices firmwares"
> -source "package/am33x-cm3/Config.in"
> -source "package/b43-firmware/Config.in"
> -source "package/linux-firmware/Config.in"
> -source "package/rpi-firmware/Config.in"
> -source "package/sunxi-boards/Config.in"
> -source "package/ux500-firmware/Config.in"
> -source "package/zd1211-firmware/Config.in"
> -endmenu
>  source "package/a10disp/Config.in"
>  source "package/acpid/Config.in"
>  source "package/cdrkit/Config.in"
> @@ -304,6 +295,15 @@ source "package/mdadm/Config.in"
>  source "package/media-ctl/Config.in"
>  source "package/memtester/Config.in"
>  source "package/minicom/Config.in"
> +menu "Misc devices firmwares"
> +source "package/am33x-cm3/Config.in"
> +source "package/b43-firmware/Config.in"
> +source "package/linux-firmware/Config.in"
> +source "package/rpi-firmware/Config.in"
> +source "package/sunxi-boards/Config.in"
> +source "package/ux500-firmware/Config.in"
> +source "package/zd1211-firmware/Config.in"
> +endmenu
>  source "package/nanocom/Config.in"
>  source "package/neard/Config.in"
>  source "package/ofono/Config.in"
> @@ -516,8 +516,8 @@ source "package/libpng/Config.in"
>  source "package/libqrencode/Config.in"
>  source "package/libraw/Config.in"
>  source "package/librsvg/Config.in"
> -source "package/libsvg/Config.in"
>  source "package/libsvg-cairo/Config.in"
> +source "package/libsvg/Config.in"

Same here, libsvg should remain before libsvg-cairo.

>  source "package/libsvgtiny/Config.in"
>  source "package/libungif/Config.in"
>  source "package/opencv/Config.in"
> @@ -550,8 +550,8 @@ source "package/libqmi/Config.in"
>  source "package/libraw1394/Config.in"
>  source "package/libserial/Config.in"
>  source "package/libsoc/Config.in"
> -source "package/libusb/Config.in"
>  source "package/libusb-compat/Config.in"
> +source "package/libusb/Config.in"

Same here.

>  source "package/libv4l/Config.in"
>  source "package/libxkbcommon/Config.in"
>  source "package/mtdev/Config.in"
> @@ -694,8 +694,8 @@ source "package/mtdev2tuio/Config.in"
>  source "package/orc/Config.in"
>  source "package/p11-kit/Config.in"
>  source "package/poco/Config.in"
> -source "package/protobuf/Config.in"
>  source "package/protobuf-c/Config.in"
> +source "package/protobuf/Config.in"

Same here.

>  source "package/schifra/Config.in"
>  source "package/startup-notification/Config.in"
>  source "package/tzdata/Config.in"
> @@ -729,8 +729,8 @@ source "package/json-c/Config.in"
>  source "package/json-glib/Config.in"
>  source "package/libjson/Config.in"
>  source "package/libroxml/Config.in"
> -source "package/libxml-parser-perl/Config.in"
>  source "package/libxml2/Config.in"
> +source "package/libxml-parser-perl/Config.in"

Same here.

>  source "package/libxmlpp/Config.in"
>  source "package/libxslt/Config.in"
>  source "package/libyaml/Config.in"
> @@ -856,12 +856,12 @@ source "package/pppd/Config.in"
>  source "package/pptp-linux/Config.in"
>  source "package/proftpd/Config.in"
>  source "package/proxychains-ng/Config.in"
> -source "package/ptpd/Config.in"
>  source "package/ptpd2/Config.in"
> +source "package/ptpd/Config.in"

Same here.

>  source "package/quagga/Config.in"
>  source "package/radvd/Config.in"
> -source "package/rp-pppoe/Config.in"
>  source "package/rpcbind/Config.in"
> +source "package/rp-pppoe/Config.in"

Same here.

>  source "package/rsh-redone/Config.in"
>  source "package/rsync/Config.in"
>  source "package/rtorrent/Config.in"
> @@ -906,7 +906,6 @@ source "package/wpa_supplicant/Config.in"
>  source "package/wvdial/Config.in"
>  source "package/xinetd/Config.in"
>  source "package/xl2tp/Config.in"
> -
>  endmenu
>
>  menu "Package managers"

Best regards,
Thomas
