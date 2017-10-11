From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Oct 2017 14:23:11 +0000
Subject: [Buildroot] [Bug 10391] WiringPi retrieves wrong (old) version
In-Reply-To: <bug-10391-163@https.bugs.busybox.net/>
References: <bug-10391-163@https.bugs.busybox.net/>
Message-ID: <bug-10391-163-Pbuk3sWRJu@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10391

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned at buildroot.uclibc |yann.morin.1998 at free.fr
                   |.org                        |
         Resolution|WORKSFORME                  |---
             Status|RESOLVED                    |REOPENED
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #6 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to srg.venema from comment #3)
> warning: Remote branch 2.44 not found in upstream origin, using HEAD instead

I've sen that message with older versions of git.

Basically, our wrapper uses: git clone --depth 1 -b ${ref} ${repo}

However, in older versions of git, the -b option only expected a branch,
not a tag. git-2.7.4 does accept either a tag or a branch for -b, while
git-1.7.9.5 only accepts a branch with -b.

What's more, as the message implies, if the branch is not found, then
the HEAD if the default branch is used instead, a warning is printed,
but this is not considered an error, which is clearly bad. :-(

I don't know the exact version which started accepting a tag with -b.
I'll research that, so we can decide if we want to support such an old
git version, or if we start requiring something newer.

Ergo, I'm reopenning, and assigning to me.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
