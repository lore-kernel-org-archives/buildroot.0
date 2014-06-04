From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Jun 2014 03:00:22 +0000 (UTC)
Subject: [Buildroot] [Bug 7166] New: hostapd: segfault when using RT5370
Message-ID: <bug-7166-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7166

           Summary: hostapd: segfault when using RT5370
           Product: buildroot
           Version: 2014.05
          Platform: Macintosh
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jmavermeulen at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


hostapd crashes with segfault when using RT5370. This is because the driver
reports Beacon RX prior to hostapd having completed the AP mode setup. This bug
is reported and fixed here:
http://hostap.epitest.fi/cgit/hostap/commit/?id=334ec001bbd31c5bc83d6593e58dfbbf6b8785a2

I changed the source and version in the hostapd package to the mentioned commit
on the git repository and everything works again. I don't think however that
this is the right way of fixing this. Should I make a patch and file this or
something? At least until hostapd is updated?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
