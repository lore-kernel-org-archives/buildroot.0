From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Mar 2016 15:31:48 +0100
Subject: [Buildroot] [rpi-firmware] I can't find the file
	/usr/sbin/vcdbg after compiling
In-Reply-To: <CALtfCQbACh2Odc7ACn6BDObdOCaaeLq-AnrE-RQdMNkE-=0zuQ@mail.gmail.com>
 (=?utf-8?B?IsOTc2NhciBHw7NtZXo=?= Fuente"'s message of "Fri, 11 Mar 2016
 13:59:41 +0100")
References: <CALtfCQbACh2Odc7ACn6BDObdOCaaeLq-AnrE-RQdMNkE-=0zuQ@mail.gmail.com>
Message-ID: <87bn6lhyqz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "?scar" == ?scar G?mez Fuente <oscargomezf@gmail.com> writes:

 > Hi,
 > I'm using the last release buildroot-2016.02 and I'm trying to test some
 > dtb files on my raspberry pi 2 (because It seems to be it doesn't work
 > well) so I'm trying to add the package to debug vcdbg:

 > Target package ---> Hardware handling  ---> Firmware ---> vcdbg

 > The compilation was successful but the file /usr/sbin/vcdbg doesn't exist
 > in the $TARGET_DIR

From package/rpi-firmware/rpi-firmware.mk:

ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_VCDBG),y)
define RPI_FIRMWARE_INSTALL_TARGET_CMDS
        $(INSTALL) -d -m 0700 $(@D)/$(if BR2_ARM_EABIHF,hardfp/)opt/vc/bin/vcdbg \
                $(TARGET_DIR)/usr/sbin/vcdbg
endef
endif # INSTALL_VCDBG

So it should be in usr/sbin. Did you do a clean build (or at least rm
-rf output/build/rpi-firmware-*) when you enabled the VCDBG option?

-- 
Bye, Peter Korsgaard
