From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Mar 2016 21:22:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/kbd: fix not installing to the
	target
In-Reply-To: <1457111795-7214-1-git-send-email-martin@barkynet.com>
References: <1457111795-7214-1-git-send-email-martin@barkynet.com>
Message-ID: <20160304212223.63aae6a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Fri,  4 Mar 2016 17:16:35 +0000, Martin Bark wrote:

> -KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
> -
>  $(eval $(autotools-package))
> +
> +KBD_INSTALL_TARGET_OPTS += MKINSTALLDIRS=$(@D)/config/mkinstalldirs

I know this solution is also used in the util-linux package, but in
fact I don't really like it. Can you try using

KBD_MAKE_ENV = \
	MKINSTALLDIRS=...

(before the eval of autotools-package) ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
