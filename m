From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Dec 2011 13:07:45 +0100
Subject: [Buildroot] [PATCH] Python: add external modules option
In-Reply-To: <1323857304-8969-1-git-send-email-yegorslists@googlemail.com>
References: <1323857304-8969-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <CAAXf6LVpth6X5afc1wNyivPTkCxCR2Sy9gsMQLSZjFFJpH_aOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 14, 2011 at 11:08 AM,  <yegorslists@googlemail.com> wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> all external python packages/libraries should reside in
> "external python modules" section.
>
> Move existing modules python-serial and python-mad there
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> ?package/Config.in ? ? ? ? ? ?| ? ?7 ++++++-
> ?package/multimedia/Config.in | ? ?1 -
> ?2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/package/Config.in b/package/Config.in
> index eb93b1c..cca2b0a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -236,6 +236,12 @@ endif
> ?source "package/microperl/Config.in"
> ?source "package/php/Config.in"
> ?source "package/python/Config.in"
> +if BR2_PACKAGE_PYTHON
> +menu "external python modules"
> +source "package/multimedia/python-mad/Config.in"

What do we do with this?
Do we keep python-mad in multimedia, or move it up one directory to
package/python-mad?
I wouldn't be opposed to moving it.

> +source "package/python-serial/Config.in"
> +endmenu
> +endif
> ?source "package/ruby/Config.in"
> ?source "package/tcl/Config.in"
> ?endmenu
> @@ -312,7 +318,6 @@ source "package/libhid/Config.in"
> ?source "package/libiqrf/Config.in"
> ?source "package/libusb/Config.in"
> ?source "package/libusb-compat/Config.in"
> -source "package/python-serial/Config.in"
> ?endmenu
>
> ?if BROKEN
> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
> index d50e4fc..a05d1d9 100644
> --- a/package/multimedia/Config.in
> +++ b/package/multimedia/Config.in
> @@ -40,7 +40,6 @@ source "package/multimedia/mplayer/Config.in"
> ?source "package/multimedia/musepack/Config.in"
> ?source "package/multimedia/portaudio/Config.in"
> ?source "package/multimedia/pulseaudio/Config.in"
> -source "package/multimedia/python-mad/Config.in"
> ?source "package/multimedia/speex/Config.in"
> ?source "package/multimedia/tidsp-binaries/Config.in"
> ?source "package/multimedia/taglib/Config.in"
> --
> 1.7.1.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
