From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 May 2021 20:16:45 +0000
Subject: [Buildroot] [Bug 13791] The QEMU compiled by Buildroot does not
 support alsa or pulseaudio drivers for soundcard forwarding
In-Reply-To: <bug-13791-163@https.bugs.busybox.net/>
References: <bug-13791-163@https.bugs.busybox.net/>
Message-ID: <bug-13791-163-547c5C3pdS@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13791

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
You have to add host-alsa-lib and host-pulseaudio to the QEMU_DEPENDENCIES for
this to work. Buildroot does not want to depend on anything pre-installed on
the host (if you're OK with stuff that is pre-installed on the host, you can
just as well install qemu-system-arm, right?)

Of course, currently there is no host package for alsa-lib or pulseaudio, so
you'll have to add them first. And pulsaudio has dependencies for which no host
package exits either, so this will take a bit of work...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
