From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 May 2009 16:02:34 +0200
Subject: [Buildroot] Problem with LZO package in ARM configuration,
	need help to solve the problem
In-Reply-To: <49FEF1D5.8020203@free.fr> (Cyril HAENEL's message of "Mon\,
	04 May 2009 15\:47\:01 +0200")
References: <49FEC5F7.9070808@free.fr> <877i0x6r8l.fsf@macbook.be.48ers.dk>
	<49FED95C.5040802@free.fr> <87y6td59d7.fsf@macbook.be.48ers.dk>
	<49FEEB68.30800@free.fr> <87tz4156qv.fsf@macbook.be.48ers.dk>
	<49FEF1D5.8020203@free.fr>
Message-ID: <87my9t55l1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cyril" == Cyril HAENEL <chaenel@free.fr> writes:

 Cyril> The problem was in build_arm directory, thus I think it's the target
 Cyril> compilation which fails when we have an already installed (old) arm
 Cyril> toolchain.

I see from the first mail that you mentioned build_arm/lzo-2.03, so
that's for the target (host would be build_arm/lzo-2.03-host).

I guess the issue is that lzo thinks you have a C++ compiler because
of the old compiler in your path, even though you haven't enabled C++
support in your compilation.

Again, please post your .config

-- 
Bye, Peter Korsgaard
