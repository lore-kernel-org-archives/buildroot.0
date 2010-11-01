From: Michael Trimarchi <trimarchimichael@yahoo.it>
Date: Mon, 1 Nov 2010 09:40:30 +0000 (GMT)
Subject: [Buildroot] at91sam9260 alsa problem
Message-ID: <855007.40683.qm@web29601.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

I have compiled the linux kernel (2.6.29) with EABI option disable so the 
expected compiled option is:

-mpcu=apcs-gnu

I have the same compiled option in buildroot and now the amixer and alsamixer 
works but aplay and arecord

report this error:

set_params:  Channels count non available

Compile the kernel using eabi and oabi compatible give different error.

This is the relevant part of buildroot config

BR2_ARM_TYPE="GENERIC_ARM"
# BR2_ARM_EABI is not set
BR2_ARM_OABI=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_ABI="apcs-gnu"

#
# Target options
#

#
# Preset Devices
#
# BR2_TARGET_ARMLTD is not set
BR2_BOARD_NAME="at91sam9260dfc"
BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"

and this is the relevant part of the kernel

# CONFIG_AEABI is not set

With other combination I can use playback and record facilites but the mixer 
doesn't
work for the size of the parameteres during kernel syscall

Best regards
Michael Trimarchi



      
