From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 16 Aug 2018 15:12:06 +0000
Subject: [Buildroot] [Bug 11236] util-linux fails to build on Travis CI when
 python also selected
In-Reply-To: <bug-11236-163@https.bugs.busybox.net/>
References: <bug-11236-163@https.bugs.busybox.net/>
Message-ID: <bug-11236-163-lW69sb7aq9@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11236

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|---                         |WORKSFORME
             Status|NEW                         |RESOLVED

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Frank,

As discussed on IRC, this is an environment problem on TravisCI.

I suggested you investigate what /opt/pyenv/shims is for, and similarly
for all the other stuff in PATH. You may have to sanitise the PATH
somehow before calling Buildroot.

Otherwise, there's not much we can do about it... :-/

> I tried adding python-dev

Which I explained on IRC was useless because your error is about building
util-linux for the target, so the host python devel files are useless.

Closing as not reproducible on a standard environment...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
