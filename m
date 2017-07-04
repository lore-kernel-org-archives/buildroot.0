From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 17:43:50 +0200
Subject: [Buildroot] [PATCH] pngquant: doesn't support building with
	ccache
In-Reply-To: <20170703214355.30076-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Mon, 3 Jul 2017 23:43:55 +0200")
References: <20170703214355.30076-1-arnout@mind.be>
Message-ID: <87podg1a2x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > pngquant's homegrown configure script doesn't understand CC with a
 > space, so we can't use ccache with it. Only the host variant is
 > affected: for the target, we call ccache from the toolchain-wrapper so
 > it's transparent to the configure script.

 > This wasn't seen in the autobuilders since they never enable
 > BR2_CCACHE.

 > To test, use any configuration and do
 > make BR2_CCACHE=y host-pngquant

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2017.05.x (not in 2017.02), thanks.

-- 
Bye, Peter Korsgaard
