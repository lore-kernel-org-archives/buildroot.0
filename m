From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jan 2014 16:03:34 +0100
Subject: [Buildroot] [PATCH v3] Add gpm (general purpose mouse) server
 package
In-Reply-To: <1391000525-5179-1-git-send-email-julien.boibessot@free.fr>
References: <1391000525-5179-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20140129160334.0c50847b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

On Wed, 29 Jan 2014 14:02:05 +0100, julien.boibessot at free.fr wrote:

> diff --git a/package/gpm/Config.in b/package/gpm/Config.in
> new file mode 100644
> index 0000000..d20e392
> --- /dev/null
> +++ b/package/gpm/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_GPM
> +	bool "gpm mouse server"

I believe we normally don't describe what the component is in its short
description. It should just be the name, i.e "gpm", unless the name of
the project is really "gpm mouse server".

> +config BR2_PACKAGE_GPM_INSTALL_TEST_TOOLS
> +	bool "install gpm test tools also"

Why do we have "also" here ? This should probably just be:

	bool "install test tools"

there is no need to repeat "gpm", because this option is automatically
shown "under" the gpm option.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
