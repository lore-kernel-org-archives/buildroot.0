From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Feb 2014 22:52:35 +0100
Subject: [Buildroot] [PATCH] libv4l: fix build on AArch64
In-Reply-To: <1392932560-26817-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 20 Feb 2014 22:42:40 +0100")
References: <1392932560-26817-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ppmhwixo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > AArch64 does not implement the SYS_open system call, but only the
 > SYS_openat system call, as should be done for all modern architectures
 > merged into the Linux kernel. This causes problems when building
 > libv4l 0.8.9, which are fixed by integrating an upstream patch,
 > available in a more recent version of libv4l. Backporting the patch is
 > preferred over bumping libv4l, as libv4l has a fairly large number of
 > reverse dependencies, and we don't want to break anything that close
 > to the release.

 > Note that this commit also renames the existing libv4l-largefile.patch
 > to libv4l-01-largefile.patch in order to comply with the Buildroot
 > patch naming scheme, and guarantee the order in which patches are
 > applied.

 > Fixes:

 >   http://autobuild.buildroot.org/results/ed6/ed66792e332ee0256a17f98cbe21dfcfe6e8743b/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

A libv4l bump for next would be nice though ;)

-- 
Bye, Peter Korsgaard
