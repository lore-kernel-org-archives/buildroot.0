From: GAUTRON, Erwan <erwan.gautron@bertin.fr>
Date: Mon, 11 May 2020 06:25:32 +0000
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: add option to
 disable unwanted features
In-Reply-To: <20200509212416.028e4ac5@windsurf.home>
References: <20200506055919.4219-1-erwan.gautron@bertin.fr>,
 <20200509212416.028e4ac5@windsurf.home>
Message-ID: <PR0P264MB00092DCBBEC5ABCC5051C195F3A10@PR0P264MB0009.FRAP264.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
Thanks for your comments
I will implement them and submit a new patch

Regards/Cordialement,

Erwan
------------------------------------------------------------------------------


De : Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Envoy? : samedi 9 mai 2020 21:24

? : GAUTRON, Erwan <erwan.gautron@bertin.fr>

Cc?: buildroot at buildroot.org <buildroot@buildroot.org>; Matt Weber <matthew.weber@rockwellcollins.com>

Objet : Re: [Buildroot] [PATCH 1/1] package/libopenssl: add option to disable unwanted features

?


Hello Erwan,



On Wed,? 6 May 2020 07:59:19 +0200

Erwan GAUTRON <erwan.gautron@bertin.fr> wrote:



> Openssl implements lot of algorithms that are not required in

> some emdedded devices and cyphers known as weak.

> Secure embedded systems shall disable unused algorithms (and weak algo)

> in order to be certified.

> This patch allows to select algorithms and mecanims to disable

> such as md5

> 

> Signed-off-by: Erwan GAUTRON <erwan.gautron@bertin.fr>



Thanks for your patch!



> +config BR2_PACKAGE_LIBOPENSSL_NO_CHACHA

> +???? bool "openssl no cipher CHACHA"

> +???? help

> +?????? Remove CHACHA cipher in libopenssl.



I think it is quite odd to have inverted boolean options, i.e that

disable a feature when the option is enabled. Could we turn them

around, so that they use positive logic ? Of course, that means adding

a "default y" to keep backward compatibility, unless we decide that all

those ciphers are really dangerous (many of them are!) and disable them

by default.



> +config BR2_PACKAGE_LIBOPENSSL_NO_COMP

> +???? bool "openssl no compression"

> +???? help

> +?????? Remove compression in libopenssl.

> +

> +config BR2_PACKAGE_LIBOPENSSL_NO_ZLIB

> +???? bool "zlib no compression"

> +???? help

> +?????? Remove zlib in libopenssl.



Do these options allow to drop the zlib dependency of libopenssl ? If

so, we should do this and make the zlib dependency optional.



Thanks!



Thomas

-- 

Thomas Petazzoni, CTO, Bootlin

Embedded Linux and Kernel engineering

https://bootlin.com
