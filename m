From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Sep 2007 23:23:45 +0200
Subject: [Buildroot] Building ARM with Soft-float
In-Reply-To: <1191013693.5322.252.camel@elrond.atmel.sweden>
References: <1190969812.5322.96.camel@elrond.atmel.sweden>
	<1190996888.5322.198.camel@elrond.atmel.sweden>
	<20070928170109.GO20951@aon.at>
	<1191013693.5322.252.camel@elrond.atmel.sweden>
Message-ID: <20070928212345.GB20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 28, 2007 at 11:08:13PM +0200, Ulf Samuelsson wrote:
>fre 2007-09-28 klockan 19:01 +0200 skrev Bernhard Fischer:
>> On Fri, Sep 28, 2007 at 06:28:08PM +0200, Ulf Samuelsson wrote:
>> >fre 2007-09-28 klockan 10:56 +0200 skrev Ulf Samuelsson:
>> >> Tried the Integrator-926ejs default.
>> >> =>	This works:
>> >> 
>> >
>> >Beeing trying the ARM integrator softfloat the whole day.

>> >oabi, instead of eabi, generates a new problem
>> >which was not present a week ago.
>> >The C compiler seems to be built with EABI...

>> >BR2_GNU_TARGET_SUFFIX="uclibc-linux-gnueabi"

>You mean the gcc look at its invocation name to determine
>what it should do.

No notion of the invocation name there.

http://gcc.gnu.org/install/

>Seems stupid to me.

Well, it isn't :P
If you disagree, http://gcc.gnu.org/bugs.html

>What happens if you just call it arm-linux-gcc or even gcc?

You can call it however you like. The drivers follow a somewhat stricter
layout but are hidden from users anyway.
>
>BTW; there are a lot of warning messages about
>calling the tools

I don't understand this.

><arch>-linux-uclibc-<tool>.
>
>Should they not be called <arch>-uclibc-linux-<tool>?

I don't think so. Look at your staging_dir/usr/bin/*
