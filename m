From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 18:49:45 +0100
Subject: [Buildroot] [PATCH v2 1/2] rt-tests: disable for uclibc mips
In-Reply-To: <20140223171925.GD32759@free.fr> (Yann E. MORIN's message of
 "Sun, 23 Feb 2014 18:19:25 +0100")
References: <1393110449-12710-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20140223171925.GD32759@free.fr>
Message-ID: <874n3ppvly.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Gah! This is not correct Kconfig syntax and breaks:

 >     $ make menuconfig
 >     [...]
 >     package/rt-tests/Config.in:10: syntax error
 >     package/rt-tests/Config.in:9: invalid option
 >     package/rt-tests/Config.in:36: syntax error
 >     package/rt-tests/Config.in:35: invalid option
 >     make[1]: *** [oldconfig] Error 1

 > Peter, can we revert this change until we have a proper fix, please?

Argh, indeed.

 > Ryan, what were you trying to do here? Why can you use something like
 > (variable abbreviated for clarity):

 >     depends on ! ( UCLIBC && ( mips || mipsel || mips64 || mips64el ) )

Sorry, my fault. Ryan's first version wasn't correct, so I suggested
something like the 2nd approach (but never tested it).

-- 
Bye, Peter Korsgaard
