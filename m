From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Jul 2015 15:38:21 +0000 (UTC)
Subject: [Buildroot] [Bug 8206] mplayer uses host xorg development files
In-Reply-To: <bug-8206-163@https.bugs.busybox.net/>
References: <bug-8206-163@https.bugs.busybox.net/>
Message-ID: <20150711153823.7BD6F7F89F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8206

--- Comment #5 from Bernd Kuhls <bernd.kuhls@t-online.de> 2015-07-11 15:38:21 UTC ---
Quoting
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/119274/focus=119720

console_log_bad_mplayer_rebuild.txt
<http://buildroot-busybox.2317881.n4.nabble.com/file/n105280/console_log_bad_mplayer_rebuild.txt>

> Checking for X11 headers presence ... no (check if the dev(el) packages are installed)
> Checking for X11 ... no (check if the dev(el) packages are installed)

console_log_good_mplayer_rebuild.txt
<http://buildroot-busybox.2317881.n4.nabble.com/file/n105280/console_log_good_mplayer_rebuild.txt>

> Checking for X11 headers presence ... yes 
> Checking for X11 ... yes 

It is clearly visible that mplayer, without my patch posted in this bug report,
picked up xorg headers from the host. I could reproduce the behaviour from
console_log_bad_mplayer_rebuild.txt, which is fixed with my patch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
