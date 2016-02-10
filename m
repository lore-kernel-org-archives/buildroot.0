From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2016 08:11:03 +0100
Subject: [Buildroot] [PATCH v2] linux: add conditional patch for
	timeconst.pl
In-Reply-To: <56BA718A.5060500@mind.be> (Arnout Vandecappelle's message of
 "Wed, 10 Feb 2016 00:08:58 +0100")
References: <1454852508-27544-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <56BA718A.5060500@mind.be>
Message-ID: <87vb5xrqew.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> +LINUX_POST_PATCH_HOOKS += LINUX_TRY_PATCH_TIMECONST

 >  This is a patch that we probably _do_ want to apply even in case of
 > OVERRIDE_SRCDIR. So maybe add it to LINUX_PRE_CONFIGURE_HOOKS instead. Even
 > though that's even more of a hack (and conflicts with the out-of-tree build
 > support).

We have so far said that it is the responsibility of the user overriding
to handle all patches they need, and it imho makes sense here as
well. If they build the kernel manually outside buildroot they also need
to patch this.

-- 
Bye, Peter Korsgaard
