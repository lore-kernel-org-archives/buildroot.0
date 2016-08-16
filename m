From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 16 Aug 2016 10:36:15 -0500
Subject: [Buildroot] [PATCH] skeleton: /etc/network/interface.d/* support
In-Reply-To: <1471360870-53982-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1471360870-53982-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpZ7=YfT3zoW9E8evQ0dETrxn8zCpvDrEbPAazc9Xc=Zzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Aug 16, 2016 at 10:21 AM, Matt Weber <
matthew.weber@rockwellcollins.com> wrote:

> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/skeleton/skeleton.mk                    | 2 ++
>  system/device_table.txt                         | 1 +
>  system/skeleton/etc/network/interfaces.d/.empty | 0
>  3 files changed, 3 insertions(+)
>  create mode 100644 system/skeleton/etc/network/interfaces.d/.empty
>
> diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
> index 1000161..c9dce10 100644
> --- a/package/skeleton/skeleton.mk
> +++ b/package/skeleton/skeleton.mk
> @@ -151,6 +151,8 @@ define SKELETON_SET_NETWORK_LOCALHOST
>                 echo ;                                               \
>                 echo "auto lo";                                      \
>                 echo "iface lo inet loopback";                       \
> +               echo ;                                               \
> +               echo "source interfaces.d/*";                        \
>

Needs to be conditional for BR2_PACKAGE_IFUPDOWN supports this and busybox
does not



>         ) > $(TARGET_DIR)/etc/network/interfaces
>  endef
>
> diff --git a/system/device_table.txt b/system/device_table.txt
> index dc1af51..69b1d46 100644
> --- a/system/device_table.txt
> +++ b/system/device_table.txt
> @@ -17,5 +17,6 @@
>  /etc/network/if-pre-up.d               d       755     0       0       -
>      -       -       -       -
>  /etc/network/if-down.d                 d       755     0       0       -
>      -       -       -       -
>  /etc/network/if-post-down.d            d       755     0       0       -
>      -       -       -       -
> +/etc/network/interfaces.d              d       755     0       0       -
>      -       -       -       -
>  # uncomment this to allow starting x as non-root
>  #/usr/X11R6/bin/Xfbdev                 f       4755    0       0       -
>      -       -       -       -
> diff --git a/system/skeleton/etc/network/interfaces.d/.empty
> b/system/skeleton/etc/network/interfaces.d/.empty
> new file mode 100644
> index 0000000..e69de29
> --
> 1.9.1
>
>


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure
Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160816/5fc54376/attachment.html>
