From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Jul 2009 17:03:13 +0000 (UTC)
Subject: [Buildroot] [Bug 473] memstat_0.5.tar.gz has install with -D and
 that fails "make" (last buildroot git)
In-Reply-To: <bug-473-163@https.bugs.busybox.net/>
References: <bug-473-163@https.bugs.busybox.net/>
Message-ID: <20090720170313.AD57B77740@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=473





--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2009-07-20 17:03:13 UTC ---
Indeed this directory is $(TARGET_DIR), which contains the filesystem as it
will be on the target (with a few differences, like missing device files, not
created in this directory since device files can only be created by the root
user).

The etc/ directory in $(TARGET_DIR) is supposed to be created because the
target root filesystem is initially filled with the contents of
target/generic/target_skeleton/.

So, not sure what's happening in your case. Nothing looks odd in your .config.
Can you run a full build from scratch, and send the corresponding log ?

Something like :

rm -rf build_powerpc
rm -rf toolchain_build_powerpc
rm -rf project_build_powerpc
rm -rf binaries
make 2>&1 | tee /tmp/buildroot.log

and send us the buildroot.log file.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
