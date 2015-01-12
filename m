From: Peter Spierenburg <peter.spierenburg@nautel.com>
Date: Mon, 12 Jan 2015 20:35:50 +0000
Subject: [Buildroot] Building for blackfin-bf609
Message-ID: <1421094949987.30667@nautel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,


I am trying to use buildroot for a blackfin bf609 processor. My steps are as follows:


- Starting from buildroot-2014.11

- make menuconfig

- Target Architecture set to Blackfin (the default Target CPU is bf609 which is serendipitous)

- Linux Kernel

- Default Kernel version is 3.17.4 which is fine

- Set Defconfig name to BF609-EZKIT

- Exit and save

- make


After a few minutes of furious downloading and compiling, I get:


cc1: error: -mcpu=bf609-0.0 is not valid
cc1: error: unrecognized command line option "-mcpu=bf609-0.0"
make[2]: *** [kernel/bounds.s] Error 1
make[1]: *** [prepare0] Error 2
make[1]: *** Waiting for unfinished jobs....
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/devicetable-offsets.s
cc1: error: -mcpu=bf609-0.0 is not valid
cc1: error: unrecognized command line option "-mcpu=bf609-0.0"
make[3]: *** [scripts/mod/empty.o] Error 1
make[3]: *** Waiting for unfinished jobs....
cc1: error: -mcpu=bf609-0.0 is not valid
cc1: error: unrecognized command line option "-mcpu=bf609-0.0"
make[3]: *** [scripts/mod/devicetable-offsets.s] Error 1
make[2]: *** [scripts/mod] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [scripts] Error 2
make[1]: Leaving directory `/home/peter/buildroot/buildroot-2014.11/output/build/linux-3.17.4'
make: *** [/home/peter/buildroot/buildroot-2014.11/output/build/linux-3.17.4/.stamp_built] Error 2

What am I doing wrong?

Peter.


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150112/622b2407/attachment.html>
