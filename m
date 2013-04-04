From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Apr 2013 14:52:28 +0000 (UTC)
Subject: [Buildroot] [Bug 6164] New: openvpn usage of ip tool from Busybox
Message-ID: <bug-6164-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6164

           Summary: openvpn usage of ip tool from Busybox
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: aleksandar.zivkovic at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Overview: wrong condition for openvpn configuration on ip application usage

Steps to Reproduce:
Build openvpn without selected package BR2_PACKAGE_IPROUTE2

Actual Results: 
Built application will seek for ip tool in path /bin/ip which is location of
BR2_PACKAGE_IPROUTE2. Location of Busybox version of ip is /sbin/ip

Expected Results:
If openvpn is build without selected package BR2_PACKAGE_IPROUTE2 it should
select Busybox version of ip: /sbin/ip.


Build Date & Platform: BR 2013.02

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
