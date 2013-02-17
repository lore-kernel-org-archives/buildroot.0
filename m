From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 Feb 2013 02:52:06 +0000 (UTC)
Subject: [Buildroot] [Bug 5948] AT91 Bootstrap3 defconfig name change not
 detected (by make process)
In-Reply-To: <bug-5948-163@https.bugs.busybox.net/>
References: <bug-5948-163@https.bugs.busybox.net/>
Message-ID: <20130217025206.46FB29AB3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5948

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-02-17 02:52:27 UTC ---
This is expected. When you make a change to your configuration, Buildroot does
not try to guess what needs to be rebuilt, because it's very complicated to
achieve in a safe and reliable manner. So we simply decide not to do it, and
leave it to the user to know what parts of Buildroot need to be cleaned after
making a configuration change.

In your case, you can do:

 make at91bootstrap3-reconfigure

to restart the build process of AT91Bootstrap3 from its configuration step.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
