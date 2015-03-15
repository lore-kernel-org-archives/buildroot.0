From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Mar 2015 18:02:39 +0000 (UTC)
Subject: [Buildroot] [Bug 7931] New: Default configuration for Cubieboard v1
	is outdated
Message-ID: <bug-7931-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7931

           Summary: Default configuration for Cubieboard v1 is outdated
           Product: buildroot
           Version: 2015.02
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mfld.fr at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The cubieboard_defconfig uses the linux-sunxi kernel v3.0.y, that fails early
during boot on a Cubieboard v1 (final revision).

The boot succeeds after switching to linux-sunxi v3.4.y kernel, as recommended
by this community on its wiki:
http://linux-sunxi.org/Linux_Kernel#Kernel_versions

Change proposal:

BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux-sunxi/linux-sunxi.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9a1cd034181af628d4145202289e1993c1687db6"
BR2_LINUX_KERNEL_VERSION="9a1cd034181af628d4145202289e1993c1687db6"
BR2_LINUX_KERNEL_PATCH=""

The commit 9a1cd03 is the latest (2014) of the v3.4.y branch.

I did not try the mainline kernel, because it is explicitly stated by Free
Electrons guys that the A10 NAND or multimedia caps are not yet supported.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
