From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Oct 2015 20:34:53 +0000 (UTC)
Subject: [Buildroot] [Bug 8401] New: gpsd 3.15 NMEA support
Message-ID: <bug-8401-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8401

           Summary: gpsd 3.15 NMEA support
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: kevin.alden2 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


There is a bug with gpsd 3.15 where is is impossible to compile in NMEA 0183
support.  It has been reported and resolved
(http://savannah.nongnu.org/bugs/?46082), but there has not yet been a release
for buildroot to pull in.

The following patch resolves the issue:


--- a/SConstruct    2015-06-03 10:09:31.000000000 -0400
+++ b/SConstruct    2015-09-30 13:41:54.372157623 -0400
@@ -95,7 +95,7 @@ imloads = True

 boolopts = (
     # GPS protocols
-    ("nmea0183",      True,  "NMEA0183 support"),
+    ("nmea",          True,  "NMEA0183 support"),
     ("ashtech",       True,  "Ashtech support"),
     ("earthmate",     True,  "DeLorme EarthMate Zodiac support"),
     ("evermore",      True,  "EverMore binary support"),

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
