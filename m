From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:31:39 +0200
Subject: [Buildroot] [PATCH] package/bluez-alsa: bump to version 2.0.0
In-Reply-To: <20191016095501.3829-1-joerg.krause@embedded.rocks>
References: <20191016095501.3829-1-joerg.krause@embedded.rocks>
Message-ID: <20191016213139.0eddf928@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Oct 2019 11:55:01 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> Add the bluealsa-aplay client application as a config option, as it does
> not use libglib2 anymore (like the server application bluealsa), but libdbus.

I am confused by this statement. Did bluealsa-aplay exist before? Why
was it a problem that it was using libglib2 ?

The current bluez-alsa package anyway already selects libglib2, so what
is the problem ? I am a bit confused.

> Furthermore, bluealsa can be used without bluealsa-aplay.

And?

>  if BR2_PACKAGE_BLUEZ_ALSA
>  
> +config BR2_PACKAGE_BLUEZ_ALSA_APLAY
> +	bool "aplay"
> +	select BR2_PACKAGE_DBUS

The main BR2_PACKAGE_BLUEZ_ALSA option selects bluez5_utils, which
already selects dbus. Is that just for correctness that you added the
select here ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
