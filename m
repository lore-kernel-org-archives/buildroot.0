From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 21 Jan 2021 20:22:38 +0000
Subject: [Buildroot] [Bug 13471] New: package/mpd/mpd.conf make use of path
 not created
Message-ID: <bug-13471-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13471

            Bug ID: 13471
           Summary: package/mpd/mpd.conf make use of path not created
           Product: buildroot
           Version: 2020.11.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: miohna at freenet.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

As I am new to buildroot I am not fully sure whether this is a bug or a
misunderstanding on my side...

The music player daemon config in package mpd makes use of files in folder
"/var/lib/mpd". However, this folder is not created by the makefile.

A simple "mkdir -p /var/lib/mpd" in mpd.mk may do. Maybe also adding the
subfolder "music", "playlists".

-- 
You are receiving this mail because:
You are on the CC list for the bug.
