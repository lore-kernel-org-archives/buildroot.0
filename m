From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Mar 2016 20:34:43 +0000
Subject: [Buildroot] [Bug 8746] At startup system stops with 'cannot set
 terminal process group (-1): Inappropriate ioctl for device' error
In-Reply-To: <bug-8746-163@https.bugs.busybox.net/>
References: <bug-8746-163@https.bugs.busybox.net/>
Message-ID: <bug-8746-163-a6kHnvLqJd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8746

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|ASSIGNED                    |RESOLVED

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Yes, since 2015.11, we have an option to merge /usr and /. From Buildroot's
CHANGES file:

        - Add support for /bin, /sbin and /lib to be symlinks to their
          corresponding directories in /usr. This is enforced for
          systemd configurations, and optional for other
          configurations.

As said above, this is mandatory for systemd (because systemd people expect
such a filesystem layout) and optional in other cases. Since you're using
systemd, this new organization has been automatically enabled.

I'll mark the patch as invalid then. Thanks for following up!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
