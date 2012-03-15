From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Mar 2012 10:46:35 +0000 (UTC)
Subject: [Buildroot] [Bug 4796] apply-patches.sh reorders patches given on
 the command line
In-Reply-To: <bug-4796-163@https.bugs.busybox.net/>
References: <bug-4796-163@https.bugs.busybox.net/>
Message-ID: <20120315104635.77E9990DAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4796

--- Comment #2 from Christoph Schulz <develop@kristov.de> 2012-03-15 10:46:35 UTC ---
According to some comments on the mailing list, here is an improved version of
the patch. Expanded patterns are sorted but arguments to apply-patches.sh are
not generally reordered. That means that

  apply-patches a z f* c

given the patches "a c f1 f2 z" in the patch directory causes the patches to be
processed as follows:

  a z f1 f2 c

This should make apply-patches.sh conforming to both requirements (sorting of
patches specified by a pattern and no reordering of arguments).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
