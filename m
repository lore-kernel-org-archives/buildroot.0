From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 22:47:17 +0100
Subject: [Buildroot] [PATCH 00/29] SELinux Buildroot Additions
In-Reply-To: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1418702062-61039-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150101224717.2a063a90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon, 15 Dec 2014 21:53:52 -0600, Matt Weber wrote:

> ### What's in this patchset?
> 
> This patchset adds the required userspace tools, libraries, example
> QEMU target, existing package modifications, and initial policy
> to Buildroot.

Thanks for this patch series. As you've seen, I've started integrating
the first patches. However, the tarballs are not located where
specified by your .mk file (the build worked in my
case because I had the tarballs locally). And the selinuxproject.org
site is down currently, so I can't fix anything. This is causing some
build failures such as:

  http://autobuild.buildroot.org/results/a95/a95412f8e78a64bbbf5a7981db35cdea0108e8b4/build-end.log

If we can't find an upstream location with those tarballs quickly, then
I'll disable those packages for now.

Also, it seems that Debian has libselinux 2.3, while your package is
still using 2.1. Would it be possible to bump to 2.3 at some point?

Finally, I have found what appears to be the new Git repository for the
SELinux development at https://github.com/SELinuxProject/selinux. And
it seems that now all components are in a single Git repository. Are
they still doing separate tarballs for each component? I have the
feeling that packaging separately checkpolicy, libselinux, libsemanage,
libsepol, policycoreutils and sepolgen is maybe not the way to go.

Can you clarify this before I spend more time merging more of your
patches?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
