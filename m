From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 6 Sep 2020 12:27:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/linuxptp: needs threads
In-Reply-To: <20200906102048.2688555-1-fontaine.fabrice@gmail.com>
References: <20200906102048.2688555-1-fontaine.fabrice@gmail.com>
Message-ID: <CAEyMn7Y1FGs=8O9Bb=BGbhRWaTrCoW82bAkossSqO9FQsJ0pgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frabrice,

Am So., 6. Sept. 2020 um 12:21 Uhr schrieb Fabrice Fontaine
<fontaine.fabrice@gmail.com>:
>
> linuxptp needs threads since version 3.0 and
> https://sourceforge.net/p/linuxptp/code/ci/7486e6e4e1b13bd9bceb23c40ace7e048a88b8e5
>
> Fixes:
>  - http://autobuild.buildroot.org/results/421dd595f0fd3c0af099cd2991ee94d4edd272e1
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  package/linuxptp/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/linuxptp/Config.in b/package/linuxptp/Config.in
> index 3e18a0cb13..c88b7a0619 100644
> --- a/package/linuxptp/Config.in
> +++ b/package/linuxptp/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LINUXPTP
>         bool "linuxptp"
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
>         help
>           The Linux PTP Project is the Precision Time Protocol
>           implementation according to IEEE standard 1588 for Linux.
> @@ -11,3 +12,6 @@ config BR2_PACKAGE_LINUXPTP
>           not a goal.
>
>           http://linuxptp.sourceforge.net/
> +
> +comment "linuxptp needs a toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS

Thank you

-- 
Heiko
