From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 07 Sep 2018 19:25:13 +0000
Subject: [Buildroot] [Bug 11116] Buildroot should set PYTHON_EGG_CACHE
 instead of writing files to ~/.python-eggs
In-Reply-To: <bug-11116-163@https.bugs.busybox.net/>
References: <bug-11116-163@https.bugs.busybox.net/>
Message-ID: <bug-11116-163-Y4Yok0GCJy@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11116

Vitaliy Lotorev <lotorev@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #2 from Vitaliy Lotorev <lotorev@gmail.com> ---
> If I understand correctly, the problem is not that building a Python package will write something to $HOME/.python-eggs (because as far as I can see, it doesn't),

It does on my side, it appears I was using custom python-serial package that
used distutils instead of setuptools (which is used in recent Buildroot
versions). After switching to stock Buildroot package no writing is done to
$HOME/.python-egss directory anymore.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
