From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 13 Aug 2014 21:32:03 +0000 (UTC)
Subject: [Buildroot] [Bug 7262] Generating locale en_US.UTF-8 fails on 64bit
 fedora linux host
In-Reply-To: <bug-7262-163@https.bugs.busybox.net/>
References: <bug-7262-163@https.bugs.busybox.net/>
Message-ID: <20140813213203.E17239D43C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7262

--- Comment #7 from romain.naour at openwide.fr 2014-08-13 21:32:03 UTC ---
Created attachment 5564
  --> https://bugs.busybox.net/attachment.cgi?id=5564
Fedora 20 config.site file

Hi Thomas,

I found the issue, see the patch:
http://patchwork.ozlabs.org/patch/379752/

At the top of configure script output I had:
"configure: loading site script /usr/share/config.site"
(see attached file)

Without that, target/usr/lib/locale/ is used as expected.

I think this bug can be closed now :)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
