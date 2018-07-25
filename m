From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 16:36:12 +0200
Subject: [Buildroot] [PATCH] ghostscript: not compiled to use freetype
 lib
In-Reply-To: <1532524091103-0.post@n4.nabble.com>
References: <1532524091103-0.post@n4.nabble.com>
Message-ID: <20180725163612.7ccaef8e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Wed, 25 Jul 2018 08:08:11 -0500 (CDT), Thomas Ehrhardt wrote:
> With this patch ghostscript 9.23 use the freetype lib.

Your patch (and the previous one) lacks a Signed-off-by.

> +ifeq ($(BR2_PACKAGE_FREETYPE),y)
> +GHOSTSCRIPT_DEPENDENCIES += host-freetype

This is most likely incorrect. BR2_PACKAGE_FREETYPE indicates that the
target freetype is available, it has nothing to do with whether
host-freetype should be used or not.

> +HOST_CXXFLAGS += -I$(HOST_DIR)/usr/include/freetype2

This line is incorrect, because it changes the CXXFLAGS globally, for
all packages.

> file package/ghostscript/0002-Fix-shared-lib-freetype.patch

Weird how this is formatted. In any case, all patches should have a
description and Signed-off-by line.

Could you explain what you are trying to achieve ?

> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/

Please send your e-mails to the mailing list directly. If you don't
want to subscribe because of the traffic, then please subscribe and
disable mail delivery in the Mailman preferences. This will allow you
to send e-mails to the list, but you won't receive all the mailing list
traffic.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
