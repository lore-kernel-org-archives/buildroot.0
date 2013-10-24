From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Oct 2013 13:19:50 +0000 (UTC)
Subject: [Buildroot] [Bug 6608] New: ebtables missing ethertypes - fix
	included
Message-ID: <bug-6608-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6608

           Summary: ebtables missing ethertypes - fix included
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cassiano at idbinfo.com.br
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


ebtables installer macro does not copy ethertypes file.

As result, you cant use readable characters instead of hexadecimal numbers for
the protocols. For example, 0x0800 will be represented by IPV4.

Add to the install macro the following command to fix:

cp $(@D)/ethertypes $(TARGET_DIR)/etc/ethertypes

Thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
