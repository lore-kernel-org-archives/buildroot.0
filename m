From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Sep 2015 13:07:37 +0000 (UTC)
Subject: [Buildroot] [Bug 8366] libevent does not build
In-Reply-To: <bug-8366-163@https.bugs.busybox.net/>
References: <bug-8366-163@https.bugs.busybox.net/>
Message-ID: <20150923130737.4724E81D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8366

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-09-23 13:07:36 UTC ---
Thanks for your report!

It is not really libevent that fails to build, it's automake that uses some
Perl modules that are not available on your system. On Debian/Ubuntu, the
Thread/Queue.pm module is part of the perl-modules package which I believe is
virtually installed on all Debian/Ubuntu systems.

Which distribution are you using? Does it have a package providing
Thread/Queue.pm?

We should probably add a check in our dependencies for this perl module to be
available (I don't think we want to make host-perl a dependency of
host-automake).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
