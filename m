From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Dec 2011 09:31:31 +0000 (UTC)
Subject: [Buildroot] [Bug 4592] libXfont and libXft building failed,
 cross-compilation error
In-Reply-To: <bug-4592-163@https.bugs.busybox.net/>
References: <bug-4592-163@https.bugs.busybox.net/>
Message-ID: <20111212093131.3E8418F906@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4592

--- Comment #7 from Peter Korsgaard <jacmet@uclibc.org> 2011-12-12 09:31:31 UTC ---
(In reply to comment #6)
> I was getting similar errors with other packages and i start investigating in
> other direction when i found the LD_LIBRARY_PATH pointing at /usr/lib .
> Pointing that env variable to
> /home/turin/proyectos/mini2440/buildroot/buildroot-2011.11/output/host/usr/lib
> made the building process without errors. My computer is still compilling, so
> when it finish y will try to restart the building with a clean LD_LIBRARY_PATH
> variable to see if this was the problem.

LD_LIBRARY_PATH can indeed screw up stuff. Normally it shouldn't be needed for
a location like /usr/lib, so I suggest you delete rather than pointing to your
buildroot dir (we already use rpath, so it shouldn't be needed for buildroot
either).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
