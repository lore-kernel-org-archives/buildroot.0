From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 7 Apr 2016 09:39:13 +0200
Subject: [Buildroot] [PATCH 1/1] new package: alsacap
In-Reply-To: <7cdd4c8373ad3a3a08131b2eaf5e2bcc@poczta.spox.org>
References: <1459926063-11265-1-git-send-email-niziak@spox.org>
 <CAGm1_ks=HSe8v+7e2WrFj=M9SpuLkav=WS_xhMtB76521wJ3rw@mail.gmail.com>
 <7cdd4c8373ad3a3a08131b2eaf5e2bcc@poczta.spox.org>
Message-ID: <57060EA1.8080005@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Wojciech,

In addition to the previous comments...

> Hello!
> Corrected patch below.
> Hash file added, but hash is not used, because source comes from git 
> repository.
>
>
> Alsa capability tool displays the capabilities of your sound card and
> its ALSA driver
>
> Signed-off-by: Wojciech Nizinski <niziak@spox.org>
> ---
>  package/Config.in            |  1 +
>  package/alsacap/Config.in    |  5 +++++
>  package/alsacap/alsacap.hash |  2 ++
>  package/alsacap/alsacap.mk   | 18 ++++++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/alsacap/Config.in
>  create mode 100644 package/alsacap/alsacap.hash
>  create mode 100644 package/alsacap/alsacap.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 64822bf..29045b2 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -5,6 +5,7 @@ menu "Target packages"
>
>  menu "Audio and video applications"
>      source "package/alsa-utils/Config.in"
> +    source "package/alsacap/Config.in"
>      source "package/aumix/Config.in"
>      source "package/bellagio/Config.in"
>      source "package/dvblast/Config.in"
> diff --git a/package/alsacap/Config.in b/package/alsacap/Config.in
> new file mode 100644
> index 0000000..d472973
> --- /dev/null
> +++ b/package/alsacap/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_ALSACAP
> +    bool "alsacap"
> +    depends on BR2_PACKAGE_ALSA_LIB
> +    help
> +        Alsa capability tool displays the capabilities of your sound 
> card and its ALSA driver.
> diff --git a/package/alsacap/alsacap.hash b/package/alsacap/alsacap.hash
> new file mode 100644
> index 0000000..293df28
> --- /dev/null
> +++ b/package/alsacap/alsacap.hash
> @@ -0,0 +1,2 @@
> +none   xxx alsacap-05968d33bd42b9550ac0892c0214edc956d09d8d.tar.gz
> +
> diff --git a/package/alsacap/alsacap.mk b/package/alsacap/alsacap.mk
> new file mode 100644
> index 0000000..135ab87
> --- /dev/null
> +++ b/package/alsacap/alsacap.mk
> @@ -0,0 +1,18 @@
> +################################################################################ 
>
> +#
> +# alsacap
> +#
> +################################################################################ 
>

Add empty line here.

> +ALSACAP_VERSION = 05968d33bd42b9550ac0892c0214edc956d09d8d
> +ALSACAP_SITE = $(call github,bubbapizza,alsacap,$(ALSACAP_VERSION))
> +
> +ALSACAP_LICENSE = ISC
> +ALSACAP_LICENSE_FILES = COPYING
> +
> +ALSACAP_DEPENDENCIES = alsa-lib
> +
> +ALSACAP_AUTORECONF = YES
> +
> +$(eval $(autotools-package))
> +
> +

These two empty lines are redundant.

Regards,
Jerzy
