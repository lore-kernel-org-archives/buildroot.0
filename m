From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 17:55:41 +0200
Subject: [Buildroot] [PATCH] sshpass: new package
In-Reply-To: <1401575536-18595-1-git-send-email-bisson.gary@gmail.com>
References: <1401575536-18595-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <20140608175541.737152ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Sat, 31 May 2014 15:32:16 -0700, Gary Bisson wrote:
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> ---
>  package/Config.in          |  1 +
>  package/sshpass/Config.in  |  8 ++++++++
>  package/sshpass/sshpass.mk | 12 ++++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 package/sshpass/Config.in
>  create mode 100644 package/sshpass/sshpass.mk

I've applied your patch, after making some minor changes, see below.

> +config BR2_PACKAGE_SSHPASS
> +	bool "sshpass"

Since sshpass uses fork(), I had to add a dependency on BR2_USE_MMU
here.


> diff --git a/package/sshpass/sshpass.mk b/package/sshpass/sshpass.mk
> new file mode 100644
> index 0000000..e851f41
> --- /dev/null
> +++ b/package/sshpass/sshpass.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# sshpass
> +#
> +################################################################################
> +
> +SSHPASS_VERSION = 1.05
> +SSHPASS_SITE = http://downloads.sourceforge.net/project/sshpass/sshpass/$(SSHPASS_VERSION)
> +SSHPASS_LICENSE = GPLv2
> +SSHPASS_LICENSE_FILES = COPYING

The license was in fact GPLv2+.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
