From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 10 Oct 2012 12:07:27 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-10-09
In-Reply-To: <20121010063409.D3FD652C6A6@lolut.humanoidz.org> (Thomas
 Petazzoni's message of "Wed, 10 Oct 2012 08:34:09 +0200 (CEST)")
References: <20121010063409.D3FD652C6A6@lolut.humanoidz.org>
Message-ID: <878vbeabds.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,

 Thomas> Build 6a19968577835a27dd7fe220b317bc9b35762478
 Thomas> ==============================================

 Thomas> Status         : NOK
 Thomas> Failure reason : ccid-1.4.7
 Thomas> Architecture   : i686
 Thomas> Submitted by   : Peter Korsgaard (gcc110)
 Thomas> Submitted at   : 2012-10-09 05:53:44
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=76b38f853d2683854bfedaccb3512fab110c5d49
 Thomas> End of log     : http://autobuild.buildroot.net/results/6a19968577835a27dd7fe220b317bc9b35762478/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/6a19968577835a27dd7fe220b317bc9b35762478/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/6a19968577835a27dd7fe220b317bc9b35762478/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/6a19968577835a27dd7fe220b317bc9b35762478/defconfig

The problem here is that alioth uses a debian (spi-inc.org) signed ssl
certificate. The wget version on my Debian machine doesn't complain as
that CA is known, but non-Debian machines do.

We could either:
- 1: Change download URL to http://
- 2: Hardcode --no-check-certificate wget argument
- 3: Do nothing, as sources.buildroot.net now has a copy

I would prefer option 1. Anybody disagrees?

-- 
Bye, Peter Korsgaard
