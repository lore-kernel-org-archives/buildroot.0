From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Nov 2014 23:02:55 +0000 (UTC)
Subject: [Buildroot] [Bug 7628] Python SSL does not get built for Raspberry
	Pi
In-Reply-To: <bug-7628-163@https.bugs.busybox.net/>
References: <bug-7628-163@https.bugs.busybox.net/>
Message-ID: <20141113230255.0B6F3AEF93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7628

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-13 23:02:54 UTC ---
Can you give your exact Buildroot .config? I've built the following defconfig
here:

BR2_arm=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_SSL=y

And I definitely do have the _ss.cpython-34m.so library built:

# find / -name '_ssl*'
/usr/lib/python3.4/lib-dynload/_ssl.cpython-34m.so

However, when I try to use the ssl module, it complains of an undefined
instruction:

# python
Python 3.4.1 (default, Nov 13 2014, 22:55:45) 
[GCC 4.8.3] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import ssl
python (528): undefined instruction: pc=769e536c
Code: 00000000 f26ee1fe e12fff1e ee190f1d (e12fff1e) 
>>> 

So there is indeed an issue, but it does not appear to be the issue you
reported.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
