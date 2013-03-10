From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 11:48:42 +0100
Subject: [Buildroot] [PATCH 2/5] alsa-lib: fix noMMU build
In-Reply-To: <87a9qc2uu2.fsf@dell.be.48ers.dk>
References: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362853290-15592-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <87a9qc2uu2.fsf@dell.be.48ers.dk>
Message-ID: <20130310114842.4cd6647e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sat, 09 Mar 2013 21:15:33 +0100, Peter Korsgaard wrote:

> Are you sending this upstream? What's the reason for the HAVE_FORK
> check? Why not just always use vfork() instead? That should work fine on
> mmu as well (and be a tiny bit faster).

I could possibly send this upstream, yes. The reason to use HAVE_FORK
is to not change the MMU code, which probably is going to make the
patch easier to get merged upstream, and also because that's the way
the Blackfin people handled the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
