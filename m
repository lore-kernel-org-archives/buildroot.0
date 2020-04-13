From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Apr 2020 23:51:23 +0000
Subject: [Buildroot] [Bug 10386] Add an option to put all compiled
 executables that show up on target/ in staging/ as well
In-Reply-To: <bug-10386-163@https.bugs.busybox.net/>
References: <bug-10386-163@https.bugs.busybox.net/>
Message-ID: <bug-10386-163-b9flTxwTK4@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10386

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|ASSIGNED                    |RESOLVED

--- Comment #2 from Carlos Santos <unixmania@gmail.com> ---
As discussed in patchwork[1]

The idea would be to ensure that all packages install in staging/,
always. Then, identify packages that have different commands for target/
and staging/ and make them identical. Finally, remove the target install
commands, and genreate it as a copy of staging at the beginning of the
target-finalize step.

https://patchwork.ozlabs.org/project/buildroot/patch/20191001013654.22298-2-unixmania at gmail.com/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
