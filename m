From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 22:47:56 +0200
Subject: [Buildroot] [PATCH] systemd: fix license according to README
 file
In-Reply-To: <1435696938-19587-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1435696938-19587-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150630224756.47788250@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente,

On Tue, 30 Jun 2015 22:42:18 +0200, Vicente Olivert Riera wrote:

> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index ee17bc8..7094b98 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -7,8 +7,8 @@
>  SYSTEMD_VERSION = 221
>  SYSTEMD_SITE = http://www.freedesktop.org/software/systemd
>  SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
> -SYSTEMD_LICENSE = LGPLv2.1+; GPLv2+ for udev; MIT-like license for few source files listed in README
> -SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 LICENSE.MIT
> +SYSTEMD_LICENSE = LGPLv2.1+; GPLv2 and GPLv2+ for udev; Public Domain license for few source files listed in README

Why specify both GPLv2 and GPLv2+ for udev?

Also, this string really doesn't look like what we usually do, it
should rather be:

	LGPLv2.1+, GPLv2+ (udev), Public Domain (few source files, see README)

and since the README is important to licensing apparently, it should be mentioned in:

> +SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
