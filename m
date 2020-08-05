From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:41:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/systemd: support new v246
 options
In-Reply-To: <20200731211847.14911-2-nolange79@gmail.com>
References: <20200731211847.14911-1-nolange79@gmail.com>
 <20200731211847.14911-2-nolange79@gmail.com>
Message-ID: <20200805154113.3c6670bc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jul 2020 23:18:46 +0200
Norbert Lange <nolange79@gmail.com> wrote:

>  config BR2_PACKAGE_SYSTEMD_HIBERNATE
>  	bool "enable hibernation support"
> +	depends on BR2_PACKAGE_SYSTEMD_INITRD

Changed to a "select" to not break backward compatibility and because
this dependency is not necessarily obvious.

Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
