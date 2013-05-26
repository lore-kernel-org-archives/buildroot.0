From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 17:15:24 +0000 (UTC)
Subject: [Buildroot] [Bug 5510] Buildroot fails "host-mtd 1.4.4"
In-Reply-To: <bug-5510-163@https.bugs.busybox.net/>
References: <bug-5510-163@https.bugs.busybox.net/>
Message-ID: <20130526171524.E55459A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5510

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 17:14:15 UTC ---
Buildroot 2011.05 is way too far in the past for me to remember exactly what
could have fixed that, but it seems like the command that links mkfs.ubifs was
lacking a reference to $(HOST_DIR)/usr/lib for libraries. This is the reason
why lzo2 wasn't found.

I've just tested with a recent Buildroot (latest master, but 2013.02 should
work fine), and host-mtd 1.5.0 builds fine. The lzo2 library is properly built
and installed in $(HOST_DIR)/usr/lib, and mkfs.ubifs is linked against it.

I'm therefore marking this bug as closed. If you are still having this issue
with a more recent version of Buildroot, do not hesitate to reopen it, and
attach a minimal Buildroot configuration that exhibits the problem. Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
