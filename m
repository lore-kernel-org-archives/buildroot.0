From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Jul 2018 09:43:24 +0000
Subject: [Buildroot] [Bug 11141] WF111 package no longer availabe
In-Reply-To: <bug-11141-163@https.bugs.busybox.net/>
References: <bug-11141-163@https.bugs.busybox.net/>
Message-ID: <bug-11141-163-haJHAUL5NI@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11141

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Why are they broken? Buildroot should fall back to the copy we have on
sources.buildroot.net:

https://www.silabs.com/documents/login/software/wf111-linux-driver-5-2-2-r3-armv5te.tar.gz
Resolving www.silabs.com (www.silabs.com)... 23.53.20.107
Connecting to www.silabs.com (www.silabs.com)|23.53.20.107|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-07-10 11:33:42 ERROR 404: Not Found.

--2018-07-10 11:33:42-- 
http://sources.buildroot.net/wf111/wf111-linux-driver-5-2-2-r3-armv5te.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.27.167.48,
104.27.166.48, 2400:cb00:2048:1::681b:a730, ...
Connecting to sources.buildroot.net
(sources.buildroot.net)|104.27.167.48|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2018-07-10 11:33:43 ERROR 404: Not Found.

--2018-07-10 11:33:43-- 
http://sources.buildroot.net/wf111-linux-driver-5-2-2-r3-armv5te.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.27.167.48,
104.27.166.48, 2400:cb00:2048:1::681b:a730, ...
Connecting to sources.buildroot.net
(sources.buildroot.net)|104.27.167.48|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2743425 (2.6M) [application/x-gtar-compressed]


With that said, updating to -4 is also fine. Do notice that they apparently
haven't released a -4 x86 version:

wget
https://www.silabs.com/documents/login/software/wf111-linux-driver-5-2-2-r4-x86.tar.gz
--2018-07-10 11:34:37-- 
https://www.silabs.com/documents/login/software/wf111-linux-driver-5-2-2-r4-x86.tar.gz
Resolving www.silabs.com (www.silabs.com)... 23.53.20.107
Connecting to www.silabs.com (www.silabs.com)|23.53.20.107|:443... connected.
HTTP request sent, awaiting response... 404 Not Found

What is this wpa-supplicant patch about? Is this something new for -4? Where
can this patch be found?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
