From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Mar 2016 21:17:57 +0000
Subject: [Buildroot] [Bug 8736] IPV6 forced on in busybox
In-Reply-To: <bug-8736-163@https.bugs.busybox.net/>
References: <bug-8736-163@https.bugs.busybox.net/>
Message-ID: <bug-8736-163-qx14k4mxeB@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8736

--- Comment #5 from Kenric Smith <ksmith@aesaustin.com> ---
I should have added, with the patch enabled, I get this behavior:

[root ~]# nslookup ntp.vt.edu
Server:    *******
Address 1: *******

Name:      ntp.vt.edu
Address 1: (null)
Address 2: 198.82.247.51 ntp-1.vt.edu
Address 3: 198.82.247.131 ntp-4.vt.edu
Address 4: 198.82.247.108 ntp-3.vt.edu
Address 5: 198.82.247.71 ntp-2.vt.edu

[root ~]# ntpd -w -d -p ntp.vt.edu
ntpd: sending query to 198.82.247.131
ntpd: reply from 198.82.247.131: offset:+21623.503688 delay:0.048829
status:0x24 strat:2 refid:0xa4f752c6 rootdelay:0.000381 reach:0x01

-- 
You are receiving this mail because:
You are on the CC list for the bug.
