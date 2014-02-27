From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Feb 2014 12:50:03 +0000 (UTC)
Subject: [Buildroot] [Bug 6938] mkuser script generates wrong password for
 new user in target/etc/shadow
In-Reply-To: <bug-6938-163@https.bugs.busybox.net/>
References: <bug-6938-163@https.bugs.busybox.net/>
Message-ID: <20140227125003.EDD2F9BB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6938

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #3 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-27 12:50:03 UTC ---
Thanks for the additional information.
The problem is not a bug, but a misunderstanding on your part, I think. The
password can be provided in three ways, as stated by the manual on this topic:

http://buildroot.uclibc.org/downloads/manual/manual.html#makeuser-syntax
-----
password is the crypt(3)-encoded password. If prefixed with !, then login is
disabled. If prefixed with =, then it is interpreted as clear-text, and will be
crypt-encoded (using MD5). If prefixed with !=, then the password will be
crypt-encoded (using MD5) and login will be disabled. If set to *, then login
is not allowed. 
-----

So if you expect to provide a clear-text password that is encoded by the
mkusers script, you should prefix it with '=', so:

NEWG_USERS = nguser -1 nguser -1 =nguser /home/nguser /bin/sh video,dialout Ng
user

As I believe the problem is solved if you add the '=', I will close this bug.
Please reopen if you still face problems.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
