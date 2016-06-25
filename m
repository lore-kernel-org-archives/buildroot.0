From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jun 2016 15:44:47 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: add fuse2fs libintl fix patch
In-Reply-To: <1466640574-12773-1-git-send-email-gustavo@zacarias.com.ar>
References: <1466640574-12773-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160625154447.21f20855@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jun 2016 21:09:34 -0300, Gustavo Zacarias wrote:

> +diff --git a/misc/Makefile.in b/misc/Makefile.in
> +index f67c9c7..e487692 100644
> +--- a/misc/Makefile.in
> ++++ b/misc/Makefile.in
> +@@ -389,7 +389,7 @@ fuse2fs: $(FUSE2FS_OBJS) $(DEPLIBS) $(DEPLIBBLKID) $(DEPLIBUUID) \
> + 	$(E) "	LD $@"
> + 	$(Q) $(CC) $(ALL_LDFLAGS) -o fuse2fs $(FUSE2FS_OBJS) $(LIBS) \
> + 		$(LIBFUSE) $(LIBBLKID) $(LIBUUID) $(LIBEXT2FS) $(LIBINTL) \

Isn't $(LIBINTL) supposed to contain -lintl ?

> +-		$(CLOCK_GETTIME_LIB)
> ++		$(CLOCK_GETTIME_LIB) $(SYSLIBS)

Why would -lintl be in $(SYSLIBS) instead of in $(LIBINTL) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
