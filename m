From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 21:34:44 +0200
Subject: [Buildroot] [PATCH v2] odroid-scripts: select fbset if selected.
In-Reply-To: <20160726155405.5316-1-daggs@gmx.com>
References: <20160726155405.5316-1-daggs@gmx.com>
Message-ID: <20160726213444.0edaf756@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 18:54:05 +0300, Dagg Stompler wrote:

> diff --git a/package/odroid-scripts/Config.in b/package/odroid-scripts/Config.in
> index 48544b6..73d1c4b 100644
> --- a/package/odroid-scripts/Config.in
> +++ b/package/odroid-scripts/Config.in
> @@ -1,6 +1,8 @@
>  config BR2_PACKAGE_ODROID_SCRIPTS
>  	bool "odroid-scripts"
>  	depends on BR2_aarch64 || BR2_arm
> +	select BR2_PACKAGE_FBSET
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

I've added a comment next to those selects to indicate why they are
present. fbset is a runtime dependency, busybox-show-others is needed
to select fbset.

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
