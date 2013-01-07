From: Floris Bos <bos@je-eigen-domein.nl>
Date: Tue, 08 Jan 2013 00:30:15 +0100
Subject: [Buildroot] [git commit] rpi-firmware: New package
In-Reply-To: <CAGduivwPW82QJ20SmF-ki=YydwWgiOWG1jc6LQ41c0qwzP+kLg@mail.gmail.com>
References: <20130106221239.2F44D9A5E5@busybox.osuosl.org>
 <50EB4F1F.7070202@mind.be>
 <CAGduivwPW82QJ20SmF-ki=YydwWgiOWG1jc6LQ41c0qwzP+kLg@mail.gmail.com>
Message-ID: <50EB5A87.906@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/08/2013 12:06 AM, Maxime Hadjinlian wrote:
> On Mon, Jan 7, 2013 at 11:41 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 06/01/13 23:01, Peter Korsgaard wrote:
>>> +RPI_FIRMWARE_LICENSE = BSD-3c
>>> +RPI_FIRMWARE_LICENSE_FILE = boot/LICENCE.broadcom
>>
>>   As Thomas pointed out, this is not BSD-3c but "Broadcom proprietary
>> license".
>>
>>   Maybe it should also get
>>
>> RPI_FIRMWARE_REDISTRIBUTE = NO
>>
> So, even the binary are not free from redistributing ? I'm sorry, I
> lack absolute knowledge in license... I should study this.
> I will patch to add this.

Perhaps also copy the boot/LICENCE.broadcom file to the directory 
holding the boot files?
Right now you are leaving it out.

==
+    $(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin 
$(BINARIES_DIR)/rpi-firmware/bootcode.bin
+    $(INSTALL) -D -m 0644 $(@D)/boot/start.elf 
$(BINARIES_DIR)/rpi-firmware/start.elf
+    $(INSTALL) -D -m 0644 $(@D)/boot/start_cd.elf 
$(BINARIES_DIR)/rpi-firmware/start_cd.elf
+    $(INSTALL) -D -m 0644 $(@D)/boot/fixup.dat 
$(BINARIES_DIR)/rpi-firmware/fixup.dat
+    $(INSTALL) -D -m 0644 $(@D)/boot/fixup_cd.dat 
$(BINARIES_DIR)/rpi-firmware/fixup_cd.dat
==


Yours sincerely,

Floris Bos
