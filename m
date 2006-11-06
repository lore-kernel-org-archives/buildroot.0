From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 6 Nov 2006 08:22:24 +0100
Subject: [Buildroot] Suggestion, move TARGET_DIR
References: <20061105120546.GB14530@zelow.no>
Message-ID: <014601c70176$4b3fa760$c94565d5@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hello again.
> 
> I have always felt that TARGET_DIR was kinda misplaced. build_<ARCH> is
> for the source and staging (well, maybe not even staging).
> 
> so, what about making target_<ARCH> instead? 
> 
> I am working on autonomous packages (choose between making a pcakage a
> part of the root file system or an autonomous tarball) and I am using 
> TARGET_PKG_DIR for that. right now it's build_<ARCH>/packages.
> 
> but target_<ARCH>/root and target_<ARCH>/packages seems more right to me.
> 

If you have, lets say, several ARM targets, it makes sense to have several "root"
which you can rebuild without recompiling each package.

Also it would make sense to be able to generate binary rpm's for each package.

> but foloowing this logic would make us have to sed thorugh the whole
> tree to change TARGET_DIR to TARGET_ROOT_DIR but that ain't exactly
> difficult to do. (I can make a patch for it).
> 
> anyone with anything to say which likes it and will help getting the
> patches in?
> 
> 
> Thomas.
> _______________________________________________


Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT89 C51 Applications Group: mailto:micro.hotline at nto.atmel.com
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
FPSLIC Application Group: mailto:fpslic at atmel.com
Best AVR  link: www.avrfreaks.net
