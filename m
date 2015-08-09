From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  9 Aug 2015 22:27:59 +0000 (UTC)
Subject: [Buildroot] [Bug 8271] New: Buildroot wit x86_64 architecture fails
 to boot on qemu with kernels >=3.10
Message-ID: <bug-8271-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8271

           Summary: Buildroot wit x86_64 architecture fails to boot on
                    qemu with kernels >=3.10
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gleb at pomykalov.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Buildroot with x86_64 arch selected and kernels >=3.10 fails to boot on both
qemu and virtualbox.
Here is the kernel panic:
[    0.340000]  [<ffffffff813d207f>] extract_buf+0x8f/0x120
[    0.340000]  [<ffffffff813d06be>] ? account+0x13e/0x180
[    0.340000]  [<ffffffff813d250b>] ? xfer_secondary_pool+0x1b/0x60
[    0.340000]  [<ffffffff813d219c>] extract_entropy+0x8c/0x1c0
[    0.340000]  [<ffffffff8131a149>] ? vsnprintf+0x109/0x580
[    0.340000]  [<ffffffff81f8520a>] ? tc_action_init+0x55/0x55
[    0.340000]  [<ffffffff81325121>] ? bucket_table_alloc+0x111/0x1b0
[    0.340000]  [<ffffffff813d2586>] get_random_bytes+0x36/0x70
[    0.340000]  [<ffffffff81325121>] bucket_table_alloc+0x111/0x1b0
[    0.340000]  [<ffffffff81f8520a>] ? tc_action_init+0x55/0x55
[    0.340000]  [<ffffffff81f8520a>] ? tc_action_init+0x55/0x55
[    0.340000]  [<ffffffff81325467>] rhashtable_init+0x1c7/0x3e0
[    0.340000]  [<ffffffff81f8526b>] netlink_proto_init+0x61/0x15d
[    0.340000]  [<ffffffff810002c4>] do_one_initcall+0x84/0x1b0
[    0.340000]  [<ffffffff81f34fe7>] kernel_init_freeable+0x146/0x1d3
[    0.340000]  [<ffffffff818865d0>] ? rest_init+0x80/0x80
[    0.340000]  [<ffffffff818865d9>] kernel_init+0x9/0xf0
[    0.340000]  [<ffffffff818929d2>] ret_from_fork+0x42/0x70
[    0.340000]  [<ffffffff818865d0>] ? rest_init+0x80/0x80
[    0.340000] Code: 55 8b 0f 44 8b 4f 10 44 8b 57 08 48 89 e5 41 57 41 56 41
55
41 54 89 c8 53 8b 5f 0c c1 c0 05 44 8b 47 04 45 8d a4 01 99 79 82 5a <44> 0f 38
f0 1e 89 d8 44 31 d0 44 89 1a 44 21 c0 41 c1 c8 02 31
[    0.340000] RIP  [<ffffffff8131531b>] sha_transform+0x2b/0x1110
[    0.340000]  RSP <ffff88007d3e7c90>

I've tried different configuration, with various bootloaders, gcc, buildoot
versions. At the same time, i386 architecture works just great.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
