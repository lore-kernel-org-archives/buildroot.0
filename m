From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 30 Sep 2019 11:14:54 +0000
Subject: [Buildroot] [Bug 10386] Add an option to put all compiled
 executables that show up on target/ in staging/ as well
In-Reply-To: <bug-10386-163@https.bugs.busybox.net/>
References: <bug-10386-163@https.bugs.busybox.net/>
Message-ID: <bug-10386-163-SNhoESdneR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10386

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|unassigned at buildroot.uclibc |unixmania at gmail.com
                   |.org                        |

--- Comment #1 from Carlos Santos <unixmania@gmail.com> ---
This bug has been dormant for a long time. It look like a feature request
rather
than a bug but anyway it sounds valid. The proposed solution, however is hard
to
implement.

Since Buildroot 2018.05 the root filesystem image is generated from a copy of
TARGER_DIR, so we can move the strpping from target-finalize to the fakeroot
script. This way we strip binaries only in the intermediary copy.

I will submit a patch with this change for review.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
