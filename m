From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 15:18:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: add userdb support
In-Reply-To: <20200308093958.107192-1-james.hilliard1@gmail.com>
References: <20200308093958.107192-1-james.hilliard1@gmail.com>
Message-ID: <20200308151826.7f1771f0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 03:39:58 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> systemd-userdbd is a system service that multiplexes user/group lookups
> to all local services that provide JSON user/group record definitions
> to the system. In addition it synthesizes JSON user/group records from
> classic UNIX/glibc NSS user/group records in order to provide full
> backwards compatibility.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd/Config.in  | 11 +++++++++++
>  package/systemd/systemd.mk |  7 ++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index c727082a1a..051bec5de1 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -233,6 +233,17 @@ config BR2_PACKAGE_SYSTEMD_LOCALED
>  
>  	  http://www.freedesktop.org/software/systemd/man/systemd-localed.service.html
>  
> +config BR2_PACKAGE_SYSTEMD_USERDB
> +	bool "enable userdb daemon"
> +	help
> +	  systemd-userdbd is a system service that multiplexes user/group
> +	  lookups to all local services that provide JSON user/group record
> +	  definitions to the system. In addition it synthesizes JSON
> +	  user/group records from classic UNIX/glibc NSS user/group records
> +	  in order to provide full backwards compatibility.

These lines were too long, check-package complained.

Also, alphabetic ordering of options was not respected here.

I fixed both, and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
