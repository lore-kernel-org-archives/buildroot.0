From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 13:18:02 +0200
Subject: [Buildroot] [PATCH] ntp: Adding support for SHM clocks
In-Reply-To: <1468530482-58311-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1468530482-58311-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20160715131802.3cd75547@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Jul 2016 16:08:02 -0500, Matt Weber wrote:
> From: ynadupur <yugendra.sai.babu.nadupuru@rockwellcollins.com>

This From: was obviously not properly formatted, as we want a full name.

> Description:

No need for "Description:" in the commit log.

> 
>     In order for gpsd to work with the new version of ntpd, an enable option
>     must be added to the configure step of ntp that allows for support of
>     SHM Clocks to be attached through shared memory.

The commit log shouldn't be indented.

> 
> Signed-off-by:[YUGENDRA SAI BABU NADUPURU]<yugendra.sai.babu.nadupuru@rockwellcollins.com>

This was also not properly formatted.

> +config BR2_PACKAGE_NTP_NTP_SHM_CLK
> +	bool "SHM clock support"
> +	help
> +	 Compile ntp with support for a SHM clock attached through shared
> +	 memory.

Indentation for the help text is one tab + two spaces, not one tab +
one space.

> +ifeq ($(BR2_PACKAGE_NTP_NTP_SHM_CLK),y)
> +	NTP_CONF_OPTS += --enable-SHM

We don't indent such lines.

Committed with all those minor issues fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
