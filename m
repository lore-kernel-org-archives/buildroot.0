From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Jan 2012 20:09:26 +0000 (UTC)
Subject: [Buildroot] [Bug 4448] Busybox build must depend on busybox
 configuration file date
In-Reply-To: <bug-4448-163@https.bugs.busybox.net/>
References: <bug-4448-163@https.bugs.busybox.net/>
Message-ID: <20120131200926.9D88390953@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4448

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-01-31 20:09:26 UTC ---
In order to change the Busybox configuration, one is supposed to run make
busybox-menuconfig, make busybox-xconfig or make busybox-gconfig. Those targets
take care of removing the appropriate stamp files to force Buildroot to restart
the Busybox build process at the next 'make' invocation.

If you are modifying the Busybox configuration file manually (without going
through these 'make busybox-*config' targets), then I would say you know what
you are doing and you know you need to take some action to make Buildroot
restart the build of Busybox, for example by running 'make busybox-rebuild'.

If we do that for the Busybox configuration, what shouldn't we do that for all
the source files of all packages? I.e, I modify
output/build/linux-3.0/init/main.c, and at the next 'make' invocation, I want
Buildroot to figure out that the kernel needs to be rebuilt. It is
unfortunately not possible to achieve that without re-doing a make invocation
in all packages, which is not really reasonable.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
