From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Jan 2015 14:20:09 +0000 (UTC)
Subject: [Buildroot] [Bug 7766] logrotate default gzip path is usually wrong
In-Reply-To: <bug-7766-163@https.bugs.busybox.net/>
References: <bug-7766-163@https.bugs.busybox.net/>
Message-ID: <20150106142009.926DE807DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7766

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |

--- Comment #2 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2015-01-06 14:20:09 UTC ---
I've never seen anyone close their own bug as invalid so fast :)
Keep it open, it's actually valid, but you missed a few details i think.
If you use busybox, it's gzip/gunzip is properly installed to /bin, so i'm
assuming you're not using busybox at all (or disabled gzip in it) and using
"big fat" gzip which installs into /usr.
So the solution would be to make the gzip package install into / rather than
/usr.
I'll cook a patch and send it to the list soon.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
