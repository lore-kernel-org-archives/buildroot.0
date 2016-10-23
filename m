From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Oct 2016 19:59:45 +0000
Subject: [Buildroot] [Bug 8696] xdriver_xf86-input-mouse install header
 files in target directory
In-Reply-To: <bug-8696-163@https.bugs.busybox.net/>
References: <bug-8696-163@https.bugs.busybox.net/>
Message-ID: <bug-8696-163-hyI0nSgf14@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8696

--- Comment #9 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Hello again,

So, two other packages are affected:
  - xdriver_xf86-input-evdev
  - xdriver_xf86-input-libinput

I managed to fix the first one rather easily, and its headers
are now installed in the correct location.

However, since all those input drivers are not slated for being
installed in staging/ , the headers are only in target/ (but
are properly cleaned up in target-finalize).

One question remains: are those headeerrs supposed to be used
by external applications? If so, then the packages must also
be installed in staging (once they are all fixed to get rid of
sdkdir).

Care to give a bit of feedback on my question above, please?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
