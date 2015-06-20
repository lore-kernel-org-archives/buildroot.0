From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 20 Jun 2015 18:13:18 +0200
Subject: [Buildroot] [PATCH v7 07/22] busybox: applets as individual
	binaries
In-Reply-To: <1433251718-3167-8-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1433251718-3167-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1433251718-3167-8-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <CAHXCMMLjS2-TXnV7qDqzH5shegB4znd-APyZvLMgX-E83h8FTQ@mail.gmail.com>
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
> index 6847a60..feed560 100644
> --- a/package/busybox/Config.in
> +++ b/package/busybox/Config.in
> @@ -32,6 +32,15 @@ config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>           Show packages in menuconfig that are potentially also provided
>           by busybox.
>
> +config BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES
> +       bool "Individual binaries"
> +       depends on !BR2_STATIC_LIBS
> +       depends on !BR2_bfin # libbusybox.so link issue
> +
> +comment "Busybox individual binaries depends on dynamic libraries"
> +       depends on BR2_STATIC_LIBS
> +       depends on BR2_bfin
s/on BR2_bfin/on !BR2_bfin/
(because this is an architecture dependency)

Otherwise, it looks good.

Regards,

-- 
Samuel
