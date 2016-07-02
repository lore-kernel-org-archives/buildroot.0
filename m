From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:51:50 +0200
Subject: [Buildroot] [PATCH 6/9] package/systemd: Remove SYSTEMD_COMPAT
 option
In-Reply-To: <1467467955-14609-6-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1467467955-14609-6-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160702165150.67de2fd4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 15:59:12 +0200, Maxime Hadjinlian wrote:
> Since v230 of systemd, the compat libraries have been fully removed.
> https://github.com/systemd/systemd/commit/4de282cf9324ab13d17ac334244d0d7cae2df37d
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> v1 -> v2:
>     - Fix indent
> ---
>  Config.in.legacy             |  7 +++++++
>  package/dbus/Config.in       |  1 -
>  package/liblogging/Config.in |  1 -
>  package/systemd/Config.in    | 13 -------------
>  package/systemd/systemd.mk   |  6 ------
>  5 files changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 34bdaf0..70f6e0a 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -369,6 +369,13 @@ config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
>  	  removed. To get the same features, the libgcrypt and xz
>  	  package should now be enabled.
>  
> +config BR2_PACKAGE_SYSTEMD_COMPAT

Options in Config.in.legacy are not sorted alphabetically, but by the
release they were removed from, and then by reverse chronological
order. So I've moved your option around.

> +	bool "systemd compatibility libraries has been removed"

has -> have

> +	help
> +	  The systemd option te enable the compatibility libraries has been
> +	  removed. Theses libraries have been useless since a few version, and
> +	  have been fully dropped from the source since v230.

Too long lines.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
