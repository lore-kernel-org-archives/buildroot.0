From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Oct 2016 22:13:41 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-vKCIcoIbKH@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

--- Comment #6 from Andrey Yurovsky <yurovsky@gmail.com> ---
I have SELinux but it's set to 'permissive' right now, nothing else is
configured differently from a standard Fedora 24 install.

ubi.mk rm's the ubinize.cfg file, if I comment that out it'll be left behind
and then:

$ stat output/build/ubinize.cfg 
  File: 'output/build/ubinize.cfg'
  Size: 124             Blocks: 8          IO Block: 4096   regular file
Device: fd03h/64771d    Inode: 1596887     Links: 1
Access: (0644/-rw-r--r--)  Uid: ( 1000/ayurovsky)   Gid: ( 1000/ayurovsky)
Context: unconfined_u:object_r:user_home_t:s0
Access: 2016-10-27 15:10:37.142923074 -0700
Modify: 2016-10-27 15:10:37.142923074 -0700
Change: 2016-10-27 15:10:37.142923074 -0700
 Birth: -

What I can't explain is that if instead I leave everything alone and just
insert a line like:

stat $(BUILD_DIR)/ubinize.cf

in ubi.mk (in its _CMD), stat reports that the path doesn't exist (as does
ubinize).  So why does it exist if I remove the last line in _CMD (the rm) but
it doesn't exist after the first line (the $(INSTALL)) ... ?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
