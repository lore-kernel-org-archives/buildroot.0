From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Sep 2015 11:25:10 +0000 (UTC)
Subject: [Buildroot] [Bug 8331] kexec fails due to missing /usr/sbin/shutdown
In-Reply-To: <bug-8331-163@https.bugs.busybox.net/>
References: <bug-8331-163@https.bugs.busybox.net/>
Message-ID: <20150915112510.8583B8083A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8331

--- Comment #10 from Dr I J Ormshaw <ian_ormshaw@waters.com> 2015-09-15 11:25:10 UTC ---
I was trying 

/usr/sbin/kexec --command-line="@kernelCommandLine@"
"${mountPoint}"/boot/@kernelName@

Using kexec -l followed bu kexec -e will not shut down services correctly.

but I think I should be able to use:

kexec -l 

followed by 

systemctl isolate kexec.target

to achieve what I want, as I think systemd should kexec the loaded kernel once
services are shutdown.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
