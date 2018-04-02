From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 Apr 2018 15:39:57 +0000
Subject: [Buildroot] [Bug 10511] Packages get downloaded uncompressed with
 wget
In-Reply-To: <bug-10511-163@https.bugs.busybox.net/>
References: <bug-10511-163@https.bugs.busybox.net/>
Message-ID: <bug-10511-163-CEhMLgKpJi@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10511

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WONTFIX
             Status|NEW                         |RESOLVED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This problem only affects wget 1.19.2. In 1.19.3, a patch was merged that
disables auto-decompression for files ending in .gz and .tgz, and then in
1.19.4, the auto-decompression was disabled entirely, as it was causing too
many problems.

Since the problem has been fixed in dot-releases of wget, most reasonable
distributions that were using 1.19.2 have probably upgraded to 1.19.3 or later.

In addition, for those stuck with wget 1.19.2, the fallback to
sources.buildroot.net works (even if admittedly the bogus hashes can be scary).
But considering all of this, we don't want to introduce extra complexity in
Buildroot just to workaround a problem affecting only wget 1.19.2 when
downloading files only from HTTP servers having a specific configuration.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
