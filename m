From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 09 Aug 2016 10:18:54 +0000
Subject: [Buildroot] [Bug 9156] qt: Fix missing runtime Qt3Support dependency
In-Reply-To: <bug-9156-163@https.bugs.busybox.net/>
References: <bug-9156-163@https.bugs.busybox.net/>
Message-ID: <bug-9156-163-XJsTMp7Zch@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9156

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Indeed, according to https://wiki.qt.io/Qt_Library_Cross_Dependencies,
Qt3Support relies on QtSql. So I've applied your patch.

However, according to https://wiki.qt.io/Qt_Library_Cross_Dependencies,
Qt3Support also requires:

 * QtGui: this is already handled by Buildroot
 * QtNetwork: this is already a dependency of QtGui, so OK
 * QtXml: this one I don't see where we take care of it. Could you double check
this, and send a follow-up patch if needed?

Also, please send your patches to the mailing list next time. Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
