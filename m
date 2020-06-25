From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Jun 2020 17:20:10 +0000
Subject: [Buildroot] [Bug 13041] unable to build opus when using thumb
 instructions on arm926t
In-Reply-To: <bug-13041-163@https.bugs.busybox.net/>
References: <bug-13041-163@https.bugs.busybox.net/>
Message-ID: <bug-13041-163-mGcyHDsih7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13041

--- Comment #1 from Adam Duskett <aduskett@gmail.com> ---
(In reply to Evgeny from comment #0)
Hello;

It looks like opusfile is still selected in your config which depends on opus.

You can check the reverse dependencies of a selected package with:

make ${pkg}-graph-rdepends


My suggestion would be to unselect opusfile in target packages -> libraries ->
audio/sound and then unselect opus in the same place.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
