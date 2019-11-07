From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Nov 2019 22:09:29 +0100
Subject: [Buildroot] [PATCH] umtprd: Add package
In-Reply-To: <20191107164513.5760-1-paul@crapouillou.net>
References: <20191107164513.5760-1-paul@crapouillou.net>
Message-ID: <20191107220929.2645c47b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Paul,

Some comments in addition to the ones done by Baruch and Yann.

On Thu,  7 Nov 2019 17:45:13 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

>  package/Config.in                             |  1 +
>  ...thread.h-include-in-inc-mtp.h-header.patch | 28 +++++++++++++++++++
>  package/umtprd/Config.in                      |  6 ++++
>  package/umtprd/umtprd.hash                    |  2 ++
>  package/umtprd/umtprd.mk                      | 20 +++++++++++++
>  5 files changed, 57 insertions(+)

You should add an entry in the DEVELOPERS file.


> diff --git a/package/umtprd/umtprd.hash b/package/umtprd/umtprd.hash
> new file mode 100644
> index 0000000000..aa91696613
> --- /dev/null
> +++ b/package/umtprd/umtprd.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256	e1301bdd89170cc2c679446c1cc5873feaacd061bf0ab547fc0a11670bae9163	umtprd-1.0.0.tar.gz

Please add a hash for the license file.

> diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
> new file mode 100644
> index 0000000000..8460f82b7d
> --- /dev/null
> +++ b/package/umtprd/umtprd.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# umtprd
> +#
> +################################################################################
> +
> +UMTPRD_VERSION = 1.0.0
> +UMTPRD_SITE = https://github.com/viveris/uMTP-Responder/archive

It is never clear to me if those URLs are auto-generated tarballs, or
tarballs produced by the project maintainer and uploaded to Github. If
these are auto-generated tarballs, then the "github" macro should be
used instead.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
