From: Remco Poelstra <r.poelstra@vogels.com>
Date: Wed, 14 Feb 2018 15:21:14 +0000
Subject: [Buildroot] Custom package that installs into ${TARGET_DIR}/${O}
Message-ID: <AM3PR02MB312BD4F64980262863DEBBCEFF50@AM3PR02MB312.eurprd02.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to add bluez-alsa as a package. Compiling etc works fine, but at the install phase I get the following error:

bluealsa: installs files in /home/architech/renesas/rza_linux-4.9_bsp/output/buildroot-git/output/target//home/architech/renesas/rza_linux-4.9_bsp/output/buildroot-git/output

Specifically it installs (its modules) into:
/home/architech/renesas/rza_linux-4.9_bsp/output/buildroot-git/output/target/home/architech/renesas/rza_linux-4.9_bsp/output/buildroot-git/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/alsa-lib/

It's a bit strange it installs into the sysroot, as the modules should go into the target.
What do I need to add to make sure it installs the modules properly? My .mk file looks as follows:

BLUEALSA_VERSION = master
BLUEALSA_SITE = git://github.com/Arkq/bluez-alsa.git
BLUEALSA_SITE_METHOD = git
BLUEALSA_SITE_LICENSE = MIT
BLUEALSA_AUTORECONF = YES
BLUEALSA_AUTORECONF_OPTS = --install
BLUEALSA_DEPENDENCIES = alsa-lib bluez5_utils sbc

ifeq ($(BR2_PACKAGE_BLUEALSA_AAC),y)
BLUEALSA_CONF_OPTS += --enable-aac
BLUEALSA_DEPENDENCIES += fdk-aac
endif

$(eval $(autotools-package))

Thanks in advance!

Kind regards,

Remco Poelstra
*Nosig*
