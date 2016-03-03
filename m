From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Mar 2016 21:09:48 +0000
Subject: [Buildroot] [Bug 8736] IPV6 forced on in busybox
In-Reply-To: <bug-8736-163@https.bugs.busybox.net/>
References: <bug-8736-163@https.bugs.busybox.net/>
Message-ID: <bug-8736-163-O16j3RTveM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8736

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Kenric Smith from comment #0)

Notice: I'm not against us removing the forced IPv6 (and just enable it in the
default defconfig instead). We should probably also do it for largefile now
that we always have that enabled, but I would like to understand what the
problem is you are seeing.

I did a quick test with qemu_arm_versatile_defconfig and the busybox defconfig
tweaked to enable the ntpd daemon, and everything seems to work OK here:

# date
Thu Jan  1 00:00:50 UTC 1970
# ntpd -d -n -p pool.ntp.org
ntpd: sending query to 77.243.43.213
ntpd: reply from 77.243.43.213: offset:+1457039097.162244 delay:0.036664
status:0x24 strat:2 refid:0xf00726c0 rootdelay:0.003418 reach:0x01
ntpd: sending query to 77.243.43.213
ntpd: reply from 77.243.43.213: offset:+1457039097.161038 delay:0.032410
status:0x24 strat:2 refid:0xf00726c0 rootdelay:0.003418 reach:0x03
ntpd: setting time to 2016-03-03 21:06:05.090957 (offset +1457039097.161038s)
ntpd: sending query to 77.243.43.213
ntpd: reply from 77.243.43.213: offset:+0.001327 delay:0.033226 status:0x24
strat:2 refid:0xf00726c0 rootdelay:0.003418 reach:0x07

-- 
You are receiving this mail because:
You are on the CC list for the bug.
