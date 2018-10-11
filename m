From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 11 Oct 2018 07:48:43 -0500
Subject: [Buildroot] Problem with Raspberry Pi 3B+and BT
In-Reply-To: <CALtfCQa87Q5w-mOL4sKbW8M7wh4qAH3rBRm6A6H41SEaci=3QQ@mail.gmail.com>
References: <CALtfCQa87Q5w-mOL4sKbW8M7wh4qAH3rBRm6A6H41SEaci=3QQ@mail.gmail.com>
Message-ID: <CANQCQpbD_fdXrqYGdW74d4EVyCm4eAs6pxiyasg8wTumYZ+XWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oscar,

On Thu, Oct 11, 2018 at 3:46 AM Oscar Gomez Fuente
<oscargomezf@gmail.com> wrote:
>
> Hi everyone,
>
> I have a problem with the Bluetooth on my raspberry pi 3B+, I have
> installed the following packages:
>
> [*] bluez-tools
> [*] bluez-utils 5.x
> [*]   build OBEX support
> [*]   build CLI client
> [*]   build experimental obexd plugin
> [*]   build health plugin
> [*]   build midi profile
> [*]   build nfc plugin
> [*]   build sap plugin
> [*]   build sixaxis plugin
> [*]   build tests
> [*]   install bdaddr tool
>
> I'm using the raspberry pi for scanning BT devices continuously, using
> this command:
>
> # bt-adapter -a hci0 -d
>
> And everything works fines, but occasionally this command fails and Ii
> doesn't work anymore and I have to reboot my HW. I was taking a look
> at the kernel messages:
>
> [25124.029835] Bluetooth: hci0: Frame reassembly failed (-84)
> [25124.031902] Bluetooth: hci0: Frame reassembly failed (-90)
> [25124.033665] Bluetooth: hci0: Frame reassembly failed (-84)
> [28601.218856] Bluetooth: hci0 advertising data length corrected
> [29425.140974] Bluetooth: hci0: Frame reassembly failed (-84)
> [29427.218670] Bluetooth: Failed to disable LE scan: status 0x1f
> [29427.220413] Bluetooth: hci0 command 0x200c tx timeout
> [29561.841776] Bluetooth: hci0 command 0x200c tx timeout
>

That looks kernel related.  I believe the PI has some GPU firmware
loaded that applies to bluetooth.  I've never tried updating it,
however there are tools out there to update the firmware that's stored
in some non-volatile space on the board.
https://github.com/Hexxeh/rpi-update   # notes here:
https://raspberrypi.stackexchange.com/questions/164/how-do-i-update-software-and-firmware

Another idea would be verifying your power supply is large enough to
accommodate bluetooth.  To check this, If you have other USB devices
attached, unplug a few usb devices, startup and see if bluetooth is
more stable.

Matt
