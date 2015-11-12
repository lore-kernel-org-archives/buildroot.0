From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 12 Nov 2015 22:44:44 +0000 (UTC)
Subject: [Buildroot] [Bug 8456] Building host-pkgconf on Fedora 23 fails due
 to incorrect build dependencies
In-Reply-To: <bug-8456-163@https.bugs.busybox.net/>
References: <bug-8456-163@https.bugs.busybox.net/>
Message-ID: <20151112224444.9182F7F8A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8456

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-11-12 22:44:43 UTC ---
(In reply to comment #3)
> Created attachment 6221 [details]
> Add host coreutils and add some host build dependancies
> 
> I'm not claiming to have added all of the required dependencies. but
> 
> A) Buildroot now builds for me on Fedora 23
> B) This makes things no worse
> C) pkgconfig and anything dependent on it now has correct dependencies and uses
>    compatible ls and libcap

As Yann said, we believe this is not the proper direction. Instead, removing
LD_LIBRARY_PATH should be done, so that for your system tools, we don't try to
use the Buildroot built libraries.

Can you test the patch at http://patchwork.ozlabs.org/patch/537657/ instead ?

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
