From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 Jul 2016 17:11:58 +0000
Subject: [Buildroot] [Bug 9101] New: Error on support/download/git with
 system git older than 1.8.4
Message-ID: <bug-9101-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9101

            Bug ID: 9101
           Summary: Error on support/download/git with system git older
                    than 1.8.4
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: eocanha at igalia.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 6556
  --> https://bugs.busybox.net/attachment.cgi?id=6556&action=edit
Proposed patch

A recent commit[1] in the git downloader uses the "--no-patch" option, which
appeared on git 1.8.4. Systems with older git versions show an error and fall
back to the wget downloader, which isn't suitable for all the cases.

I'm attaching a one-line patch which uses a "git log" variant and works on
older systems.

[1]
https://github.com/buildroot/buildroot/commit/3abd5ba4243489b821d44e407528020cd8a138f8#diff-75410bcfefacf16bcd60a2a6ac77c433R73

-- 
You are receiving this mail because:
You are on the CC list for the bug.
