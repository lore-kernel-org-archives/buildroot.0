From: Mats Jansson <matsmanhav@tele2.se>
Date: Mon, 6 May 2019 16:14:44 +0200
Subject: [Buildroot] Location of external firmware
Message-ID: <509774653.20190506161444@tele2.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have an external firmware to be loaed by a driver. The normal way is
to put the firmware in /lib/firmware. But since it needs to
be loaded during boot and udev is not intitialised at that point I
have found out that I need to build it into the kernel.

I want to put this file in my buildroot-external-tree just like I do
with patches. Any idea on how to do it?
I have tried two different approaches.
1. Creating a patch, but then I get the error message that "git binary diffs are not
supported."
2. setting CONFIG_EXTRA_FIRMWARE_DIR to $(BR2_EXTERNAL)/firmware but I
get the error message "BR2_EXTERNAL: command does not exist"

Anyone have a good idea on how to solve this?

Best regards
Mats                          mailto:matsmanhav at tele2.se
