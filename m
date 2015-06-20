From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 20 Jun 2015 18:23:28 +0200
Subject: [Buildroot] [PATCH v7 08/22] busybox: selinux support
In-Reply-To: <1433251718-3167-9-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-9-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <CAHXCMMJkfEGqWFtW02iKWL3KEy7xFU=MLa=trcEkfMaL_WLk3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Clayton,

On Tue, Jun 2, 2015 at 3:28 PM, Clayton Shotwell
<clayton.shotwell@rockwellcollins.com> wrote:
[...]
> diff --git a/package/busybox/Config.in b/package/busybox/Config.in
> index feed560..e345d66 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -41,6 +41,23 @@ comment "Busybox individual binaries depends on dynamic libraries"
>         depends on BR2_STATIC_LIBS
>         depends on BR2_bfin
>
> +config BR2_PACKAGE_BUSYBOX_SELINUX
> +       select BR2_PACKAGE_LIBSELINUX
> +       depends on BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_STATIC_LIBS
> +       bool "Enable SELinux support"
> +       help
> +         Enable SELinux support in BusyBox. Please note that depending on
> +         you BusyBox config and the SELinux policy implementation, you may
s/you BusyBox/your BusyBox/
s/ config / configuration /

> +         want to also enable BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES.
> +
> +         For instance, if your BusyBox configuration only uses a couple of
> +         minor BusyBox features, such as simple command line utilities, the
> +         symlinked version of BusyBox can be used to save space. If BusyBox
> +         provides more features, such as crond, then individual binaries
> +         have to be enabled for the SELinux type transitions to occur properly.
> +
> +
nitpicking: one blank line is enough... ;-)

Otherwise, it looks good.

Regards,

-- 
Samuel
