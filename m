From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 11 Oct 2018 10:45:39 +0200
Subject: [Buildroot] Problem with Raspberry Pi 3B+and BT
Message-ID: <CALtfCQa87Q5w-mOL4sKbW8M7wh4qAH3rBRm6A6H41SEaci=3QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I have a problem with the Bluetooth on my raspberry pi 3B+, I have
installed the following packages:

[*] bluez-tools
[*] bluez-utils 5.x
[*]   build OBEX support
[*]   build CLI client
[*]   build experimental obexd plugin
[*]   build health plugin
[*]   build midi profile
[*]   build nfc plugin
[*]   build sap plugin
[*]   build sixaxis plugin
[*]   build tests
[*]   install bdaddr tool

I'm using the raspberry pi for scanning BT devices continuously, using
this command:

# bt-adapter -a hci0 -d

And everything works fines, but occasionally this command fails and Ii
doesn't work anymore and I have to reboot my HW. I was taking a look
at the kernel messages:

[25124.029835] Bluetooth: hci0: Frame reassembly failed (-84)
[25124.031902] Bluetooth: hci0: Frame reassembly failed (-90)
[25124.033665] Bluetooth: hci0: Frame reassembly failed (-84)
[28601.218856] Bluetooth: hci0 advertising data length corrected
[29425.140974] Bluetooth: hci0: Frame reassembly failed (-84)
[29427.218670] Bluetooth: Failed to disable LE scan: status 0x1f
[29427.220413] Bluetooth: hci0 command 0x200c tx timeout
[29561.841776] Bluetooth: hci0 command 0x200c tx timeout

Does anyone if it is a problem related to the driver (kernel level) or
something related to the package  bluez-utils 5.x?

Best regards.

Oscar Gomez Fuente
TST Sistemas
www.tst.sistemas.es
