From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Feb 2018 21:49:07 +0100
Subject: [Buildroot] [PATCH v5] systemd: allow to build with uClibc
 toolchains
In-Reply-To: <20180212201340.GA4165@waldemar-brodkorb.de>
References: <20180212201340.GA4165@waldemar-brodkorb.de>
Message-ID: <20180212214907.62615837@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 21:13:41 +0100, Waldemar Brodkorb wrote:

>  ifeq ($(BR2_PACKAGE_SYSTEMD_RESOLVED),y)
> -SYSTEMD_CONF_OPTS += -Dresolved=true
> +SYSTEMD_CONF_OPTS += -Dresolve=true
>  SYSTEMD_RESOLVED_USER = systemd-resolve -1 systemd-resolve -1 * - - - Network Name Resolution Manager
>  else
> -SYSTEMD_CONF_OPTS += -Dresolved=false
> +SYSTEMD_CONF_OPTS += -Dresolve=false
>  endif

This should be a separate patch, to be applied on the master branch,
while the rest (enabling on uClibc) is for the next branch. Could you
make two separate patches ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
