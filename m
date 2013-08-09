From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Aug 2013 22:30:33 +0200
Subject: [Buildroot] [PATCH 3/3] ltrace: Fix "strndup not declared"
 build failure on powerpc/uclibc
In-Reply-To: <CAAXf6LVxFHWaLChhMAROEhBzNpcy1rg0N882CADwwW3oMHe5mQ@mail.gmail.com>
References: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
 <1376041019-26688-4-git-send-email-jezz@sysmic.org>
 <20130809122906.052d226a@skate>
 <CAAXf6LVxFHWaLChhMAROEhBzNpcy1rg0N882CADwwW3oMHe5mQ@mail.gmail.com>
Message-ID: <20130809223033.55b19b09@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 9 Aug 2013 13:05:53 +0200, Thomas De Schampheleire wrote:

> > Shouldn't this be globally defined by adding a -D_GNU_SOURCE to the
> > CFLAGS at the package level?
> 
> When you say 'package level' you mean in ltrace.mk in buildroot?

Yes, that's what I meant, but I agree that I might have been wrong.

> In this case I don't think it's correct: ltrace itself is responsible
> for including the right header files, and setting the right macros, so
> that any used interface is available. Hence, I consider it a patch to
> ltrace (that should be upstreamed), not something we should fix in
> buildroot itself.

Hum, yes, you're right.

J?r?me, sorry then, your original patch was OK. Just add your
Signed-off-by on it.

Can you resend your small patch series with the various minor comments
addressed?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
