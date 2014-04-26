From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 26 Apr 2014 21:52:26 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-18
References: <20140419063009.6CB4810148A@stock.ovh.net>
 <20140419090850.339ca98f@skate>
 <22et2bxh5o.ln2@ID-313208.user.individual.net>
Message-ID: <qcft2bxqc.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <berndkuhls@hotmail.com> wrote in
news:22et2bxh5o.ln2 at ID-313208.user.individual.net: 

> Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com>
> wrote in news:20140419090850.339ca98f at skate: 
> 
>>>      nios2 |                 minidlna-1.1.2 | NOK |
>>>      http://autobuild.buildroot.net/results/1948b8998a8795436990178b669
>>>      1 a690327c67aa/ 
>> 
>> Not sure who can take care of this.
>> 
>> checking for avformat_open_input in -lavformat... no
>> configure: error: Could not find libavformat - part of ffmpeg
>> make: ***
>> [/home/test/test/3/output/build/minidlna-1.1.2/.stamp_configured] Error
>> 1 
> 
> Hi,
> 
> although I do not have any experience with nios2 I will try to take care
> of this build error.
> 
> Regards, Bernd
> 

Hi,

it seems we hit the _gp linker bug again which Peter planned to 
investigate: http://patchwork.ozlabs.org/patch/312275/

Here is the minidlna/config.log snippet regarding the current autobuild 
error. Sorry, no solution from me this time.

configure:9318: checking for avformat_open_input in -lavformat
configure:9343: /home/buildroot/output/host/usr/bin/nios2-linux-gnu-gcc -o 
conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
  -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=
64  conftest.c -lavformat   >&5
/home/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-
gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: /home/buildroot/out
put/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined 
reference to symbol '_gp'
/home/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-
gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: note: '_gp' is defined in DSO
 /home/buildroot/output/host/usr/nios2-buildroot-linux-
gnu/sysroot/usr/lib/libvorbisenc.so.2 so try adding it to the linker 
command line
/home/buildroot/output/host/usr/nios2-buildroot-linux-
gnu/sysroot/usr/lib/libvorbisenc.so.2: could not read symbols: Invalid 
operation

Regards, Bernd
