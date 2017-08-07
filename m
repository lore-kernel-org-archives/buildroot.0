From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 07 Aug 2017 14:04:13 +0000
Subject: [Buildroot] [Bug 10176] New: Rsyslog's S01logging is deleted by
 Busybox.mk from TARGET
Message-ID: <bug-10176-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10176

            Bug ID: 10176
           Summary: Rsyslog's S01logging is deleted by Busybox.mk from
                    TARGET
           Product: buildroot
           Version: 2017.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mail at kkrach.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7166
  --> https://bugs.busybox.net/attachment.cgi?id=7166&action=edit
Do not remove S01logging

It seems that when no SYSLOGD is configured in Busybox, the file
$(TARGET_DIR)/etc/init.d/S01logging is removed during installation of Busybox.
But in case that rsyslog also has installed a S01logging, changing the Busybox
configuration will cause that the startscript of rsyslog is removed.

I ve checked busybox.mk and S01logging of rsyslog - and both seem to have the
problem also in the current Buildroot master. I'm working with 2017.02 and do
reproduce it only there.

Further more, I ve attached the patch with solves the problem for me. Normally,
the packages do not remove their startscript - so I ve removed the
startscript-removal as well.

BR, Karl

-- 
You are receiving this mail because:
You are on the CC list for the bug.
