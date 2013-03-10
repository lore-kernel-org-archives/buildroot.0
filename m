From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Mar 2013 21:23:28 +0100
Subject: [Buildroot] [PATCH 2/5] alsa-lib: fix noMMU build
In-Reply-To: <20130310114842.4cd6647e@skate> (Thomas Petazzoni's message of
 "Sun, 10 Mar 2013 11:48:42 +0100")
References: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362853290-15592-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <87a9qc2uu2.fsf@dell.be.48ers.dk> <20130310114842.4cd6647e@skate>
Message-ID: <87ppz7ypfj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Peter Korsgaard,
 Thomas> On Sat, 09 Mar 2013 21:15:33 +0100, Peter Korsgaard wrote:

 >> Are you sending this upstream? What's the reason for the HAVE_FORK
 >> check? Why not just always use vfork() instead? That should work fine on
 >> mmu as well (and be a tiny bit faster).

 Thomas> I could possibly send this upstream, yes. The reason to use
 Thomas> HAVE_FORK is to not change the MMU code, which probably is
 Thomas> going to make the patch easier to get merged upstream, and also
 Thomas> because that's the way the Blackfin people handled the problem.

I would say just the opposite. As you know, you have to be careful
(because parent/child is sharing memory) when you convert from fork to
vfork, so as a maintainer I wouldn't like to only do it for a very small
subset of machines (that he probably cannot easily test himself).

Either the conversion is correct, and should be done for everyone so it
keeps working or it shouldn't be done.

-- 
Bye, Peter Korsgaard
