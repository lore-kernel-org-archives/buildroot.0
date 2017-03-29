From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Mar 2017 18:00:16 +0200
Subject: [Buildroot] [v5] package: add qt5virtualkeyboard
In-Reply-To: <20170329155822.32245-1-gael.portay@savoirfairelinux.com>
References: <20170329155822.32245-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170329180016.12208367@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Mar 2017 11:58:22 -0400, Ga?l PORTAY wrote:

> Changes since v4:
>  - Prefix local variables to avoid potential naming collisions.

You forgot one.


> +QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
> +QT5VIRTUALKEYBOARD_ALL_LAYOUTS = $(findstring all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
> +ifneq ($(strip $(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
> +QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"

QMAKEFLAGS is still not properly prefixed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
