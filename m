From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 23 Mar 2015 21:40:39 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/mesa3d: bump version to
	10.5.1
References: <1426435802-14030-1-git-send-email-bernd.kuhls@t-online.de>
 <1426435802-14030-2-git-send-email-bernd.kuhls@t-online.de>
 <20150317233027.1aee93ce@free-electrons.com>
Message-ID: <XnsA466DC83D57B9berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150317233027.1aee93ce at free-electrons.com:

> Thanks for the additional explanation, makes a lot more sense now. I've
> applied your patch. I however have a comment:
> 
>> ++#ifdef __UCLIBC__
>> ++float fmaxf(float a, float b)
> 
> This is really a crappy solution. I know we use it in various places,
> but it simply does not work properly: if a new version of uClibc is
> released with an implementation of fmaxf(), then __UCLIBC__ will still
> be true, but we'll have a duplicated implementation of fmaxf().

Hi,

uclibc added fmaxf upstream: http://git.uclibc.org/uClibc/commit/?id=
6c4538905e65ceb203f59aaa9a61728e81c6bc0a

mesa3d/0002-Fix-runtime-error-with-uClibc.patch can be removed when the 
forementioned patch is used in buildroot, a local run-time test was positive.
Let?s hope uclibc will make a new release soon ;)

Regards, Bernd
