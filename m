From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Jul 2013 22:07:34 +0200
Subject: [Buildroot] EABIhf: breaks kernel build
In-Reply-To: <20130719161733.GC3751@free.fr> (Yann E. MORIN's message of "Fri, 
 19 Jul 2013 18:17:33 +0200")
References: <20130719161733.GC3751@free.fr>
Message-ID: <87fvvauxdl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> Thomas, All,
 Yann> Since the ARM EABIhf stuff was committed, the Linux kernel build is
 Yann> broken, and fails with this message:
 Yann>     armv6-rpi36-linux-gnueabi-gcc: error: -mfloat-abi=soft and
 Yann>     -mfloat-abi=hard may not be used together

 Yann> This is because -mfloat-abi=hard is hard-coded in the wrapper, but the
 Yann> kernel wants to pass -msoft-float.

 Yann> See attach exerpt of my build log (with a instrumented ext-ttolchain
 Yann> wrapper). Notice argv[6] and argv[41]:

 Yann>     argv[6]='-mfloat-abi=hard'
 Yann>     argv[41]='-msoft-float'

 Yann> argv[6] is out hard-coded float ABI option, while argv[41] is passed by
 Yann> the kernel.

 Yann> I don't know how to solve this.

 Yann> The trivial and immediate idea would be to have a black-list of
 Yann> arguments and exclude the ones we pass that conflict with the ones
 Yann> passed on the command line, but this will be *very* complex and always
 Yann> incomplete.

Yeah, but I think it's the best solution still.

-- 
Bye, Peter Korsgaard
