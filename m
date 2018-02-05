From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 05 Feb 2018 17:35:15 +0000
Subject: [Buildroot] [Bug 10141] Squashfs extended attribute failures
In-Reply-To: <bug-10141-163@https.bugs.busybox.net/>
References: <bug-10141-163@https.bugs.busybox.net/>
Message-ID: <bug-10141-163-P4OJAJCSUe@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10141

--- Comment #11 from Bob <cmg427@hotmail.com> ---
(In reply to Yann E. MORIN from comment #10)

I'm using fakeroot version 1.20.2 on Ubuntu 16.04.

I'm not sure if this helps, but this is what the code looks like.

    squashfuse first.sqsh first_mount
    squashfuse second.sqsh second_mount

    # overlay multiple mounts
    unionfs-fuse -o cow,hide_meta_files first_mount=RW:second_mount=RO
final_mount

    # set capabilities
    fakeroot setcap cap_linux_immutable final_mount/usr/blah.txt

    # create final squash
    fakeroot mksquashfs final_mount final.sqsh -no-progress -noappend -comp xz

-- 
You are receiving this mail because:
You are on the CC list for the bug.
