From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 25 Jun 2016 10:47:05 -0300
Subject: [Buildroot] [PATCH] e2fsprogs: add fuse2fs libintl fix patch
In-Reply-To: <20160625154447.21f20855@free-electrons.com>
References: <1466640574-12773-1-git-send-email-gustavo@zacarias.com.ar>
 <20160625154447.21f20855@free-electrons.com>
Message-ID: <576E8B59.8050802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/06/16 10:44, Thomas Petazzoni wrote:

> Hello,
>
> On Wed, 22 Jun 2016 21:09:34 -0300, Gustavo Zacarias wrote:
>
>> +diff --git a/misc/Makefile.in b/misc/Makefile.in
>> +index f67c9c7..e487692 100644
>> +--- a/misc/Makefile.in
>> ++++ b/misc/Makefile.in
>> +@@ -389,7 +389,7 @@ fuse2fs: $(FUSE2FS_OBJS) $(DEPLIBS) $(DEPLIBBLKID) $(DEPLIBUUID) \
>> + 	$(E) "	LD $@"
>> + 	$(Q) $(CC) $(ALL_LDFLAGS) -o fuse2fs $(FUSE2FS_OBJS) $(LIBS) \
>> + 		$(LIBFUSE) $(LIBBLKID) $(LIBUUID) $(LIBEXT2FS) $(LIBINTL) \
>
> Isn't $(LIBINTL) supposed to contain -lintl ?
>
>> +-		$(CLOCK_GETTIME_LIB)
>> ++		$(CLOCK_GETTIME_LIB) $(SYSLIBS)
>
> Why would -lintl be in $(SYSLIBS) instead of in $(LIBINTL) ?

Hi.
Apparently $(LIBINTL) is for bundled libintl support (internal dep), if 
it's external (normally out case) then it's in $(SYSLIBS).
Regards.
