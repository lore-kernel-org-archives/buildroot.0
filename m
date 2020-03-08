From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 15:17:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: add repart support
In-Reply-To: <20200308091640.65742-1-james.hilliard1@gmail.com>
References: <20200308091640.65742-1-james.hilliard1@gmail.com>
Message-ID: <20200308151759.6e50c0c8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 03:16:40 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> systemd-repart grows and adds partitions to a partition table, based on
> the configuration files described in repart.d.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd/Config.in  | 9 +++++++++
>  package/systemd/systemd.mk | 8 +++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index c727082a1a..64d30f32aa 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -153,6 +153,15 @@ config BR2_PACKAGE_SYSTEMD_BINFMT
>  
>  	  http://www.freedesktop.org/software/systemd/man/systemd-binfmt.service.html
>  
> +config BR2_PACKAGE_SYSTEMD_REPART
> +	bool "enable repart support"
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  systemd-repart grows and adds partitions to a partition table,
> +	  based on the configuration files described in repart.d.
> +
> +	  https://www.freedesktop.org/software/systemd/man/systemd-repart.html

Alphabetic sorting of options was not respected here, so I've moved
this option.

I've also added an explicit select of libfdisk, as suggested by Baruch.
Even though it is implied by the top-level option, making it explicit
doesn't hurt.

Applied to next with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
