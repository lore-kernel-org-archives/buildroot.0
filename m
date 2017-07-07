From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jul 2017 20:16:43 +0200
Subject: [Buildroot] [PATCH 1/1] capnproto: new package
In-Reply-To: <20170707173911.GA26346@sunra>
References: <201707061544.v66FiZQQ020306@mx1.sonologic.net>
 <20170706211612.5c4bf11c@windsurf.lan>
 <A9C99900-5E84-4FF4-9980-DBB39ED471AA@sonologic.nl>
 <20170707094443.3de6a9e0@windsurf.lan>
 <20170707173911.GA26346@sunra>
Message-ID: <20170707201643.79454a0c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 7 Jul 2017 19:39:11 +0200, Koen Martens wrote:

> It's a temporary patch anyway, i have an open merge request with
> upstream.
> 
> Anyway, i'm trying to utils/test-pkg capnproto with
> CAPNPROTO_AUTORECONF = YES, but get failures such as:
> 
> /bin/bash:
> /home/gmc/br-test-pkg/armv5-ctng-linux-gnueabi/host/bin/autoreconf: No
> such file or directory
> 
> Interestingly,
> /home/gmc/br-test-pkg/armv5-ctng-linux-gnueabi/host/usr/bin/autoreconf
> does exist, so with usr/bin instead of bin.

Are you doing completely clean builds here? If you have already done a
run of test-pkg before, make sure to clean up the build folders.

We have recently moved $(HOST_DIR)/usr to $(HOST_DIR), and it seems
like you have a mix of things before and after this change.

If that still doesn't work after a full rebuild, let us know, there
might be a real bug somewhere, though I would assume the autobuilders
would have caught such an obvious problem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
