From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 20:55:24 +0200
Subject: [Buildroot] Problems with i686_defconfig
In-Reply-To: <4BC59A02.40804@carallon.com> (Will Wagner's message of "Wed, 14
	Apr 2010 11:33:38 +0100")
References: <4BC59A02.40804@carallon.com>
Message-ID: <87ochleueb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Hello,
 Will> Using latest from git I am trying to build i686_defconfig but I am
 Will> having problems.

 Will> The first annoyance is that the defconfig is so old that you have go
 Will> through selecting the defaults for all the new config
 Will> options. Presumably we should update the defconfigs so they contain
 Will> all the default options already set? If so I'm happy to look at a
 Will> patch.

Yes please.

 Will> Finally the build fails in either gdbserver (if selected) or busybox,
 Will> complaining the symbol usleep is undefined. Anyone seen this before?
 Will> Is it some config problem with uClibc 0.9.31?

Verify that you are using the correct uclibc config - E.G.

BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.31.config"

Otherwise you'll end up with that kind of problems.

-- 
Bye, Peter Korsgaard
