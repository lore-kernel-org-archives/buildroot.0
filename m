From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jul 2014 13:02:52 +0200
Subject: [Buildroot] [PATCH] qt5: Add an option to select default
 platform
In-Reply-To: <1404466571-27586-1-git-send-email-jezz@sysmic.org>
References: <1404466571-27586-1-git-send-email-jezz@sysmic.org>
Message-ID: <20140704130252.004c593d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri,  4 Jul 2014 11:36:11 +0200, J?r?me Pouiller wrote:

> +choice
> +	prompt "default graphical platform"
> +	default BR2_PACKAGE_QT5BASE_DEFAULT_QPA_MINIMAL
> +	help
> +	  Notice you may choose platform at runtime using -platform (-platform
> +	  help to get list of compiled platforms).
> +
> +config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_MINIMAL
> +	bool "minimal"

Maybe some help text would be appropriate here...

> +
> +config BR2_PACKAGE_QT5BASE_DEFAULT_QPA_OFFSCREEN
> +	bool "offscreen"

... and here, to describe what those platforms are.

Are they actually useful in practice? What do they do?

> +QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DEFAULT_QPA_MINIMAL),-qpa minimalb)

is "minimalb" intended here, as opposed to "minimal"?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
