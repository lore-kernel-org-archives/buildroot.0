From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 08 Sep 2011 10:16:50 +0200
Subject: [Buildroot] [git commit] busybox: add 1.19.x branch and cleanup
In-Reply-To: <20110906195720.696858D447@busybox.osuosl.org>
References: <20110906195720.696858D447@busybox.osuosl.org>
Message-ID: <1315469814.4333.2.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2011-09-06 at 21:53 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=3f346b7b858447ebee57842a409eb6376acd93ff
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Add busybox version 1.19.2 for the 1.19.x branch.
> Remove deprecated 1.15.x branch.
> Mark 1.16.x and 1.17.x branches deprecated as suggested by Thomas.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> 
> Patch is too large, so refusing to show it

I've updated buildroot from git today and changed the config to use
busybox 1.19.2. Now compilation fails with the following error:

In file included from miscutils/ubi_tools.c:63:
/home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:329: error: conflicting types for ?__packed?
/home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:313: error: previous declaration of ?__packed? was here
/home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:371: error: conflicting types for ?__packed?
/home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:313: error: previous declaration of ?__packed? was here
/home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:386: error: conflicting types for ?__packed?
/home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:313: error: previous declaration of ?__packed? was here
/home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:398: error: conflicting types for ?__packed?
/home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:313: error: previous declaration of ?__packed? was here
/home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:412: error: conflicting types for ?__packed?
/home/sven/git/buildroot/output/toolchain/linux/include/mtd/ubi-user.h:313: error: previous declaration of ?__packed? was here
make[2]: *** [miscutils/ubi_tools.o] Error 1
make[1]: *** [miscutils] Error 2


Sven
