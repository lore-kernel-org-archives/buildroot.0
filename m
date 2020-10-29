From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 29 Oct 2020 09:04:52 -0500
Subject: [Buildroot] [2020.02.x] package/busybox: fix build with glibc 2.31
Message-ID: <CANQCQpZvbwcpdhXsE90HUS10fmZrOtbeGAA82rMUWmUZnd0LGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

Would you mind picking over the following commit to add busybox glibc
2.31 support to the 2020.02LTS?

commit 13f2d688a24f47446af236829bd6ca194d5aea5b
Author: Carlos Santos <unixmania@gmail.com>
Date:   Sun Mar 22 14:13:01 2020 -0300
package/busybox: fix build with glibc 2.31

The known [1,2] issue was found when using a newer external toolchain
with the following configuration and the 2020.02.7 tag.
BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/tarballs/aarch64--glibc--stable-2020.08-1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y

Note: I'll have additional individual patches coming for openssh and
strace as those were fixed for a similar issue but through version
bumps on master.  Is there some backstory (beyond the patchwork
submissions for master) on other attempts to bring glibc 2.31 support
to LTS?

Best Regards,
Matt


Ref:
[1] http://lists.busybox.net/pipermail/buildroot/2020-February/272657.html
[2] https://patchwork.ozlabs.org/project/buildroot/list/?series=165949&archive=both&state=*
