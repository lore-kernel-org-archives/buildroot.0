From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  8 Jul 2014 17:04:15 +0000 (UTC)
Subject: [Buildroot] [Bug 7268] python 2.7 compilation issue on a
 Debian/Ubuntu host with multiarch support
In-Reply-To: <bug-7268-163@https.bugs.busybox.net/>
References: <bug-7268-163@https.bugs.busybox.net/>
Message-ID: <20140708170415.A0FB19D1D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7268

David <buildroot-2014@inbox.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|python 2.7 compilation      |python 2.7 compilation
                   |issue                       |issue on a Debian/Ubuntu
                   |                            |host with multiarch support

--- Comment #10 from David <buildroot-2014@inbox.com> 2014-07-08 17:04:14 UTC ---
Hi,

I finally got the bug. Your input about wrong paths really helped me and saved
me a lot of time, thanks a lot for this.

In fact, the main setup.py script has a "add_multiarch_paths" function that
adapts standard paths to multiarch requirements. For some reason, it adds host
/usr/include/x86_64-linux-gnu to include paths for the target python build. 

I add a patch that makes multiarch management process available only if python
is not being cross-compiled. I do not know if multiarch really makes sense in
the case of buildroot. This patch fixes my compilation issue, but it may break
something for a different architecture, so I hope someone with a lot more
experience about python and buildroot architectures than me will read this
patch.

Thanks a lot again
David

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
