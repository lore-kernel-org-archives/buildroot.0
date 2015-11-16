From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 22:09:44 +0100
Subject: [Buildroot] [PATCH] boost: fix sparc compile
In-Reply-To: <20151116210722.GG19876@waldemar-brodkorb.de>
References: <20151115122455.GA29481@waldemar-brodkorb.de>
 <20151116214000.3f33b341@free-electrons.com>
 <20151116210722.GG19876@waldemar-brodkorb.de>
Message-ID: <20151116220944.54bd039c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Nov 2015 22:07:22 +0100, Waldemar Brodkorb wrote:

> > Is this fixing an actual issue / build failure, or just making the
> > Sparc fix nicer ?
> 
> It makes the sparc fix nicer, no patch required to disable c3 and
> it will use sparcv8 instead sparcv7, which matches more your
> targeting sparc systems.

Ok, so it's more material for next than for master.

> As mentioned in my comment, context/coroutine are not yet supported.
> Will need to do some testing and then I will try to get the fixes to
> enable it upstream.

Ok, no problem. Note that from the Buildroot point of view, enabling
Boost context is not really important. Nothing requires it, so having
it supported only on certain architectures is not a problem. So only do
the sparc support if you have some other interest in it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
