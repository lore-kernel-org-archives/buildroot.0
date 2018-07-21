From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 21 Jul 2018 05:43:10 +0000
Subject: [Buildroot] [Bug 11166] New: Erlang bad argument on valid uint64
 when crosscompiled on 64-bit host
Message-ID: <bug-11166-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11166

            Bug ID: 11166
           Summary: Erlang bad argument on valid uint64 when crosscompiled
                    on 64-bit host
           Product: buildroot
           Version: 2018.02
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: frankv at helium.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

We cross-compiled Erlang for a 32-bit ARM target on an x86 64-bit host.
We ran our Erlang application which uses bitcask on the target.
Shortly afterwards our application "crashed with reason: bad argument in call
to bitcask_nifs:keydir_get_int".

We cross-compiled Erlang for a 32-bit ARM target on an x86 32-bit host.
We ran our Erlang application which uses bitcask on the target.
Our application ran continuosly without crashing.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
