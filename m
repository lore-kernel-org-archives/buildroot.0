From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  2 Mar 2015 07:40:46 +0000 (UTC)
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <20150302074046.685AF80464@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

--- Comment #9 from nroach44 at gmail.com 2015-03-02 07:40:44 UTC ---
(In reply to comment #8)
> (In reply to comment #7)
> > Further discussion with dywi on the IRC has led me to try Storage=volatile in
> > /etc/systemd/journald.conf and this solves the issue additionally. It seems to
> > be more "honest" as all /var/log/journal was getting written to was memory
> > anyway.
> 
> Can you provide more details about your testing setup? I cannot reproduce it
> here.
> 
> setup: (with current git head, 2015.02-rc3-31-gc9ba844)
> 
> - make qemu_arm_versatile_defconfig
> - change to external sourcery codebench 2014.05 toolchain, enable systemd)
> - run in qemu as explained in board/qemu/arm-versatile/readme.txt
> 

I used qemu_arm_versatile, enabled glibc and systemd (no code sourcery) and it
worked fine here too.

I'm not sure what other info I can provide; The x86 machine has all of it's
valid configuration info posted above. It's a IBM ThinkCentre 9210 with a
nocona Pentium D with 2 GiB of ram.

The ARM system is an Atmel sama5d3-xplained that's acting as my residential
gateway.

I'll see if I can reproduce this on a blank x86 config for the thinkcentre.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
