From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Nov 2017 20:20:44 +0100
Subject: [Buildroot] [PATCH 3/4] luajit: only available on x86(-64) hosts
In-Reply-To: <0ebec9aa-305f-68cf-6ae6-8ff8781b4346@mind.be> (Arnout
 Vandecappelle's message of "Sun, 5 Nov 2017 16:57:01 +0100")
References: <20171102104520.29257-1-peter@korsgaard.com>
 <20171102104520.29257-4-peter@korsgaard.com>
 <0ebec9aa-305f-68cf-6ae6-8ff8781b4346@mind.be>
Message-ID: <87o9og1qib.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 02-11-17 11:45, Peter Korsgaard wrote:
 >> The -m32 compiler flag is used for 32bit builds and host-luajit has limited
 >> architecture support, so limit to x86(-64) hosts.

 >  I really don't see why this is needed. What we need is that the host and target
 > bitness is the same. On x86_64, we can always do this by compiling with -m32
 > (which is what we do in the .mk file). But I see no reason at all why building
 > for a 32-bit target would not be possible on ARM, MIPS or PowerPC (32-bit).

Correct, I opted for the simplest possible fix as building on !x86
really isn't a very realistic use case.

 >  That said, we can't easily test that and nobody cares anyway, so I've committed
 > with an updated commit message.

Great, thanks!

-- 
Bye, Peter Korsgaard
