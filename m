From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Mar 2015 17:56:31 +0100
Subject: [Buildroot] [PATCH] system: add option for standalone telnetd
	on target
In-Reply-To: <1426066527-23021-1-git-send-email-abrodkin@synopsys.com>
References: <1426066527-23021-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150311175631.426a1445@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 11 Mar 2015 12:35:27 +0300, Alexey Brodkin wrote:

> +config BR2_SYSTEM_STANDALONE_TELNETD
> +	bool "Enable telnet daemon on target"
> +	depends on BR2_PACKAGE_BUSYBOX
> +	depends on !BR2_PACKAGE_XINETD

In any case, this should not be a system/Config.in option, but a
Busybox package sub-option.

Or, since your system/Config.in option actually doesn't do anything
about telnetd, it simply configures /etc/securetty, then the option
should be named differently.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
