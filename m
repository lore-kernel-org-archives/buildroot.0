From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 5 May 2014 09:47:14 +0200
Subject: [Buildroot] [PATCH] Makefile: move fs/common.mk above
	external.mk
In-Reply-To: <87ppl7gwdz.fsf@dell.be.48ers.dk>
References: <1395583071-10016-1-git-send-email-tremyfr@yahoo.fr>
 <87ha6kk5bi.fsf@dell.be.48ers.dk>
 <1395944229.86315.YahooMailNeo@web28802.mail.ir2.yahoo.com>
 <87ppl7gwdz.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LVkhqmCuHcaA859otdpFrDu9vEPh-UBrnj28kJ6YnYkWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Mar 27, 2014 at 10:32 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Philippe" == Philippe Reynes <tremyfr@yahoo.fr> writes:
>
>  > Hi Peter,
>  > I've done a little test before sending this patch.
>  > I've used this useless fs :
>
>  > define ROOTFS_USERFS_CMD
>  >     echo "Nothing to do" ; \
>  >     touch $@
>  > endef
>
>  > $(eval $(call ROOTFS_TARGET,userfs))
>
>  > In the file $(BR2_EXTERNAL)/fs/common.mk
>
>  > Without my patch, the file rootfs.userfs is not created.
>  > With my patch, the file rootfs.userfs is created.
>
>  > I could have missed something.
>  > Do you have an idea of what may failed ?
>
> The specific issue I mentioned was about the externally defined rootfs
> getting created before target-purgelocales / target-generatelocales gets
> called. The easiest way to check that is to use a glibc toolchain and
> enable BR2_ENABLE_LOCALE_PURGE / BR2_GENERATE_LOCALE, and then stick an
> echo statement in each of them.
>

I performed this test, and can confirm that all is well:
purging/generating of locale data is done before the filesystem is
created, in the order generate / purge / rootfs.

So moving that line does not impact the behavior with respect to locales.

As the patch does no longer cleanly apply, I'll send a new version.
Do you still consider this for 2014.05 or is it too late/risky in your opinion?

Thanks,
Thomas
