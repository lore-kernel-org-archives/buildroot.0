From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 20 Jan 2021 14:15:22 +0000
Subject: [Buildroot] [Bug 13466] New: creation of bridge interface via
 interfaces does not work
Message-ID: <bug-13466-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13466

            Bug ID: 13466
           Summary: creation of bridge interface via interfaces does not
                    work
           Product: buildroot
           Version: 2020.11.1
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

Hi,

i try to add bridge-interface via interfaces file (overlay_rootfs), but i got
only an error on bootup.

Cannot find device "br0"

bridge-related part of interfaces-file (config of lan0 also there and this
works)

auto lan1
iface lan1 inet manual
auto lan2
iface lan2 inet manual

auto br0
iface br0 inet static
    address 192.168.40.1
    netmask 255.255.255.0
    bridge_ports lan1 lan2
    bridge_fd 5
    bridge_stp no

also posted a question at stack-overflow because this is maybe no bug as it
looks like for me
https://unix.stackexchange.com/questions/629714/buildroot-adding-bridge-via-interfaces

of course i have added bridge-utils package and can add the bridge manually,
but not via /etc/network/interfaces file

regards Frank

-- 
You are receiving this mail because:
You are on the CC list for the bug.
