From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Feb 2013 17:39:00 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-02-23
In-Reply-To: <201302241638.19487.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 24 Feb 2013 16:38:19 +0100")
References: <20130224073422.A0E2C43043B@lolut.humanoidz.org>
 <201302241638.19487.yann.morin.1998@free.fr>
Message-ID: <87bob9bra3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 Yann> I'm not sure how to solve that one:

 Yann> CC		build.linux/src/v4l.o
 Yann> /home/test/test/output1/build/tvheadend-v3.3/src/v4l.c: In function
 Yann> 'v4l_adapter_check':
 Yann> /home/test/test/output1/build/tvheadend-v3.3/src/v4l.c:465:5: error: format
 Yann> '%llx' expects argument of type 'long long unsigned int', but argument 6 has
 Yann> type 'v4l2_std_id' [-Werror=format]

 Yann> (twice the same error).

 Yann> But:
 Yann>   - "long long unsigned int" is 64-bit wide, unsigned
 Yann>   - "v4l2_std_id" is a "__u64", so is 64-bit wide, unsigned
 Yann>   - it's only used for logging to stderr

 Yann> I'm not very happy with disabling -Werror, so I was thinking
 Yann> about casting the value to hush gcc.

Why not? Software should imho not use -Werror in release builds (it can
be very interesting during development though).

We already disable it for a number of other packages (cifs-utils,
classpath, ipsec-tools, libroxml, bellagio, synergy).

 Yann> What's so special about mips64el that it does not like v4l2_std_id as an
 Yann> unsigned 64-bit value (I've checked the headers, it is an __u64).

Sorry, don't know.

-- 
Bye, Peter Korsgaard
