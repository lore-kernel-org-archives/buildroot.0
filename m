From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 19 Apr 2015 12:53:42 +0000 (UTC)
Subject: [Buildroot] [Bug 7971] python-flask,
	python-werkzeug. No module named zlib
In-Reply-To: <bug-7971-163@https.bugs.busybox.net/>
References: <bug-7971-163@https.bugs.busybox.net/>
Message-ID: <20150419125342.A05AA80424@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7971

--- Comment #2 from Nikita <nikita_23k@mail.ru> 2015-04-19 12:53:42 UTC ---
(In reply to comment #1)
> Are you sure you have done a clean rebuild after adding flask? The symptoms
> sounds as if you have first built python (without zlib support) and then
> afterwards added flask.
> 
> I did a test here, and it works:
> 
> # python
> Python 2.7.9 (default, Apr 10 2015, 23:10:24) 
> [GCC 4.8.3 20140320 (prerelease)] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
> >>> from flask import Flask
> >>>

Yes. The problem occurs when the language is not en_US. When I do 
>export LC_ALL=en_US.UTF-8
>export LANG=en_US.UTF-8
>export LANGUAGE=en_US.UTF-8

all is well. My var is LANG=ru_RU.UTF-8

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
