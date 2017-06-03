From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 03 Jun 2017 08:02:43 +0000
Subject: [Buildroot] [Bug 9936] Host QEMU does not build with SDL support
 because of pkg-config
In-Reply-To: <bug-9936-163@https.bugs.busybox.net/>
References: <bug-9936-163@https.bugs.busybox.net/>
Message-ID: <bug-9936-163-RNNvq473Ds@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9936

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
We don't want to do this, because it would mean host-qemu would rely on your
host installed SDL libraries, which is not what we want. In the current state
of things, I don't think we are going to provide a host-qemu package that has
SDL/graphics support as that would require to package too many host libraries
in Buildroot.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
