From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 13:23:39 +0200
Subject: [Buildroot] [PATCH] python: firefox host-python dependency
 needs --enable-unicodedata
In-Reply-To: <1345057226-18726-2-git-send-email-stefan.froberg@petroprogram.com>
References: <1345057226-18726-1-git-send-email-stefan.froberg@petroprogram.com>
 <1345057226-18726-2-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <20120821132339.45b28565@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 15 Aug 2012 22:00:26 +0300,
Stefan Froberg <stefan.froberg@petroprogram.com> a ?crit :

> +ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
> +	HOST_PYTHON_CONF_OPT += --disable-unicodedata	
> +else
> +	HOST_PYTHON_CONF_OPT += --enable-unicodedata
> +endif

No, this is not correct. The BR2_PACKAGE_* options are here to
configure the *target* packages. Host packages that are only
dependencies to build target packages do not have kconfig options. So
in this case, the only solution is to simply use --enable-unicodedata
unconditionally to the host-python build.

Can you post an updated patch with this change?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
