From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 15:15:17 +0200
Subject: [Buildroot] [PATCH v12 01/32] toolchain: add option to copy the
 gconv libraries
In-Reply-To: <1402144292-27837-2-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
 <1402144292-27837-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140608151517.55e59312@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Yann,

On Sat,  7 Jun 2014 14:31:01 +0200, Bernd Kuhls wrote:

> +config BR2_COPY_GCONV_LIBS
> +	bool "copy gconv libs"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC

A few comments about this patch:

 - I dislike the name of the option. Maybe it should be
   BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY or something like that.

 - There should be a sub-option or something to copy only a subset of
   the gconv library, with a sane, default set of gconv libraries.
   Maybe with a choice "copy all" / "copy a selection".

 - Packages that needs gconv libraries should select this option.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
