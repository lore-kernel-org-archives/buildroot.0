From: Mitch Davis <mjd+buildroot@afork.com>
Date: Thu, 5 Aug 2010 23:57:21 +1000
Subject: [Buildroot] [PATCH]: Added splashy package.
In-Reply-To: <AANLkTikCiu-MEJcq7O-4zCY6ADvPuAaX3AuhBuE-6ucA@mail.gmail.com>
References: <AANLkTikCiu-MEJcq7O-4zCY6ADvPuAaX3AuhBuE-6ucA@mail.gmail.com>
Message-ID: <AANLkTinHcA5iZ3c-ytGU=vpPkQy3NKH-22m_vfPJZYP5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 5, 2010 at 11:35 PM, Belisko Marek <marek.belisko@gmail.com> wrote:
> Splashy is a next generation boot splashing system for Unix-like systems.

Nice.

> ?package/file/file.mk ? ? ? | ? ?6 ++++++

> diff --git a/package/file/file.mk b/package/file/file.mk
> index b8281d0..e998be9 100644
> --- a/package/file/file.mk
> +++ b/package/file/file.mk
> @@ -7,8 +7,14 @@
> ?FILE_VERSION = 5.04
> ?FILE_SITE = ftp://ftp.astron.com/pub/file/
> ?FILE_DEPENDENCIES = host-file zlib
> +FILE_INSTALL_STAGING = YES
> ?HOST_FILE_DEPENDENCIES = host-zlib
>
> +define FILE_INSTALL_STAGING_CMDS
> + ? ? ? $(INSTALL) -D $(@D)/src/.libs/libmagic.a $(STAGING_DIR)/usr/lib/libmagic.a
> + ? ? ? $(INSTALL) -D $(@D)/src/magic.h $(STAGING_DIR)/usr/include/magic.h
> +endef
> +
> ?define FILE_UNINSTALL_TARGET_CMDS
> ? ? ? ?$(MAKE) DESTDIR=$(TARGET_DIR) uninstall -C $(FILE_DIR)
> ? ? ? ?rm -f $(TARGET_DIR)/usr/lib/libmagic.*

Can you tell us about these changes too?  Are they part of/needed for
the splashy package?

Mitch.
