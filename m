From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Mar 2016 21:05:45 +0000
Subject: [Buildroot] [Bug 8736] IPV6 forced on in busybox
In-Reply-To: <bug-8736-163@https.bugs.busybox.net/>
References: <bug-8736-163@https.bugs.busybox.net/>
Message-ID: <bug-8736-163-Yw8am9oihc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8736

--- Comment #2 from Kenric Smith <ksmith@aesaustin.com> ---
Sorry for the confusion.  Busybox is acting as it should, the issue is that
Buildroot is telling Busybox to enable IPV6 no matter what.  For Buildroot
systems where IPV6 is not enabled (in the kernel), Buildroot shouldn't enable
IPV6 in Busybox.

Previously it appears that IPV6 was a Buildroot configuration option and that
option was properly being passed into Busybox.  When that option was removed,
IPV6 was forced on in Busybox by the Buildroot configuration.

The patch attached just allows Busybox to be configured or not for IPV6, in the
menuconfig option of Busybox, instead of forcing it to be enabled in Busybox.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
