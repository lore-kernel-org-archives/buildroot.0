From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 13 Dec 2017 10:53:17 +0000
Subject: [Buildroot] [Bug 10586] New: musl gcc has ifunc enabled when musl
 doesn't support it
Message-ID: <bug-10586-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10586

            Bug ID: 10586
           Summary: musl gcc has ifunc enabled when musl doesn't support
                    it
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: nathan.renniewaldock at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

musl doesn't support ifunc[1], so needs to be specifically disabled as it
defaults to enabled.

Test case[2]:

$ cat >a.c <<EOD
int main(){ return 0; }
EOD

$ gcc -o a a.c -latomic

$ ./a
Error relocating /lib/libatomic.so.1: __atomic_store_8: symbol not found
Error relocating /lib/libatomic.so.1: __atomic_exchange_8: symbol not found
Error relocating /lib/libatomic.so.1: __atomic_load_8: symbol not found
Error relocating /lib/libatomic.so.1: __atomic_compare_exchange_8: symbol not
found


[1] http://www.openwall.com/lists/musl/2014/11/11/2
[2] http://www.openwall.com/lists/musl/2015/11/17/9

(tested buildroot 2017.11)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
