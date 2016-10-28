From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 28 Oct 2016 08:15:20 +0000
Subject: [Buildroot] [Bug 9201] Permission denied make: ***
 [core-dependencies] Error 126 in Buildroot-2015.08.1
In-Reply-To: <bug-9201-163@https.bugs.busybox.net/>
References: <bug-9201-163@https.bugs.busybox.net/>
Message-ID: <bug-9201-163-BZaH5w8Cvb@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9201

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This is an issue on your side: all files that have execution permissions no
longer have execution permissions. So you did something wrong when extracting
the Buildroot tarball.

I just verified the 2015.08.1 tarball, and the files causing an issue on your
side are correct in the tarball:

thomas at skate:/tmp$ tar tvf buildroot-2015.08.1.tar.gz  | grep config.guess
-rwxrwxr-x root/root     45297 2015-09-06 22:57
buildroot-2015.08.1/support/gnuconfig/config.guess

thomas at skate:/tmp$ tar tvf buildroot-2015.08.1.tar.gz  | grep check-host-tar.sh
-rwxrwxr-x root/root      1017 2015-09-06 22:57
buildroot-2015.08.1/support/dependencies/check-host-tar.sh

-- 
You are receiving this mail because:
You are on the CC list for the bug.
