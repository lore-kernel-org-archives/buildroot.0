From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 Jan 2021 12:03:38 +0000
Subject: [Buildroot] [Bug 13456] New: ccache prevents build
Message-ID: <bug-13456-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13456

            Bug ID: 13456
           Summary: ccache prevents build
           Product: buildroot
           Version: 2020.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: frank-w at public-files.de
                CC: buildroot at uclibc.org
  Target Milestone: ---

i activated BR2_CCACHE=y and my build is broken with this error, seems like
optimization flag is not passed down to compiler

    Run Build Command(s):/usr/bin/make cmTC_72e6a/fast && make[1]: Entering
directory
'/home/runner/work/buildroot/buildroot/output/build/host-ninja-1.10.0/CMakeFiles/CMakeTmp'
    /usr/bin/make  -f CMakeFiles/cmTC_72e6a.dir/build.make
CMakeFiles/cmTC_72e6a.dir/build
    make[2]: Entering directory
'/home/runner/work/buildroot/buildroot/output/build/host-ninja-1.10.0/CMakeFiles/CMakeTmp'
    Building C object CMakeFiles/cmTC_72e6a.dir/testCCompiler.c.o
    /home/runner/work/buildroot/buildroot/output/host/bin/ccache   -O2
-I/home/runner/work/buildroot/buildroot/output/host/include  -o
CMakeFiles/cmTC_72e6a.dir/testCCompiler.c.o -c
/home/runner/work/buildroot/buildroot/output/build/host-ninja-1.10.0/CMakeFiles/CMakeTmp/testCCompiler.c
    /home/runner/work/buildroot/buildroot/output/host/bin/ccache: invalid
option -- 'O'
    Usage:
        ccache [options]
        ccache compiler [compiler options]
        compiler [compiler options]          (via symbolic link)

    Common options:
        -c, --cleanup             delete old files and recalculate size
counters
                                  (normally not needed as this is done
                                  automatically)
        -C, --clear               clear the cache completely (except
configuration)
        -F, --max-files=N         set maximum number of files in cache to N
(use 0
                                  for no limit)
        -M, --max-size=SIZE       set maximum size of cache to SIZE (use 0 for
no
                                  limit); available suffixes: k, M, G, T
(decimal)
                                  and Ki, Mi, Gi, Ti (binary); default suffix:
G
        -p, --show-config         show current configuration options in
                                  human-readable format
        -s, --show-stats          show summary of configuration and statistics
                                  counters in human-readable format
        -z, --zero-stats          zero statistics counters

        -h, --help                print this help text
        -V, --version             print version and copyright information

    Options for scripting or debugging:
            --dump-manifest=PATH  dump manifest file at PATH in text format
        -k, --get-config=K        print the value of configuration key K
            --hash-file=PATH      print the hash (<MD4>-<size>) of the file at
PATH
            --print-stats         print statistics counter IDs and
corresponding
                                  values in machine-parsable format
        -o, --set-config=K=V      set configuration item K to value V

    See also <https://ccache.dev>.
    CMakeFiles/cmTC_72e6a.dir/build.make:84: recipe for target
'CMakeFiles/cmTC_72e6a.dir/testCCompiler.c.o' failed
    make[2]: *** [CMakeFiles/cmTC_72e6a.dir/testCCompiler.c.o] Error 1
    make[2]: Leaving directory
'/home/runner/work/buildroot/buildroot/output/build/host-ninja-1.10.0/CMakeFiles/CMakeTmp'
    Makefile:140: recipe for target 'cmTC_72e6a/fast' failed

my repo/config:

https://github.com/frank-w/buildroot/blob/2020.11-bpi/configs/BPI-R2_defconfig

-- 
You are receiving this mail because:
You are on the CC list for the bug.
