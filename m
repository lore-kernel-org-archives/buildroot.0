From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Nov 2012 23:22:31 +0100
Subject: [Buildroot] [PATCH 2/2 v3] neardal: new package
In-Reply-To: <1352628468-14490-3-git-send-email-spdawson@gmail.com>
References: <1352628468-14490-1-git-send-email-spdawson@gmail.com>
 <1352628468-14490-3-git-send-email-spdawson@gmail.com>
Message-ID: <50A02527.4020801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/12 11:07, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>   (built-test on a minimal powerpc config)
> ---
>   v3: Remove spurious dependency on neard, add Arnout Vandecappelle's acks
>   v2: (No v2, bumped entire patch series to v3)
>
>   package/Config.in          |    1 +
>   package/neardal/Config.in  |    7 +++++++
>   package/neardal/neardal.mk |   16 ++++++++++++++++
>   3 files changed, 24 insertions(+)
>   create mode 100644 package/neardal/Config.in
>   create mode 100644 package/neardal/neardal.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 6115fb4..0e6970c 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -419,6 +419,7 @@ source "package/libusb/Config.in"
>   source "package/libusb-compat/Config.in"
>   source "package/libv4l/Config.in"
>   source "package/mtdev/Config.in"
> +source "package/neardal/Config.in"
>   source "package/pcsc-lite/Config.in"
>   endmenu
>
> diff --git a/package/neardal/Config.in b/package/neardal/Config.in
> new file mode 100644
> index 0000000..719bf95
> --- /dev/null
> +++ b/package/neardal/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_NEARDAL
> +	bool "neardal"
> +	select BR2_PACKAGE_DBUS_GLIB

  Boy, looks like I wasn't paying attention...  You need to copy the
dependencies from dbus-glib:
         depends on BR2_PACKAGE_DBUS # dbus-glib
         depends on BR2_USE_WCHAR # glib2

  And of course a comment to explain its absence.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
