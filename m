From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Oct 2018 09:43:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: dri i965 driver needs
 headers >= 3.18
In-Reply-To: <20181001144238.9459-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 1 Oct 2018 16:42:38 +0200")
References: <20181001144238.9459-1-bernd.kuhls@t-online.de>
Message-ID: <8736tnzd9r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Since
 > https://cgit.freedesktop.org/mesa/mesa/commit/src/intel/tools/aubinator.c?h=18.2&id=3228335b55c300cd07c4aa69329e58e70afae6a8
 > the dri i965 driver needs linux/memfd.h which is not available in kernel
 > headers older than 3.18:
 > https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/include/uapi/linux/memfd.h?id=refs/tags/v3.18.36

 > Fixes
 > http://autobuild.buildroot.net/results/5aa/5aac9e9cad789da11b05cbf5d2a5e3f3cf8f1614/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > Although the autobuilders only detected the build error with mesa3d
 > 18.2.0 I could reproduce the problem with version 18.2.1 as well.

uapi/linux/memfd.h seems to be added by:

commit 9183df25fe7b194563db3fec6dc3202a5855839c
Author: David Herrmann <dh.herrmann@gmail.com>
Date:   Fri Aug 8 14:25:29 2014 -0700

    shm: add memfd_create() syscall

Which was added as part of the 3.17 cycle:

git describe --contains 9183df25fe7b194563db3fec6dc3202a5855839c
v3.17-rc1~73^2~22

So I've changed it to 3.17 and committed, thanks.

-- 
Bye, Peter Korsgaard
