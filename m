From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Mar 2011 16:04:53 +0000 (UTC)
Subject: [Buildroot] [Bug 3391] New: Add support for specifying an external
	kernel tree
Message-ID: <bug-3391-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3391

           Summary: Add support for specifying an external kernel tree
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mort at bork.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 3079
  --> https://bugs.busybox.net/attachment.cgi?id=3079
external kernel tree patch

I didn't get any comments from the list, so I'm posting this here so I doesn't
get lost.  One thing that I changed from my original post is to conditionally
create
the .stamp_{downloaded,extracted,patched} files.  Doing do unconditionally
causes unnecessary invocation of make in the kernel directory during each
rebuild.

From my RFC e-mail to the buildroot list:

I wanted to compile a kernel from an external git tree, so adding
support for using this tree as the kernel source for buildroot
seemed logical.

The thing I'm seeking comments on is my short-circuiting of
the .stamp_{downloaded,extraced,patched} bits.  Can someone
suggest a more elegant way of doing this?

..I removed patching support, since you should probably be using
some other tool to manage patches in the external tree anyways.

Comments appreciated

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
