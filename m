From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 23:20:35 +0100
Subject: [Buildroot] [PATCH 1/3] ccache: change compilercheck to use
	compiler and toolchain info
In-Reply-To: <528D33E5.2080004@mind.be> (Arnout Vandecappelle's message of
 "Wed, 20 Nov 2013 23:12:53 +0100")
References: <1383188064-2380-1-git-send-email-danomimanchego123@gmail.com>
 <1383188064-2380-2-git-send-email-danomimanchego123@gmail.com>
 <528D33E5.2080004@mind.be>
Message-ID: <87a9goxj64.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

[Nice overview snipped]

 >  One more option is to always generate a wrapper, also for the
 > internal toolchain. That one can set CCACHE_EXTRAFILES to a file that
 > contains the toolchain options, and set CCACHE_COMPILERCHECK to
 > none. The external toolchain wrapper could similarly be extended to
 > call ccache instead of the compiler - and then it can just use
 > mtime. And for the host compiler nothing needs to be done, it can just
 > default to mtime.

I'm starting to think this is the best approach, yes.

-- 
Bye, Peter Korsgaard
