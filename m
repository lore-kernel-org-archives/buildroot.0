From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2013 22:28:55 +0000 (UTC)
Subject: [Buildroot] [Bug 6392] Extended ARM uImage kernel options
In-Reply-To: <bug-6392-163@https.bugs.busybox.net/>
References: <bug-6392-163@https.bugs.busybox.net/>
Message-ID: <20131030222855.E152F9BC02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6392

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-10-30 22:28:55 UTC ---
The contributor, Philipp Rahns, proposed the addition of a
BR2_LINUX_KERNEL_MAKE_FLAGS configuration option, to add custom make flags when
building the kernel. However, Philipp hasn't given details on the specific use
case for this, so it's hard to understand why we would want to add that.

The second proposal of Philipp is to add BR2_LINUX_KERNEL_NATIVE_CONFIG, which
tells the Buildroot kernel building logic to use the .config file present
within the kernel tarball as the configuration file. However, this is not a
standard practice, and if people want to store a kernel configuration within
the kernel tree, they should rather store it into arch/<ARCH>/configs/, as a
minimal defconfig. This is the standard practice and is already supported by
Buildroot.

Due to those two reasons, I am not convinced the patch is actually needed. Of
course Philipp, if you disagree, feel free to reopen the bug and provide
additional details about those use cases. It is still possible to convince us!
:-)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
