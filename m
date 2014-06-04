From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Jun 2014 21:10:16 +0000 (UTC)
Subject: [Buildroot] [Bug 7166] hostapd: segfault when using RT5370
In-Reply-To: <bug-7166-163@https.bugs.busybox.net/>
References: <bug-7166-163@https.bugs.busybox.net/>
Message-ID: <20140604211016.818019CE97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7166

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> 2014-06-04 21:10:15 UTC ---
In this particular case it is simple as the commit applies to the 2.1 release
without problems, so something like:

git clone git://w1.fi/hostap.git && cd hostapd
git format-patch -s 334ec001bbd^..334ec001bbd
0001-Fix-Beacon-RX-before-AP-setup-completion.patch
cp 0001-*patch
/path/to/buildroot/package/hostapd/hostapd-0001-Fix-Beacon-RX-before-AP-setup-completion.patch

I've committed this to git:

http://git.buildroot.net/buildroot/commit/?id=f3a12bc334d4673df

Could you please verify that it solves your issue?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
