From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 23:19:50 +0200
Subject: [Buildroot] [PATCHv2 1/1] board/wandboard: fix perl related
	linux compilation error
In-Reply-To: <5610435E.9030303@mind.be> (Arnout Vandecappelle's message of
 "Sat, 3 Oct 2015 22:06:38 +0100")
References: <1442889921-6713-1-git-send-email-imrehg@gmail.com>
 <20150922154716.0c3fec44@free-electrons.com>
 <87r3lb22jp.fsf@dell.be.48ers.dk> <87fv1r1xwh.fsf@dell.be.48ers.dk>
 <5610435E.9030303@mind.be>
Message-ID: <87y4fjzm2x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  It's with perl 5.22. Should at least be mentioned in the commit log.

 >  This also means that whenever host-perl is built before the kernel, you'll bump
 > into this issue (because host-perl is in the PATH passed to the kernel build).

 >  But so indeed, this is going to be an issue for all kernels, so I'm with Imreh
 > that the solution is to have a simple sed-patch that can be applied to all kernels.

Agreed. From the 5.22 changelog:

defined(@array) and defined(%hash) are now fatal errors

These have been deprecated since v5.6.1 and have raised deprecation
warnings since v5.16.

https://metacpan.org/pod/distribution/perl/pod/perldelta.pod#defined-array-and-defined-hash-are-now-fatal-errors

-- 
Venlig hilsen,
Peter Korsgaard 
