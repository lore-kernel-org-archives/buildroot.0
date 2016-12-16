From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Dec 2016 18:17:36 +0000
Subject: [Buildroot] [Bug 9481] New: NetworkManager/Ping unable to resolve
	domains
Message-ID: <bug-9481-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9481

            Bug ID: 9481
           Summary: NetworkManager/Ping unable to resolve domains
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: nnabavian at sonendo.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

NetworkManager/Ping fails to resolve domain names, responds with "bad address".

This issue was seen on arm imx6 with ipv6.

By default NetworkManager.conf has set dns=dnsmasq
Although dnsmasq was not built as a part of the packages.

This issue was fixed by setting dns=none.

Also, the resolve.conf was a broken link.
This was fixed by reestablishing the symlink to the proper path.

ln -s /run/NetworkManager/resolv.conf /etc/resolv.conf


With theses changes NetworkManager was able to ping and resolve domains names.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
