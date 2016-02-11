From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Feb 2016 23:26:41 +0100
Subject: [Buildroot] [PATCH] Makefile: Fix overlay overwriting everything
In-Reply-To: <56BB98E1.4070008@mind.be> (Arnout Vandecappelle's message of
 "Wed, 10 Feb 2016 21:09:05 +0100")
References: <1455119908-21976-1-git-send-email-maxime.hadjinlian@gmail.com>
 <56BB98E1.4070008@mind.be>
Message-ID: <878u2qq3xa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>> Solution:
 >> Telling rsync to treat symlinked dir on the receiver side as directory
 >> allow users to be blissfully ignorant of that problem.

 >  I'm not so sure of this one... It makes it impossible to override the symlinks
 > in the skeleton in the overlay. Say, you want to populate /var/spool with some
 > directories so it becomes useable.

 >  That said, it's probably better in that case to override the skeleton directly,
 > so that package installation can pick up the new directory.

 >  Still, you _are_ breaking a valid use case with this patch.

 >  What do the others think?

I'm also not really happy about it either. Another potential issue is if
the build machine is so old that rsync doesn't support --keep-dirlinks,
but according to:

https://download.samba.org/pub/unpacked/rsync/OLDNEWS

This was added in 2.6.3 (Sep 2004), so I guess even RHEL5 and similar
should have it.

-- 
Bye, Peter Korsgaard
