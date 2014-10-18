From: Maarten ter Huurne <maarten@treewalker.org>
Date: Sat, 18 Oct 2014 02:42:45 +0200
Subject: [Buildroot] [PATCH] tinyalsa: new package
In-Reply-To: <20141006211545.025b58c5@free-electrons.com>
References: <1412531488-8849-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20141006211545.025b58c5@free-electrons.com>
Message-ID: <471202899.FpAt3MTFiF@hyperion>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime and Thomas,

> +++ b/package/tinyalsa/tinyalsa.mk
> [snip]
> +       $(INSTALL) -D -m 0644 $(@D)/include/sound/asound.h \
> +                       $(STAGING_DIR)/usr/include/sound/asound.h

This will overwrite the pre-existing (from libc or kernel headers) version 
of <sound/asound.h> with the Android-style stripped version from tinyalsa.
I think it would be better to keep the pre-existing version of this header, 
do you agree?

Bye,
		Maarten
