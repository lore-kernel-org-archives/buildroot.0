From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Oct 2017 11:21:43 +0000
Subject: [Buildroot] [Bug 10391] New: WiringPi retrieves wrong (old) version
Message-ID: <bug-10391-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10391

            Bug ID: 10391
           Summary: WiringPi retrieves wrong (old) version
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: srg.venema at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

WiringPi latest version is 2.44. Doing a manual git clone on
git://git.drogon.net/wiringPi does retrieve the latest 2.44 version, however
the buildroot packages retrieves 2.42, which does *NOT* work with newer
kernels.

Repeatable by doing:

[buildroot at build buildroot]$ make wiringpi-source
>>> wiringpi 2.44 Downloading
Doing shallow clone
Initialized empty Git repository in
/home/buildroot/buildroot-2017.08/output/build/.wiringpi-2.44.tar.gz.DZuokV/wiringpi-2.44/.git/
remote: Counting objects: 383, done.
remote: Compressing objects: 100% (333/333), done.
remote: Total 383 (delta 210), reused 56 (delta 16)
Receiving objects: 100% (383/383), 232.00 KiB, done.
Resolving deltas: 100% (210/210), done.
warning: Remote branch 2.44 not found in upstream origin, using HEAD instead
Could not fetch special ref '2.44'; assuming it is not special.
wiringpi-2.44.tar.gz: OK (sha256:
464c98ed54f5c0ad6611e270be3491c4598a32b7e86b208255862a301c564955)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
