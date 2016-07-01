From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 00:17:39 +0200
Subject: [Buildroot] [PATCH 3/3] package/systemd: Remove SYSTEMD_COMPAT
 option
In-Reply-To: <1467409950-9628-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409950-9628-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1467409950-9628-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160702001739.458e8c96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 23:52:30 +0200, Maxime Hadjinlian wrote:
> Since v230 of systemd, the compat libraries have been fully removed.
> https://github.com/systemd/systemd/commit/4de282cf9324ab13d17ac334244d0d7cae2df37d
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  Config.in.legacy             |  7 +++++++
>  package/dbus/Config.in       |  1 -
>  package/liblogging/Config.in |  1 -
>  package/systemd/Config.in    | 13 -------------
>  package/systemd/systemd.mk   |  6 ------
>  5 files changed, 7 insertions(+), 21 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 34bdaf0..ff4deb2 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -369,6 +369,13 @@ config BR2_PACKAGE_SYSTEMD_ALL_EXTRAS
>  	  removed. To get the same features, the libgcrypt and xz
>  	  package should now be enabled.
>  
> +config BR2_PACKAGE_SYSTEMD_COMPAT
> +	bool "systemd compatibility libraries has been removed"
> +	help
> +		The systemd option te enable the compatibility libraries has been
> +		removed. Theses libraries have been useless since a few version, and
> +		have been fully dropped from the source since v230.

Indentation is not good here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
