From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:48:49 +0200
Subject: [Buildroot] [PATCH 1/1] drbd-utils: new package
In-Reply-To: <1426177996-22605-1-git-send-email-cvubrugier@fastmail.fm>
References: <1426177996-22605-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <20150403144849.66253910@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christophe,

On Thu, 12 Mar 2015 17:33:16 +0100, Christophe Vu-Brugier wrote:

> diff --git a/package/drbd-utils/Config.in b/package/drbd-utils/Config.in
> new file mode 100644
> index 0000000..a8a0d34
> --- /dev/null
> +++ b/package/drbd-utils/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_DRBD_UTILS
> +	bool "drbd-utils"
> +	depends on BR2_LARGEFILE
> +	depends on BR2_USE_MMU # needs fork()
> +	help
> +	  DRBD utilities to manage the DRBD kernel module.
> +
> +	  http://oss.linbit.com/drbd/

There should have been a comment about the BR2_LARGEFILE dependency
here. But in the mean time, we entirely removed the BR2_LARGEFILE
option: from now on, we assume all toolchains have largefile support.

So I've simply removed the depends on BR2_LARGEFILE line.

Other than that, applied! Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
