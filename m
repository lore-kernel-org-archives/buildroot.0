From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Apr 2015 21:16:09 +0000 (UTC)
Subject: [Buildroot] [Bug 7971] python-flask,
	python-werkzeug. No module named zlib
In-Reply-To: <bug-7971-163@https.bugs.busybox.net/>
References: <bug-7971-163@https.bugs.busybox.net/>
Message-ID: <20150410211609.DEDB28195D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7971

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2015-04-10 21:16:09 UTC ---
Are you sure you have done a clean rebuild after adding flask? The symptoms
sounds as if you have first built python (without zlib support) and then
afterwards added flask.

I did a test here, and it works:

# python
Python 2.7.9 (default, Apr 10 2015, 23:10:24) 
[GCC 4.8.3 20140320 (prerelease)] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> from flask import Flask
>>>

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
