From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 05 Dec 2016 09:07:33 +0000
Subject: [Buildroot] [Bug 9466] New: VIM_REMOVE_DOCS removes rgb.txt
Message-ID: <bug-9466-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9466

            Bug ID: 9466
           Summary: VIM_REMOVE_DOCS removes rgb.txt
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sir.ferdek+buildroot at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

package/vim/vim.mk

define VIM_REMOVE_DOCS
        find $(TARGET_DIR)/usr/share/vim -type f -name "*.txt" -delete
endef

This removes file rgb.txt which is used by vim in syntax coloring.
Then, when vim tries to color it's output, you could see something in the sort
of:

Error detected while processing /usr/share/vim/vim80/syntax/syncolor.vim: 
line 46: 
E254: Cannot allocate color SlateBlue 
Press ENTER or type command to continue

-- 
You are receiving this mail because:
You are on the CC list for the bug.
