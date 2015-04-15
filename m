From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 15 Apr 2015 18:15:20 +0000 (UTC)
Subject: [Buildroot] [Bug 8016] New: collectd fails to build,
 network.c:171:19: error: 'IPV6_MULTICAST_HOPS' undeclared
Message-ID: <bug-8016-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8016

           Summary: collectd fails to build, network.c:171:19: error:
                    'IPV6_MULTICAST_HOPS' undeclared
           Product: buildroot
           Version: 2015.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: kdankwardt at xpliant.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 5996
  --> https://bugs.busybox.net/attachment.cgi?id=5996
The buildroot .config file

Trying to build an x86_64 toolchain on x86_64.



make[5]: Entering directory
'/home/kevin/x86_64-toolchain/buildroot/output/build/collectd-5.4.2/src/libcollectdclient'
  CC       libcollectdclient_la-client.lo
  CC       libcollectdclient_la-network.lo
  CC       libcollectdclient_la-network_buffer.lo
network.c: In function 'server_open_socket':
network.c:171:19: error: 'IPV6_MULTICAST_HOPS' undeclared (first use in this
function)
         optname = IPV6_MULTICAST_HOPS;
                   ^
network.c:171:19: note: each undeclared identifier is reported only once for
each function it appears in
network.c:173:19: error: 'IPV6_UNICAST_HOPS' undeclared (first use in this
function)
         optname = IPV6_UNICAST_HOPS;
                   ^
Makefile:570: recipe for target 'libcollectdclient_la-network.lo' failed

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
