From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 11:44:39 +0200
Subject: [Buildroot] [PATCH v2 6/8] package/mpd: enable support for
 libnfs
In-Reply-To: <1413379134-28918-6-git-send-email-jkrause@posteo.de>
References: <1413379134-28918-1-git-send-email-jkrause@posteo.de>
 <1413379134-28918-6-git-send-email-jkrause@posteo.de>
Message-ID: <20141016114439.6e09d052@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed, 15 Oct 2014 15:18:52 +0200, J?rg Krause wrote:

> +ifeq ($(BR2_PACKAGE_MPD_LIBNFS),y)
> +PKG_CONFIG_PATH = "$(STAGING_DIR)/usr/lib/pkgconfig"

This looks wrong, for two reasons:

 *) A package is not allowed to change global variables. Remember that
    the namespace of variables in global, so if one package is changing
    a global variable, this change is visible to all other packages.

 *) $(STAGING_DIR)/usr/lib/pkgconfig is already the default search path
    for our pkg-config, so there should be no need to make this tuning.
    Which problem have you seen?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
