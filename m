From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Nov 2019 18:36:44 +0000
Subject: [Buildroot] [Bug 12286] Can't import gobject in python 3.8
In-Reply-To: <bug-12286-163@https.bugs.busybox.net/>
References: <bug-12286-163@https.bugs.busybox.net/>
Message-ID: <bug-12286-163-RP95oPlCm7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12286

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Unfortunately, the version of python-gobject we use is very old, because it was
I guess the latest version that doesn't need gobject-introspection.

The same issue was reported to Arch Linux
(https://bugs.archlinux.org/task/64541), and they simply removed their
python-gobject2 package.

So I think for now, we should disallow our python-gobject package with Python
3.x, until we merge the gobject-introspection support, which will allow us to
update to a newer version of python-gobject.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
