From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 11:47:38 +0200
Subject: [Buildroot] [PATCH v2 4/8] package/poppler: bump version to
 0.32.0
In-Reply-To: <1427058772-1105-5-git-send-email-olivier.schonken@gmail.com>
References: <1427058772-1105-1-git-send-email-olivier.schonken@gmail.com>
 <1427058772-1105-5-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20150404114738.0a5d844a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Sun, 22 Mar 2015 23:12:48 +0200, Olivier Schonken wrote:

> -POPPLER_VERSION = 0.24.5
> +POPPLER_VERSION = 0.32.0
>  POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
>  POPPLER_SITE = http://poppler.freedesktop.org
> -POPPLER_DEPENDENCIES = fontconfig
> +POPPLER_DEPENDENCIES = fontconfig openjpeg

openjpeg is not a mandatory dependency, it's an optional one. So I've
changed the patch accordingly.

>  POPPLER_LICENSE = GPLv2+
>  POPPLER_LICENSE_FILES = COPYING
>  POPPLER_INSTALL_STAGING = YES
> -POPPLER_CONF_OPTS = --with-font-configuration=fontconfig
> +POPPLER_CONF_OPTS = 	--with-font-configuration=fontconfig \
> +			--enable-xpdf-headers

There was no justification for adding --enable-xpdf-headers, and it
builds just fine without it. So I've removed it for now. We can always
add it later on with a proper justification.

Applied with this changed!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
