From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 16:37:45 +0100
Subject: [Buildroot] [PATCH v3 1/1] libxmlrpc: bump to 1.39.11
In-Reply-To: <20161204153328.GA27936@collins.gmr.ssr.upm.es>
References: <CAM+bi4vAks48DSkjARGDsoMiG7p+X=+frremEZbjaQnG5GQHYw@mail.gmail.com>
 <1479207044-12290-1-git-send-email-alvaro.gamez@hazent.com>
 <20161204150600.0bfe0ead@free-electrons.com>
 <20161204153328.GA27936@collins.gmr.ssr.upm.es>
Message-ID: <20161204163745.459990e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 4 Dec 2016 16:33:28 +0100, Alvaro G. M. wrote:

> I already know the cause for this and the patch is simple.  However, before
> sending the proposed patch as a git am commitable email, I'd like to query
> about which shall be the best way to provide it.

Sure. Thanks a lot for having already investigated the problem.

> The issue is that this version of libxmlrpc includes new subdir libutils++,
> which requires c++ but without which the library can perform its function
> perfectly. The way to solve this then is to patch lib/Makefile as inlined
> below, making this directory compilable only if there's c++ support.
> 
> The question is: given that there is already a patch in buildroot called
> 0002-fix-non-cplusplus-build.patch which does exactly the same on a
> different file (lib/util/Makefile), should I modify this patch to include
> both changes, as the name and description of the patch is basically the
> same, or should I provide another .patch file for this to include under
> package/libxmlrpc?

Modifying the existing 0002-fix-non-cplusplus-build.patch is indeed the
right thing to do here.

Also, since you're interested in libxmlrpc, could you send the
different patches we have for this package to the upstream developers?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
