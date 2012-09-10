From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Sep 2012 20:52:40 +0000 (UTC)
Subject: [Buildroot] [Bug 5378] dropbear Makefile broken
In-Reply-To: <bug-5378-163@https.bugs.busybox.net/>
References: <bug-5378-163@https.bugs.busybox.net/>
Message-ID: <20120910205240.1347B99343@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5378

--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org> 2012-09-10 20:52:39 UTC ---
(In reply to comment #5)
> (In reply to comment #1)
> 
> it would be better to fix Makefile.in itself and then send the fix upstream
> 
> (In reply to comment #2)
> 
> make has implicit rules to handle "-lfoo" in its dependency list.  so dropbear
> does this:
> 
> dropbearobjs=$(COMMONOBJS) $(CLISVROBJS) $(SVROBJS) @CRYPTLIB@
> ...
> dropbear: $(dropbearobjs)
> 
> this expands into:
> dropbear: ... -lcrypt
> 
> and make executes its implicit code to try and find /usr/lib/libcrypt.a.  if
> you don't have that, it'll fail.

Ahh yes, I missed that.

And yes, I agree with Mike. Please fix it correctly (E.G. in Makefile.in) and
submit upstream.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
