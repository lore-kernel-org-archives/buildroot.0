From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jun 2015 21:34:19 +0200
Subject: [Buildroot] [PATCH v5 2/3] lutok: new package
In-Reply-To: <1434063093-14906-3-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1434063093-14906-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <1434063093-14906-3-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20150612213419.15566320@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sebastien Bourdelin,

On Thu, 11 Jun 2015 18:51:32 -0400, Sebastien Bourdelin wrote:

> +LUTOK_VERSION = 0.4
> +LUTOK_SITE = https://github.com/jmmv/lutok/releases/download/lutok-$(LUTOK_VERSION)
> +LUTOK_INSTALL_STAGING = YES
> +LUTOK_DEPENDENCIES = host-pkgconf lua
> +LUTOK_CONF_OPTS = --without-doxygen --without-atf

Both the lutok and kyua packages after --without-atf ? Why so ? You add
the atf package as the first patch, and then it isn't used in follow-up
patches ?

> +# liblua uses dlopen when dynamically linked
> +ifneq ($(BR2_STATIC_LIBS),y)

ifeq ($(BR2_STATIC_LIBS),)

maybe?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
