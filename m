From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 12 Aug 2014 22:09:24 +0000 (UTC)
Subject: [Buildroot] [Bug 7262] Generating locale en_US.UTF-8 fails on 64bit
 fedora linux host
In-Reply-To: <bug-7262-163@https.bugs.busybox.net/>
References: <bug-7262-163@https.bugs.busybox.net/>
Message-ID: <20140812220924.766349D37A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7262

--- Comment #5 from romain.naour at openwide.fr 2014-08-12 22:09:24 UTC ---
Created attachment 5558
  --> https://bugs.busybox.net/attachment.cgi?id=5558
strace log of localedef

I ThomasDS,

I have just give a try and I'm able to reproduce this issue with the latest
buildroot master on a Federa 20 64bits.

It seems that localedef can't create
"target/usr/lib64/locale/locale-archive.dRUlDK" file since the directory
"target/usr/lib64" doesn't exist.

When the symbolic link is created in target/usr/lib64 to target/usr/lib/, the
locale-archive.dRUlDK file is correctly created.

So yes, localedef fail to create a temporary file, not in
target/usr/share/locale but in target/usr/lib64/locale.

Here is the strace log of localedef.

I hope it can help you.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
