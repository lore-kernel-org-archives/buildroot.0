From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Sep 2014 16:23:07 +0200
Subject: [Buildroot] Switching to a two stage gcc build
In-Reply-To: <39A54937CC95F24AA2F794E2D2B66B1356D1E2B5@de02wembxa.internal.synopsys.com>
References: <20140909155004.7bc426d7@free-electrons.com>
 <39A54937CC95F24AA2F794E2D2B66B1356D1E2B5@de02wembxa.internal.synopsys.com>
Message-ID: <20140909162307.173f78f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Tue, 9 Sep 2014 14:09:14 +0000, Anton Kolesov wrote:

> I haven't tried this yet, though I recall similar problems, when I've
> been trying to use our ancient releases of our tools.
> 
> In our own build scripts, we do following for the two stage build:
> 
> 1. Install Linux headers
> 2. Install uClibc headers
> 3. Build stage 1
> 4. Build uClibc and install it
> 5. Build stage 2
> 
> I'm not arguing that this way is definitely better, in fact I'm not
> even the one who invented it, though I've made some changes there.
> This works pretty nice for us. Maybe that could work for Buildroot as
> well?

I don't know, I haven't put too much thought into this. Is it
reasonable for libgcc to depend on the C library? Or maybe the initial
gcc build should ensure to build a libgcc that doesn't depend on the C
library, and then in the final gcc build, it rebuilds a more complete
libgcc ?

> As of issue with assembler error - that means there is a compiler
> error, compiler generated wrong insturction. Let me try to reproduce
> this here and I will send a bugreport to our compiler developer. This
> might take a day or two for him, depending on his workload and
> complexity of this particular issues. I suppose I just need to do a
> default busybox configuration  with master for this error? No need to
> enable any additional features?

That indeed was just the default ARCle toolchain, with default Busybox
configuration. Let me know if you're not able to reproduce, and I'll
try to give more details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
