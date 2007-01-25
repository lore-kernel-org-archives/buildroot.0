From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 25 Jan 2007 15:07:03 +0100
Subject: [Buildroot] Target support for Atmel ARM/AVR32
In-Reply-To: <20070125134707.GA17985@aon.at>
References: <20070125090434.GB15747@aon.at>
	<00bd01c7407f$a8c4c300$01c4af0a@atmel.com>
	<20070125134707.GA17985@aon.at>
Message-ID: <20070125140703.GA18175@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 25, 2007 at 02:47:07PM +0100, Bernhard Fischer wrote:
>On Thu, Jan 25, 2007 at 01:42:20PM +0100, Ulf Samuelsson wrote:
>>Bernhard Fischer wrote:
>
>>>If the TODO that is mentioned in r17516 would be fixed, would that
>>>help that problem in any way? I, personally, don't use the concept of
>>>a board in the context of buildroot. Put that aside, what about this
>>>layout:
>>>-) toolchain_<arch>_<subarch>_<cpu>
>>>-) same for build_
>>>-) board_<device> as default COPY_TO
>>>
>>>where
>>>$device is target/device/*
>>>$arch would be generic arch e.g. i386, arm
>>>$subarch is the real -march=
>>>$cpu is the real -mtune=
>>>
>>>Opinions?
>>
>>That is a different problem.
>>I can either build an ARM based buildroot or an AVR32 based buildroot.
>>They will build in: build_arm and build_avr32, same for toolchain.
>>
>>My problem is that I want to build for
>>AT91RM9200DK    -ARM920T
>>AT91RM9200DF     -ARM920T
>>AT91RM9200EK     -ARM920T
>>AT91SAM9260EK  -ARM926EJS
>>AT91SAM9261EK  -ARM926EJS
>>AT91SAM9263EK  -ARM926EJS
>>AT91SAM9XEEK   -ARM926EJS
>>using a common toolchain
>>(The toolchain is generic arm, even though I use different CPU cores)
>>and maybe a common root file system (today it is).
>>
>>This means that
>>* 7 different Linux versions,
>>* 7 different U-boot
>>* 7 different bootstraps.
>>Possibly, the root file system should be populated differently.
>>
>>When I have built a board, I want to have all binaries stored
>>in one place which can be easily compressed into a tarball.
>>
>>Your suggestion is more for building different toolchains for different 
>>boards
>>but this is not the case.
>
>My suggestion is to build two toolchains (assuming that ARM920T !=
>ARM926EJS, if it is the same, then it's only one toolchain) and use that
>to populate the board_{AT91*} dirs

Just to clarify. If your subarch is nil -- i.e. generic $arch -- then
you have only one toolchain in your abovementioned example.
One toolchain, N board_AT91*/{bin,sbin,etc,...}

See?
>>
>>It is a big bonus, If I do not have to recompile the root file system
>>packages, just because I build support for a new board.
>
>What i wrote above did not suggest this.
