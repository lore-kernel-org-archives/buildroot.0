From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 21 Sep 2019 14:16:23 +0000
Subject: [Buildroot] [Bug 12246] New: host-policycoreutils-graph-depends
 fails
Message-ID: <bug-12246-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12246

            Bug ID: 12246
           Summary: host-policycoreutils-graph-depends fails
           Product: buildroot
           Version: 2019.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

$ make host-policycoreutils-graph-depends
Getting dependency tree...
Traceback (most recent call last):
  File "/home/thomas/projets/buildroot/support/scripts/graph-depends", line
357, in <module>
    sys.exit(main())
  File "/home/thomas/projets/buildroot/support/scripts/graph-depends", line
341, in main
    dict_deps = remove_extra_deps(dict_deps, rootpkg, args.transitive,
arrow_dir)
  File "/home/thomas/projets/buildroot/support/scripts/graph-depends", line
170, in remove_extra_deps
    if d not in deps[rootpkg]:
KeyError: 'host-policycoreutils'
make[1]: *** [package/policycoreutils/policycoreutils.mk:100:
host-policycoreutils-graph-depends] Error 1
make: *** [Makefile:84: _all] Error 2

-- 
You are receiving this mail because:
You are on the CC list for the bug.
