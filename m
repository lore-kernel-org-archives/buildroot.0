From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Feb 2019 00:58:10 +0000
Subject: [Buildroot] [Bug 9966] util-linux-2.30/.stamp_built' failed
In-Reply-To: <bug-9966-163@https.bugs.busybox.net/>
References: <bug-9966-163@https.bugs.busybox.net/>
Message-ID: <bug-9966-163-bZOBkYT82S@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9966

Micha? Miros?aw <mirq-boogs@rere.qmqm.pl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WORKSFORME                  |---

--- Comment #4 from Micha? Miros?aw <mirq-boogs@rere.qmqm.pl> ---
I just stumbled on this problem on 2018.11.3 after adding a patch that modifies
configure.ac.

'make clean' does not help in this case.

It seems that this modification triggers regererating of aclocal.m4 (it has
some parts replaced with an older version) and all the paths to tools and
libraries in resulting Makefiles get mixed up.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
