From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 17:25:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/tripwire: new package
In-Reply-To: <1461677602-29089-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461677602-29089-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160426172557.427988da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Apr 2016 15:33:22 +0200, Bernd Kuhls wrote:

> diff --git a/package/tripwire/0001-disable-install-data-hook.patch b/package/tripwire/0001-disable-install-data-hook.patch
> new file mode 100644
> index 0000000..40d1da5
> --- /dev/null
> +++ b/package/tripwire/0001-disable-install-data-hook.patch
> @@ -0,0 +1,26 @@
> +Prevent running an interactive install script
> +
> +Downloaded from
> +http://repository.timesys.com/buildsources/t/tripwire/tripwire-2.4.2.2/tripwire-2.4.2.2-disable-install-data-hook.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Since the project is now hosted on Github that is active (last commit
3 days ago), could you replace this with a Git formatted patch that you
also submit upstream?

> +comment "tripwire needs a toolchain w/ C++, wchar"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_MMU
> +	depends on !BR2_USE_WCHAR

This is not good, as the comment will only be display if C++ *and*
wchar are missing, while we want it to be displayed if C++ *or* wchar
are missing. So it should be:

	depends on BR2_USE_MMU
	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR

Other than that, looks good!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
