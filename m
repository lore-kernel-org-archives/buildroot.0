From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 12:03:22 +0200
Subject: [Buildroot] [PATCH v7 22/31] package/kodi: add optional support
 for bluez5
In-Reply-To: <20170429083751.19625-23-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <20170429083751.19625-23-bernd.kuhls@t-online.de>
Message-ID: <20170429120322.61ff085f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 10:37:42 +0200, Bernd Kuhls wrote:

> +config BR2_PACKAGE_KODI_BLUEZ
> +	bool "bluetooth"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
> +	depends on !BR2_PACKAGE_BLUEZ_UTILS # bluez5_utils

You forgot to propagate the BR2_TOOLCHAIN_HAS_SYNC_4 dependency from
bluez5_utils, so I've added that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
