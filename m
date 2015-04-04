From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 17:52:28 +0200
Subject: [Buildroot] [PATCH 1/3] package/procps-ng: if building with
 systemd, enable systemd-specific features
In-Reply-To: <1426715084-24894-1-git-send-email-steven@uplinklabs.net>
References: <1426715084-24894-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20150404175228.791167ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Wed, 18 Mar 2015 14:44:42 -0700, Steven Noonan wrote:
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
>  package/procps-ng/procps-ng.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
> index 71e32dd..1483662 100644
> --- a/package/procps-ng/procps-ng.mk
> +++ b/package/procps-ng/procps-ng.mk
> @@ -24,6 +24,11 @@ PROCPS_NG_DEPENDENCIES += gettext
>  PROCPS_NG_CONF_OPTS += LIBS=-lintl
>  endif
>  
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> +PROCPS_NG_DEPENDENCIES += systemd
> +PROCPS_NG_CONF_OPTS += --with-systemd
> +endif

I've added an 'else' clause to explicitly disable systemd support when
systemd is not available and applied.

I've also applied your patches 2/3 and 3/3 of this series.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
