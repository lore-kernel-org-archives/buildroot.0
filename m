From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 21 Jan 2008 23:20:56 +0100
Subject: [Buildroot] More newb questions
References: <1CD05B980C94AC408B37C82BBABAA3E609BFD4EE@mtsexchange.dc.multitech.prv>
Message-ID: <030f01c85c89$b3e08590$040514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Is it possible to used menuconfig to edit a linux config file for an Arm
> target?  Or do I have to edit the config file by hand? Whenever I try to
> do this, it defaults to an arch/I386/Kconfig and I get a bunch of
> non-existent parameters.

No,  It is porbably best to enter the linux directory and do 
$ make ARCH=<arch> xconfig

Once you have done that, you can go back to the buildroot top directory and do 

$ make saveconfig
The result will be stored in "local"

 
> I still can't figure out why a -rt9 keeps getting appended to the
> 2.6.22.1 directory name created in the lib/modules directory. My
> buildroot keeps failing because there is no 2.6.22.1 directory to put
> modules in. Should I not be using a real-time kernel? Or is this some
> kind of buildroot bug??

Check if you are adding real time patches (defined in the kernel headers section of menuconfig)

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
