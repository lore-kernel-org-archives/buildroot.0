From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Aug 2010 20:26:21 +0000 (UTC)
Subject: [Buildroot] [Bug 2395] libglib2-2.24.1 and libxml2-2.7.7 fails
 build on MIPS because is missing -ldl
In-Reply-To: <bug-2395-163@https.bugs.busybox.net/>
References: <bug-2395-163@https.bugs.busybox.net/>
Message-ID: <20100816202621.7EAA588D2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2395

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
> I reported, just after do a make clean , make clean is that enough ?

'make clean' is indeed enough. Please put the full build log online somewhere.
As I can't reproduce the issue, if you don't provide a full build log so that I
can start the investigation, I will unfortunately have no other option than
closing this bug because of missing information.

You can also try to reproduce by disabling BR2_CONFIG_CACHE (by default it is
enabled). I'm fairly strongly suspecting a configure cache issue.

> > the Makefiles are
> > generated files, and the fact that -ldl is needed or not should be detected by
> > the ./configure script.
> 
> ./configure is the file that I should try to patch ?

No. configure is also generated. For the error you're describing, there should
be nothing to patch. It should just work.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
