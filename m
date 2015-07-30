From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2015 13:11:04 +0000 (UTC)
Subject: [Buildroot] [Bug 7772] libxml-parser-perl build failure: missing
 dependency ExtUtils/MakeMaker
In-Reply-To: <bug-7772-163@https.bugs.busybox.net/>
References: <bug-7772-163@https.bugs.busybox.net/>
Message-ID: <20150730131104.A078E81E90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7772

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-30 13:11:04 UTC ---
(In reply to comment #5)
> (In reply to comment #4)
> > Vicente, do you have a readily available chroot in which we can run Buildroot
> > to reproduce this problem?
> 
> No, I don't. But you can just remove perl-MakeMaker from your host machine and
> try to build Buildroot using a defconfig which includes libxml-parser-perl.

Well, on Debian/Ubuntu, perl-MakeMaker is part of the perl-modules package. If
you try to remove it, it also removes perl, and Buildroot won't run without
perl:

root at build:/# apt-get remove perl-modules
[...]
The following packages will be REMOVED:
  cvs git git-core liberror-perl libfile-copy-recursive-perl perl perl-modules
sgml-base update-inetd xml-core

So it's basically a scenario that isn't possible.

On which system do you have this problem?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
