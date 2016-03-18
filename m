From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Mar 2016 13:30:38 +0000
Subject: [Buildroot] [Bug 6830] Qt5: no fonts are installed
In-Reply-To: <bug-6830-163@https.bugs.busybox.net/>
References: <bug-6830-163@https.bugs.busybox.net/>
Message-ID: <bug-6830-163-2dAmwlfk27@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6830

Alexey Brodkin <abrodkin@synopsys.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |VERIFIED
                 CC|                            |abrodkin at synopsys.com

--- Comment #4 from Alexey Brodkin <abrodkin@synopsys.com> ---
Indeed with BR2_PACKAGE_QT5BASE_FONTCONFIG selected no fonts are installed in
staging and essentially they won't get on target.

Moreover even if one puts fonts in /usr/lib/fonts on target they won't appear
in Qt5 apps.

So I had to rebuild entire Qt5 after I disabled BR2_PACKAGE_QT5BASE_FONTCONFIG
and fonts appeared in Qt apps.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
