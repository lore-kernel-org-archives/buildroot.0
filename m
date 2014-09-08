From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  8 Sep 2014 18:49:42 +0000 (UTC)
Subject: [Buildroot] [Bug 7370] New: ngrep - requires --with-pcap-includes
 fully defined to find bpf.h
Message-ID: <bug-7370-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7370

           Summary: ngrep - requires --with-pcap-includes fully defined to
                    find bpf.h
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: lonnie at abelbeck.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


For the ngrep package, with the following change:
--
-    --with-pcap-includes=$(STAGING_DIR)/usr/include \
+    --with-pcap-includes=$(STAGING_DIR)/usr/include/pcap \
--

The bpf.h include file is now properly found, such that the following are
defined in config.h:
--
#define HAVE_DLT_RAW 1
#define HAVE_DLT_LOOP 1
#define HAVE_DLT_LINUX_SLL 1
#define HAVE_DLT_IEEE802_11 1
#define HAVE_DLT_IEEE802_11_RADIO 1
--

One benefit is that "ngrep -d any" now works since HAVE_DLT_LINUX_SLL is
defined.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
