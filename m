From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Aug 2019 00:34:07 +0000
Subject: [Buildroot] [Bug 10171] devmem2 w (word) is 8 bytes in x86 64
 systems
In-Reply-To: <bug-10171-163@https.bugs.busybox.net/>
References: <bug-10171-163@https.bugs.busybox.net/>
Message-ID: <bug-10171-163-s4GZrro0XM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10171

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
           Assignee|unassigned at buildroot.uclibc |unixmania at gmail.com
                   |.org                        |

--- Comment #3 from Carlos Santos <unixmania@gmail.com> ---
I'm taking this one.

This bug has been frozen for two years. I think we could simply replace devmem2
by a shell script that invokes the busybox devmem utility, mapping the 'type'
argument to the corresponding 'width' one, keeping backward compatibility:

   b -> 8
   h -> 16
   w -> 32

Do you agree?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
