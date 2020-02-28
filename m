From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 28 Feb 2020 05:08:50 +0000
Subject: [Buildroot] [Bug 12586] New: avahi failure
Message-ID: <bug-12586-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12586

            Bug ID: 12586
           Summary: avahi failure
           Product: buildroot
           Version: 2019.11.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sam.petrocelli at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8376
  --> https://bugs.busybox.net/attachment.cgi?id=8376&action=edit
.config file

It seems some systemd services are failing to load on start up. In particular,
I get the following avahi error:

# systemctl status avahi-daemon.service[J
 avahi-daemon.service - Avahi mDNS/DNS-SD Stack
   Loaded: loaded (/usr/lib/systemd/system/avahi-daemon.service; enabled;
vendor preset: enabled)
   Active: failed (Result: exit-code) since Tue 2019-11-19 05:15:16 EST; 1h
13min ago
  Process: 1860 ExecStart=/usr/sbin/avahi-daemon -s (code=exited,
status=255/EXCEPTION)
 Main PID: 1860 (code=exited, status=255/EXCEPTION)

Nov 19 05:15:16 morepork systemd[1]: Starting Avahi mDNS/DNS-SD Stack...
Nov 19 05:15:16 morepork avahi-daemon[1860]: Failed to find user 'avahi'.
Nov 19 05:15:16 morepork systemd[1]: avahi-daemon.service: Main process exited,
code=exited, status=255/EXCEPTION
Nov 19 05:15:16 morepork systemd[1]: avahi-daemon.service: Failed with result
'exit-code'.
Nov 19 05:15:16 morepork systemd[1]: Failed to start Avahi mDNS/DNS-SD Stack.
Nov 19 05:15:16 morepork systemd[1]: avahi-daemon.service: Start request
repeated too quickly.
Nov 19 05:15:16 morepork systemd[1]: avahi-daemon.service: Failed with result
'exit-code'.
Nov 19 05:15:16 morepork systemd[1]: Failed to start Avahi mDNS/DNS-SD Stack.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
