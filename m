From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Aug 2016 20:09:27 +0000
Subject: [Buildroot] [Bug 9166] Missing overlays directory in VFAT image for
 raspberry pi 3
In-Reply-To: <bug-9166-163@https.bugs.busybox.net/>
References: <bug-9166-163@https.bugs.busybox.net/>
Message-ID: <bug-9166-163-xlu6tZvhAC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9166

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Diez,

> I checked, and matter of factly the patch would break buildroot if
> BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS was not selected. So
> it's moot anyway.

I was not suggesting that you submit a patch to Buildroot, but that you
handle the customisation on your side. Use your own genimage.cfg file
that suits your need.

The manual has a section on how to handle local customisations:
    https://buildroot.org/downloads/manual/manual.html#customize

One would argue that overlays are very often used so they should be
installed by our defconfigs.

However, there are so many overlays, for so different things, that
usually only one or a few would be needed in a specific case. Or even
that overlays from anotehr place are used.

So I am still not sure we want to have our defconfigs install the
overlays.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
