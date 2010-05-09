From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 May 2010 06:38:04 +0000 (UTC)
Subject: [Buildroot] [Bug 1399] xfont_font-adobe-100dpi does not build
In-Reply-To: <bug-1399-163@https.bugs.busybox.net/>
References: <bug-1399-163@https.bugs.busybox.net/>
Message-ID: <20100509063804.BA7C28D27C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1399

--- Comment #13 from Paul Jones <paul.jones@iwtech.com.au>  ---
I think I've found the problem - the configure script is cached with the wrong
values - see below:

checking for mkfontdir... (cached) /usr/bin/mkfontdir
checking for bdftopcf... (cached) /usr/bin/bdftopcf
checking font compression method... gzip
checking for gzip... (cached) /bin/gzip
checking for ucs2any... (cached)


The ucs2any program is inserted into the makefile as a blank string therefore
the shell tries to execute the arguments rather than the program, which
obviously won't work.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
