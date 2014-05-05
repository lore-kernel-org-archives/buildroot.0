From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 May 2014 11:37:45 +0200
Subject: [Buildroot] [PATCH] Makefile: move fs/common.mk above
	external.mk
In-Reply-To: <CAAXf6LVkhqmCuHcaA859otdpFrDu9vEPh-UBrnj28kJ6YnYkWQ@mail.gmail.com>
 (Thomas De Schampheleire's message of "Mon, 5 May 2014 09:47:14
 +0200")
References: <1395583071-10016-1-git-send-email-tremyfr@yahoo.fr>
 <87ha6kk5bi.fsf@dell.be.48ers.dk>
 <1395944229.86315.YahooMailNeo@web28802.mail.ir2.yahoo.com>
 <87ppl7gwdz.fsf@dell.be.48ers.dk>
 <CAAXf6LVkhqmCuHcaA859otdpFrDu9vEPh-UBrnj28kJ6YnYkWQ@mail.gmail.com>
Message-ID: <87d2fsin12.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 >> The specific issue I mentioned was about the externally defined rootfs
 >> getting created before target-purgelocales / target-generatelocales gets
 >> called. The easiest way to check that is to use a glibc toolchain and
 >> enable BR2_ENABLE_LOCALE_PURGE / BR2_GENERATE_LOCALE, and then stick an
 >> echo statement in each of them.
 >> 

 > I performed this test, and can confirm that all is well:
 > purging/generating of locale data is done before the filesystem is
 > created, in the order generate / purge / rootfs.

 > So moving that line does not impact the behavior with respect to locales.

Thanks!

 > As the patch does no longer cleanly apply, I'll send a new version.
 > Do you still consider this for 2014.05 or is it too late/risky in your opinion?

If you tested it then I'm Ok with it ;)

-- 
Bye, Peter Korsgaard
