From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 15:37:10 +0200
Subject: [Buildroot] [PATCH 1/2] pigpio: new package
In-Reply-To: <20180928180034.6543-1-grzegorz@blach.pl>
References: <20180928180034.6543-1-grzegorz@blach.pl>
Message-ID: <20181009153710.1b016af2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Sep 2018 20:00:33 +0200, Grzegorz Blach wrote:
> Pigpio is a library for the Raspberry Pi which allows
> control of the General Purpose Input Outputs (GPIO).
> 
> http://abyz.me.uk/rpi/pigpio/
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
>  DEVELOPERS                 |  1 +
>  package/Config.in          |  1 +
>  package/pigpio/Config.in   |  8 ++++++++
>  package/pigpio/pigpio.hash |  3 +++
>  package/pigpio/pigpio.mk   | 25 +++++++++++++++++++++++++
>  5 files changed, 38 insertions(+)
>  create mode 100644 package/pigpio/Config.in
>  create mode 100644 package/pigpio/pigpio.hash
>  create mode 100644 package/pigpio/pigpio.mk

I really wonder how many RaspberryPi-specific libraries/programs to
toggle GPIOs will be needed before people discover the standard Linux
interfaces to manipulate GPIOs.

Anyway, I've applied, with the following changes:

    [Thomas:
     - Use proper SPDX tag for The Unlicense
     - Add missing dependency on !BR2_STATIC_LIBS, since the Makefile is
       unconditionally building a shared library
     - Use BR2_arm instead of BR2_ARM_EABIHF, there's nothing that makes
       it EABIHF specific.
     - Use -D and full destination paths during the installation.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
