From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 17:49:44 +0200
Subject: [Buildroot] [PATCH 1/1] aircrack-ng: bump to version 1.3
In-Reply-To: <20180717152906.28173-1-laurent.cans@gmail.com>
References: <20180717152906.28173-1-laurent.cans@gmail.com>
Message-ID: <20180718174944.1ec3577d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Jul 2018 17:29:06 +0200, Laurent Cans wrote:
> - Remove patches (already in version)
> - Add optional dependency to jemalloc
> 
> Signed-off-by: Laurent Cans <laurent.cans@gmail.com>

It seems like this new aircrack-ng version is using dlfcn.h, and
therefore requires dynamic library support. However, I am not sure it
is actually using dlfcn.h functionality, so it would be worth checking
this before adding a !BR2_STATIC_LIBS dependency.

See:

  http://autobuild.buildroot.net/results/e68/e684f8967a7c8cb14db1afa90e379a6d335ca0db/build-end.log

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
