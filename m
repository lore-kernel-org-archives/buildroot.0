From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Sep 2007 00:12:16 +0200
Subject: [Buildroot] AVR32  build broken.
In-Reply-To: <1190854406.4933.78.camel@elrond.atmel.sweden>
References: <1190854406.4933.78.camel@elrond.atmel.sweden>
Message-ID: <20070927221216.GF20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 27, 2007 at 02:53:26AM +0200, Ulf Samuelsson wrote:
>The atngw100small also fails with the following error:
>
>configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.
>make[2]: *** [configure-target-libiberty] Fel 1
>make[2]: *** Inv?ntar oavslutade jobb...
>make[1]: *** [all] Fel 2
>
>This is the same error you get when you try to build the ARM with
>softfloat.

I cannot reproduce this. I've double-checked that the sample arm926t
(integrator CP, IIRC) builds and works fine with and without softfloat
(after deleting that wrong uClibc-0.9.29-soft-fp.patch, of course).

Can you reproduce this error with the provided defconfig in
target/device/ARM/integrator_whatever ?

>Since the AVR32 does not have an FPU, this is always softfloat.
>
>There is something screwed up with the linking process
>when using the current trunk.

We'll track it down.
>
>Not all libraries are found, so gcc configure
>cannot link and this sets some flags resulting in the error above.
>
>The ARM softfloat patch was trying to overcome the fact
>that libgcc.a is not used/found by the uClibc build.

This is not really an accurate approach i'd say (but i didn't look
closely), but i take it that you're aware of this.

Thanks,
