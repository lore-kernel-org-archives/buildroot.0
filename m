From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Sep 2010 21:54:52 +0200
Subject: [Buildroot] [PATCH 20/21] BugFix - Bison - Fixed Missing
 stddef.h Include In wchar.h
In-Reply-To: <1284435648-15238-20-git-send-email-Martin.Banky@gmail.com>
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
	<1284435648-15238-20-git-send-email-Martin.Banky@gmail.com>
Message-ID: <20100914215452.1828fbc2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Martin,

Thanks for your patchset !

On Mon, 13 Sep 2010 20:40:47 -0700
Martin Banky <martin.banky@gmail.com> wrote:

> +BISON_DIR:=$(BUILD_DIR)/bison-$(BISON_VERSION)

This is not needed and shouldn't be there.

>  define BISON_DISABLE_EXAMPLES
>  	echo 'all install:' > $(@D)/examples/Makefile
>  endef
>  
> +define BISON_NO_WCHAR_SUPPORT
> +	toolchain/patch-kernel.sh $(BISON_DIR) package/bison/bison-no-wchar/ \*.patch
> +endef
> +
> +ifneq ($(BR2_USE_WCHAR),y)
> +BISON_POST_CONFIGURE_HOOKS += BISON_NO_WCHAR_SUPPORT
> +endif

Personally, I'd prefer not to have patches applied conditionally. It's
the patch itself that should do the right thing depending on whether
wchar support is available or not, so that the patch can eventually be
sent to the upstream project.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
