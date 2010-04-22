From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Apr 2010 19:11:11 +0000 (UTC)
Subject: [Buildroot] [Bug 985] Bump usb_modeswitch package to 1.1.0
In-Reply-To: <bug-985-163@https.bugs.busybox.net/>
References: <bug-985-163@https.bugs.busybox.net/>
Message-ID: <20100422191111.81AC72F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=985


Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
Attachment #1003 is|0                           |1
           obsolete|                            |




--- Comment #2 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2010-04-22 19:11:10 UTC ---
Created an attachment (id=1555)
 --> (https://bugs.busybox.net/attachment.cgi?id=1555)
Bump usb_modeswitch to 1.1.2


This patch takes up to usb_modeswitch 1.1.2.

Udev support isn't included because the wrapper script is now tclsh which would
pull in TCL as a dependency.

What would be needed for this is to enable the TCL package if UDEV=y in
usb_modeswitch.mk/Config.in, install usb_modeswitch.conf (config file for the
wrapper script in udev) and install the wrapper script in the udev directory
(commented out by my makefile patch).
And also clean up that in the uninstall hook.

I personally don't use udev and just call usb_modeswitch with the expected
VID/PID pairs so i've got no quick way of testing it.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
