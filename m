From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Feb 2014 21:36:01 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-23
In-Reply-To: <CAAXf6LVNCe6OeGpe8sngvwErdQPgfbFfHg8f2mxmZBPqajL8AQ@mail.gmail.com>
References: <20140224073008.3ECD8100F60@stock.ovh.net>
 <CAAXf6LVNCe6OeGpe8sngvwErdQPgfbFfHg8f2mxmZBPqajL8AQ@mail.gmail.com>
Message-ID: <20140224213601.6c287457@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 24 Feb 2014 09:38:33 +0100, Thomas De Schampheleire wrote:

> > tvheadend-c7d0335eb10d02b78... | 1
> 
> Too old kernel headers (SYS_TURBO), patch available:
> http://patchwork.ozlabs.org/patch/323403/

I will add an exception to the autobuilder script for now. I'll remove
it once the kernel headers series from Yann lands into next, and next
is merged in master.

> >                      php-5.5.8 | 1
>        sh4 |                      php-5.5.8 | NOK |
> http://autobuild.buildroot.net/results/3644fc595370b8c13b17ccb6ab1ea7fe8f66c219/
> 
> php needs mmu:
> 
> checking for fork... no
> configure: error: pcntl: fork() not supported by this platform
> make: *** [/home/test/test/1/output/build/php-5.5.8/.stamp_configured] Error 1

Except that sh4 is an architecture that has an MMU. So adding a
"depends on BR2_USE_MMU" is not the right thing to do here, the problem
is elsewhere.

> >          qt5connectivity-5.2.0 | 1
>    powerpc |          qt5connectivity-5.2.0 | NOK |
> http://autobuild.buildroot.net/results/c54dc99425fb2eee5cfed4af6e72b4f7b07cb32d/
> 
> cd scanner/ && ( test -e Makefile ||
> /home/test/test/2/output/host/usr/bin/qmake
> /home/test/test/2/output/build/qt5connectivity-5.2.0/examples/bluetooth/scanner/scanner.pro
> -o Makefile ) && /usr/bin/make -f Makefile
> Project ERROR: Unknown module(s) in QT: quick

Maybe Fatih could look into this?

> >               wireshark-1.10.5 | 1
>     xtensa |               wireshark-1.10.5 | NOK |
> http://autobuild.buildroot.net/results/3bbba270745d96a08ff6eb98f9f3d39ca3a3ea9e/
> 
> {standard input}:119517: Error: operand 1 of 'j' has out of range
> value '4294825646'
> {standard input}:119521: Error: operand 1 of 'j' has out of range
> value '4294828543'
> {standard input}:119525: Error: operand 1 of 'j' has out of range
> value '4294829836'
> {standard input}:119529: Error: operand 1 of 'j' has out of range
> value '4294830953'
> {standard input}:119533: Error: operand 1 of 'j' has out of range
> value '4294832702'
> {standard input}:119537: Error: operand 1 of 'j' has out of range
> value '4294834399'
> {standard input}:119541: Error: operand 1 of 'j' has out of range
> value '4294835783'

Compiler problem. Should we disable wireshark for now?

> >                  cairo-1.12.10 | 1
>        arm |                  cairo-1.12.10 | NOK |
> http://autobuild.buildroot.net/results/35e2435769ce4b1fc7480f03d26beaf9abbd5986/
> 
>   CC     cairo-gl-device.lo
> In file included from cairo-gl-composite.c:48:0:
> cairo-gl-private.h:255:8: error: unknown type name 'GLchar'
>         const GLchar** string, const GLint* length);

Don't know :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
