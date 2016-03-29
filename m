From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Mar 2016 21:01:34 +0000
Subject: [Buildroot] [Bug 8831] New: image generation fails on host ZFS due
 to "no free space"
Message-ID: <bug-8831-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8831

            Bug ID: 8831
              Host: raspberrypi2
             Build: amd64 Debian GNU/Linux jessie with ZFS on Linux
           Summary: image generation fails on host ZFS due to "no free
                    space"
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: post at lespocky.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6411
  --> https://bugs.busybox.net/attachment.cgi?id=6411&action=edit
last output

I tried building master at 4a6602f77cfe429d1dfc4f36964240b7d4410c54 today with
only http://patchwork.ozlabs.org/patch/602668/ applied on top. The steps I did:

`make distclean`
`make raspberrypi2_defconfig`
`make menuconfig`
activate dropbear with default options
`make`

Build fails with genext2fs not being able to allocate a block. (See pasted
output in attachement.)

The host is a quite usual Debian stable (jessie) on amd64 but with ZFS by
zfsonlinux as filesystem. The volume has no compression or dedup options set.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
