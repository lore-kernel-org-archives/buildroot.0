From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 19:30:39 +0200
Subject: [Buildroot] [PATCH v5] core/pkg-kconfig: Use olddefconfig when
	available
In-Reply-To: <1461078434-29991-1-git-send-email-romain.izard.pro@gmail.com>
References: <1461078434-29991-1-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <20160419193039.043982f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 17:07:14 +0200, Romain Izard wrote:

> +$(2)_KCONFIG_RULES = \
> +	$$(shell $$($(2)_KCONFIG_MAKE) -pn config 2>/dev/null | \
> +		sed 's/^\([_0-9a-zA-Z]*config:\).*/\1/ p; d')

Does this actually work? Does this gets expanded/evaluated *before* the
package source code is extracted?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
