From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Nov 2011 10:35:07 +0100
Subject: [Buildroot] [PATCH v2] add support for virtual terminal
In-Reply-To: <4EB8DEF6.3020106@visionsystems.de> (Yegor Yefremov's message of
 "Tue, 08 Nov 2011 08:49:10 +0100")
References: <4EB7C53D.4030902@visionsystems.de>
 <87pqh3d0bn.fsf@macbook.be.48ers.dk>
 <4EB8DEF6.3020106@visionsystems.de>
Message-ID: <87lirrc5ys.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 >> I'm not sure I like another option for this - Can't you just use the
 >> existing GENERIC_SERIAL and/or the post-build script for this?

 Yegor> I'd like to have both serial console and virtual one (on tty I
 Yegor> experiment with my program and vie serial console I can do other
 Yegor> administrative tasks. One could use ssh, but this implies having
 Yegor> network connection). Every time I execute make clean or clone BR
 Yegor> I loose my inittab. Earlier versions of inittab had some ttys
 Yegor> predefined, but they were deleted, so I thought, it would be
 Yegor> useful to add this as an option. This way everyone should be
 Yegor> satisfied.

.. until someone wants a getty on tty2 or tty3 or so on. We need to keep
serial config, as different boards have differnt serial port names, but
I would like to keep the configuration options to a minimum, and just
let people use custom inittab / skeleton or add it with the post-build
script for special stuff.

-- 
Bye, Peter Korsgaard
