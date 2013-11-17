From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Nov 2013 08:37:24 +0100
Subject: [Buildroot] [PATCH] pv: support ccache builds
In-Reply-To: <20131115202856.GA13944@gmail.com> (Andrew Ruder's message of
 "Fri, 15 Nov 2013 14:28:56 -0600")
References: <20131115202856.GA13944@gmail.com>
Message-ID: <87iovrzdfv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Ruder <andrew.ruder@elecsyscorp.com> writes:

 > When using ccache TARGET_CC is something like
 >     ccache gcc

 > This causes problems in the pv build which attempts to
 > override LD because the command ends up being
 >     make [...] LD=/tools/ccache /tools/gcc LDFLAGS="[...]

 > As a result, during the build phase it attempts to build
 > /tools/gcc which succeeds by doing nothing:
 >     make[1]: Nothing to be done for `/tools/gcc'.

 > and during the install phase you get the real build which
 > errors out on the LD error this snippet was attempting to
 > fix:
 >     ld -r -o src/library.o src/library/getopt.o \
 >         src/library/gettext.o
 >     ld: src/library/gettext.o: Relocations in generic ELF \
 >         (EM: 40)
 >     src/library/gettext.o: error adding symbols: File in \
 >         wrong format

 > Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
