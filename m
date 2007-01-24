From: Ulf Samuelsson <ulfs@dof.se>
Date: Wed, 24 Jan 2007 12:06:31 +0100
Subject: [Buildroot] Target support for Atmel ARM/AVR32
Message-ID: <014901c73faa$8e9c8100$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am hoping to add Target support for a number of Atmel Development board,
but before I do that, I would like to discuss how this is done.

Would like to separate building the root file system from other utilities,
since the "build_<arch>" directory is overcrowded.

Currently I am using a "target_build_<arch>" directory.
In this directory, I create a subdirectory for each target_board.

I.E:
buildroot/target_build_arm
        at91rm9200dk
        at91rm9200df
        at91rm9200ek
        at91sam9260ek
        at91sam9261ek
        at91sam9262ek
or 
buildroot/target_build_avr32
        atstk1002

In the target_build_<arch>/<target_board> directory
I download patches for Linux/U-Boot before I apply them
and then build 
* Bootstrap
* U-Boot
* Linux
* Other Utitlties 
in that directory.

The results are renamed to show <target_board> and date.

Would like to move "buildroot/build_<arch>/root" to
"buildroot/target_build_<arch>/<target_board>/root" as well,
but have not yet gotten this to work.
(This will allow me to have different contents for different boards)

At the end, the result is moved to "buildroot/binaries/<target_board>"
so that I have easy way to create a delivery by just compressing
that directory into a tarball.

Does this seem to be a reasonable approach?

Best Regards,
Ulf Samuelsson
ulf at atmel.com
GSM:  +46 (706) 22 44 57
Tel:     +46  (8) 441 54 22
Fax:     +46 (8) 441 54 29
Mail: Box 2033  174 02 Sundbyberg
Visit: Kavalleriv?gen 24
          174 58 Sundbyberg'
Sweden
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070124/edc5a8b4/attachment.html 
