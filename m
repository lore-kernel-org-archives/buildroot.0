From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Apr 2021 07:46:33 +0000
Subject: [Buildroot] [Bug 13781] New: isc dhcp-server package don't create
 file /usr/bin/dhcpd
Message-ID: <bug-13781-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13781

            Bug ID: 13781
           Summary: isc dhcp-server package don't create file
                    /usr/bin/dhcpd
           Product: buildroot
           Version: 2021.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: kay.jeschonneck at airbus.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Overview: 

After activate the isc dhcp-server package, configure the dhcpd.conf, build the
system and flash it on the target i expect the dhcp-server start, but i doesn't
start. After some investigate i found that the /etc/init.d/S80dhcp-server file
check with this command "test -f /usr/sbin/dhcpd" if the file dhcpd exist but
it doesn't exist.

Steps to Reproduce:
  1. create enviroment
(https://github.com/kontron/buildroot-external-smarc-sal28)
  2. select "Target Packages/show packages that are also provided by busybox"
  3. select "Target Packages/Networking applications/dhcp (isc)" and "Target
Packages/Networking applications/dhcp (isc)/dhcp-server"
  4. build system

Actual Results:
  file "build/target/usr/sbin/dhcpd2", "./usr/sbin/dhcpd2" in
"build/images/rootfs.tar" not exist

Expected Results:
  file "build/target/usr/sbin/dhcpd2", "./usr/sbin/dhcpd2" in
"build/images/rootfs.tar" exist


Build Date & Hardware
  Build 30.04.2021 on Ubuntu 18.04.5 LTS
  Intel NUC, Intel Core i7-10710U

Additional Builds and Platforms:
  Kontron SMARC-sAL28 module

-- 
You are receiving this mail because:
You are on the CC list for the bug.
