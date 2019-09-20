From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Sep 2019 06:58:06 +0000
Subject: [Buildroot] [Bug 12241] Permission denied while running "make"
In-Reply-To: <bug-12241-163@https.bugs.busybox.net/>
References: <bug-12241-163@https.bugs.busybox.net/>
Message-ID: <bug-12241-163-eDx6bGsXG7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12241

Cerem Cem ASLAN <ceremcem@ceremcem.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #4 from Cerem Cem ASLAN <ceremcem@ceremcem.net> ---
Exactly: 

ceremcem at cca-erik:~$  mount | grep -F /tmp
tmpfs on /tmp type tmpfs (rw,nosuid,nodev,noexec,noatime,size=524288k)


I remounted with "exec": 

sudo mount -o remount,exec /tmp

Then compilation continued. Would you consider adding that checking into
makefile? (I may provide a patch for that)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
