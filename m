From: John Faith <jfaith@impinj.com>
Date: Wed, 7 Aug 2019 18:51:01 +0000
Subject: [Buildroot] [PATCH v3] package/sdbusplus: new package
In-Reply-To: <20190806231028.60b9437e@windsurf.home>
References: <710b4b46-81d6-e5e6-4820-f8e1fb435750@mind.be>
 <20190805225228.16904-1-jfaith@impinj.com>
 <20190806231028.60b9437e@windsurf.home>
Message-ID: <67603421be98554d30a3be9a9cddee2710c565fa.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2019-08-06 at 23:10 +0200, Thomas Petazzoni wrote:
Hello John,

Thanks for this new iteration!

On Mon, 5 Aug 2019 22:52:42 +0000
John Faith <jfaith@impinj.com> wrote:

> +comment "sdbusplus needs systemd and a toolchain w/ C++"

This needs to have:

depends on !BR2_PACKAGE_SYSTEMD || !BR2_INSTALL_LIBSTDCPP

Yes, added.


> +SDBUSPLUS_VERSION = 4212292bcf136d04b38ba5116aa568b0fa312798
> +SDBUSPLUS_SITE = $(call github,openbmc,sdbusplus,$(SDBUSPLUS_VERSION))
> +SDBUSPLUS_DEPENDENCIES = host-autoconf-archive host-pkgconf systemd
> +HOST_SDBUSPLUS_DEPENDENCIES = \
> + host-autoconf-archive \
> + host-pkgconf \
> + $(PKG_PYTHON_HOST_PYTHON) \

I'm not sure to understand where is this variable defined. I don't see
where Buildroot defines it, and "make printvars
VARS=PKG_PYTHON_HOST_PYTHON" doesn't return anything useful. It's
getting late here so perhaps I'm msising the point. Could you enlighten me ?

This variable is part of a local set of changes to use host-python3 or host-python for packages that are not python packages, but need host python. I'll change it to "host-python".



Thanks a lot!

Thomas

I also had to add POST_PATCH_HOOKS to create the m4 dir, which I'll include in the next version.

Thanks for the feedback!
,
John F.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190807/aa31f667/attachment.html>
