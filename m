From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 16:53:02 +0200
Subject: [Buildroot] [PATCH 8/9] systemd-bootchart: New package
In-Reply-To: <1467467955-14609-8-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467467955-14609-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1467467955-14609-8-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20160702165302.5d4bd31a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  2 Jul 2016 15:59:14 +0200, Maxime Hadjinlian wrote:

>  package/Config.in                               |  1 +

You forgot to remove the Config.in.legacy symbol, so I've done that.

> +++ b/package/systemd-bootchart/system-bootchart.hash

The hash file should have be named systemd-bootchart.hash.

> +SYSTEMD_BOOTCHART_VERSION = 230
> +SYSTEMD_BOOTCHART_SOURCE = systemd-bootchart-$(SYSTEMD_BOOTCHART_VERSION).tar.xz
> +# Do not use the github helper here, the generated tarball is *NOT* the same
> +# as the one uploaded by upstream for the release.
> +SYSTEMD_BOOTCHART_SITE = https://github.com/systemd/systemd-bootchart/releases/download/v$(SYSTEMD_BOOTCHART_VERSION)
> +SYSTEMD_BOOTCHART_LICENSE = LGPLv2.1+

LICENSE_FILES was missing.

Applied with those issues fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
