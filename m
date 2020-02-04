From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 04 Feb 2020 07:01:43 +0000
Subject: [Buildroot] [Bug 12536] Linux-Headers extracting failure
In-Reply-To: <bug-12536-163@https.bugs.busybox.net/>
References: <bug-12536-163@https.bugs.busybox.net/>
Message-ID: <bug-12536-163-nSbeVo6KF6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12536

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
The extract command for e.g. RaspberryPi looks like the following:

gzip -d -c
<custom_path>/dl/linux/linux-64d0a9870ac14d5eb5253f67d984ae348eec1393.tar.gz |
<custom_path>/host/bin/tar --strip-components=1 -C
<custom_path>/build/linux-headers-custom   -xf -

Maybe try to re-name your tarball a little bit more meaningful.e.g.

/home/user/pi/my/dl/linux/tarball.tar

or (after compression)

/home/user/pi/my/dl/linux/tarball.tar.gz

-- 
You are receiving this mail because:
You are on the CC list for the bug.
