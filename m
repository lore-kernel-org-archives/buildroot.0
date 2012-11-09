From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Nov 2012 09:22:39 +0100
Subject: [Buildroot] [PATCH] xlib_libX11: fix compilation of makekeys
In-Reply-To: <20121109090946.3c88e6f2@skate> (Thomas Petazzoni's message of
 "Fri, 9 Nov 2012 09:09:46 +0100")
References: <1352028606-11338-1-git-send-email-arnout@mind.be>
 <20121108201326.2676f417@skate> <509C2776.2060706@mind.be>
 <20121109090946.3c88e6f2@skate>
Message-ID: <87zk2r6v8w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Arnout Vandecappelle,
 Thomas> On Thu, 08 Nov 2012 22:43:18 +0100, Arnout Vandecappelle wrote:

 >> Indeed, and this patch fixes that.  It's a different symptom of the same
 >> error: makekeys is a host binary, but it's built with target CFLAGS
 >> (X11_CFLAGS = -I$(STAGING_DIR)/usr/include).  This will barf in surprising
 >> ways.
 >> 
 >> (That is, unless you have an autobuilder that runs against a git tree that
 >> has already integrated this patch; if that is the case, then I made a
 >> mistake somewhere.)

 Thomas> Aaah, your patch hasn't been integrated yet. My bad. Peter, could you
 Thomas> merge Arnout's patch then?

I did this morning (but forgot to push before now).

-- 
Bye, Peter Korsgaard
