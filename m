From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Jan 2020 12:50:11 +0000
Subject: [Buildroot] [Bug 12461] New: libglib2 build files with deep
 directory structure
Message-ID: <bug-12461-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12461

            Bug ID: 12461
           Summary: libglib2 build files with deep directory structure
           Product: buildroot
           Version: 2019.11.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: m.weisser.m at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

When building my current config it fails (to be more precise it hangs) when
trying to build libglib2

The last message is 

/xxxx/yyyyy/xxxxxxxx/yyyyyyyy/zz/xxx/yyyyyyy/zzzz/xxxx/yyyyyy/zzzzzzzzzzzzzzzzz/xxxxxx/yyyyy/zzzzz/xxxxxx/yyy/output/host/bin/meson:
line 3: __requires__: command not found

This is caused by the shebang in output/host/bin/meson

#!/xxxx/yyyyy/xxxxxxxx/yyyyyyyy/zz/xxx/yyyyyyy/zzzz/xxxx/yyyyyy/zzzzzzzzzzzzzzzzz/xxxxxx/yyyyy/zzzzz/xxxxxx/yyy/output/host/bin/python3

which has a length of 135 characters which is to long for the kernel. Any other
workaround besides reducing the directory nesting?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
