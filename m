From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 16:51:34 +0100
Subject: [Buildroot] [PATCH v4 00/27] SELinux Buildroot Additions
In-Reply-To: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150110165134.617b741c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Fri,  9 Jan 2015 09:11:01 -0600, Matt Weber wrote:

> ### What's SELinux?
> 
> Security-Enhanced Linux (SELinux) is a Linux feature that provides
> a variety of security policies, including U.S. Department of Defense
> style mandatory access controls (MAC), through the use of Linux
> Security Modules (LSM) in the Linux kernel. It is not a Linux
> distribution, but rather a set of modifications that can be applied
> to Unix-like operating systems, such as Linux and BSD.

Thanks for your persistence with this major effort. I must say overall
I am still a bit scared by the amount of patches needed in the various
SELinux components to get them to behave properly in a
cross-compilation environment, and I believe those changes should be
submitted upstream.

I made the exact same comment back when you submitted the first
version in September 2013, but apparently no work has been done to
improve upstream with regarding to cross-compilation. I'm certainly not
asking for the entire work to be done. But the fact that within the 1.5
years since you first submitted this patch series, you have apparently
not worked with upstream to resolve those issues does not make me very
comfortable. What tells me that this upstreaming work will start at
some point?

Main examples:

 - The Swig / setools patch. This patch is quite long, but fairly
   trivial. Why hasn't it been submitted upstream?

 - Clearly, the thing that scares me the most if the replacement of the
   audit header generation by a Python script. Can we get at least some
   feedback from upstream on what approach they could accept? See also
   what Yocto is doing to solve this problem:
   http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/tree/recipes-security/audit/audit/audit-for-cross-compiling.patch

Can you give me your plans about upstreaming those cross-compilation
changes?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
