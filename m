From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Sep 2007 22:58:33 +0200
Subject: [Buildroot] Kernel Download Error with external toolchain
In-Reply-To: <1191012546.6616.15.camel@venture.bit63.org>
References: <1190985506.17683.6.camel@venture.bit63.org>
	<20070928180849.GQ20951@aon.at>
	<1191006117.5322.225.camel@elrond.atmel.sweden>
	<20070928191632.GT20951@aon.at>
	<1191012546.6616.15.camel@venture.bit63.org>
Message-ID: <20070928205833.GA20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 28, 2007 at 04:49:06PM -0400, Clark Rawlins wrote:
>On Fri, 2007-09-28 at 21:16 +0200, Bernhard Fischer wrote:
>> On Fri, Sep 28, 2007 at 09:01:57PM +0200, Ulf Samuelsson wrote:
>> >fre 2007-09-28 klockan 20:08 +0200 skrev Bernhard Fischer:
>> >> On Fri, Sep 28, 2007 at 09:18:26AM -0400, Clark Rawlins wrote:
>> >> >When attempting to build a fairly simple config including a kernel using
>> >> >an external toolchain I am getting the following error:
>> >> >
>> >> >http://www.kernel.org/pub/linux/kernel/v2.6//linux-...tar.bz2
>> 
>> >Give time to do development, without beeing to intrusive.
>> >
>> >Been tied down with other stuff so It has not gotten
>> >the attention it deserved.
>> 
>> np. It wouldn't have really helped either way without a little love..
>> Compiling a kernel with his external toolchain and setting the
>> INST_MOD_PATH properly shouldn't be that hard.
>
>True, It is easy enough, I just hopped (based on the configuration
>options) that this was supported.
>
>Here is the patch I am using to accomplish this.  It seems like it may
>be a bit of a hack, but I couldn't see a better way to do it without
>really diving in, so I am open to suggestions.

Well, it shouldn't be depending on the external stuff.
There should be a knob that is settable in Config to set if
kernel-headers-version == kernel-src-version (for TOOLCHAIN_SOURCE)
or not. If not or if TOOLCHAIN_EXTERNAL then use the given kernel-src-version
for building the kernel, keep using the kernel-headers-version for
headers-install (including unpacking, patching, etc. Both will need
this if kernel-headers-version != kernel-src-version, of course).

I'm just using the == case, so help with the other case is welcome
(including non-2.6 kernel-src, as some will most likely demand..)

cheers and TIA,
