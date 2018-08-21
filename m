From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Aug 2018 08:23:26 +0000
Subject: [Buildroot] [Bug 11251] New: Util scanpypi failes when package
 change - to _ in tar file (Trunk)
Message-ID: <bug-11251-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11251

            Bug ID: 11251
           Summary: Util scanpypi failes when package change - to _ in tar
                    file (Trunk)
           Product: buildroot
           Version: 2018.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mzweerspenko+bugzilla at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

<Sympthon>

user at workstation:/data/bugreport/buildroot$ ./utils/scanpypi websocket-client
buildroot package name for websocket-client: python-websocket-client
Package: python-websocket-client
Fetching package websocket-client
Downloading package websocket-client from
https://files.pythonhosted.org/packages/bb/ae/4ff2ae1f722d0c23dc4cdf74a4e05b0d1bbe752dc28620b9fe05c53e61aa/websocket_client-0.51.0.tar.gz...
Traceback (most recent call last):
  File "./utils/scanpypi", line 721, in <module>
    main()
  File "./utils/scanpypi", line 670, in main
    package.load_setup()
  File "./utils/scanpypi", line 279, in load_setup
    os.chdir(self.tmp_extract)
OSError: [Errno 2] No such file or directory:
'/tmp/scanpypi-20A8aE/python-websocket-client/websocket-client-0.51.0'
user at workstation:/data/bugreport/buildroot$

</Sympthon>

<investigation>
Exciting path: 
/tmp/scanpypi-20A8aE/python-websocket-client/websocket_client-0.51.0/

Expected path: 
/tmp/scanpypi-20A8aE/python-websocket-client/websocket-client-0.51.0/

Difference is _ instead of -

</investigation>

<suggestion>
Maybe some regex or * can be used to allow both options.
</suggestion>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
