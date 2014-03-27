From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Mar 2014 22:32:56 +0100
Subject: [Buildroot] [PATCH] Makefile: move fs/common.mk above
	external.mk
In-Reply-To: <1395944229.86315.YahooMailNeo@web28802.mail.ir2.yahoo.com>
 (Philippe Reynes's message of "Thu, 27 Mar 2014 18:17:09 +0000 (GMT)")
References: <1395583071-10016-1-git-send-email-tremyfr@yahoo.fr>
 <87ha6kk5bi.fsf@dell.be.48ers.dk>
 <1395944229.86315.YahooMailNeo@web28802.mail.ir2.yahoo.com>
Message-ID: <87ppl7gwdz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Philippe" == Philippe Reynes <tremyfr@yahoo.fr> writes:

 > Hi Peter,
 > I've done a little test before sending this patch.
 > I've used this useless fs :

 > define ROOTFS_USERFS_CMD
 >     echo "Nothing to do" ; \
 >     touch $@
 > endef

 > $(eval $(call ROOTFS_TARGET,userfs))

 > In the file $(BR2_EXTERNAL)/fs/common.mk

 > Without my patch, the file rootfs.userfs is not created.
 > With my patch, the file rootfs.userfs is created.

 > I could have missed something.
 > Do you have an idea of what may failed ?

The specific issue I mentioned was about the externally defined rootfs
getting created before target-purgelocales / target-generatelocales gets
called. The easiest way to check that is to use a glibc toolchain and
enable BR2_ENABLE_LOCALE_PURGE / BR2_GENERATE_LOCALE, and then stick an
echo statement in each of them.

-- 
Bye, Peter Korsgaard
