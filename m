Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5546CC49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 111CD6061C;
	Tue,  6 Aug 2024 22:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GeOxyFVTIKOB; Tue,  6 Aug 2024 22:57:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E352E60668
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E352E60668;
	Tue,  6 Aug 2024 22:57:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A5AE1BF302
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87B39400D7
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XEqvq2MTfDOq for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:57:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D4BA540237
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4BA540237
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4BA540237
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:57:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.195]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hzZ-1sBnOr12rH-00t3mm; Wed, 07
 Aug 2024 00:57:26 +0200
Date: Wed, 7 Aug 2024 00:57:24 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZrKqVEnoFgE28KWI@probook>
References: <ZrBvFLSlPYjjwCKj@waldemar-brodkorb.de> <87cymm2okx.fsf@tarshish>
 <ZrH+30Im+xoA7Ipw@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZrH+30Im+xoA7Ipw@waldemar-brodkorb.de>
X-Provags-ID: V03:K1:a7eIl8TbvFMW3jbvc/smfe8EVfjwI86RuU16jzR5ATyfIme6mJx
 yxc5bLBo6X60wzjKbKGn4ikvbF2nrdDDuG9JbDbVEKiGSjfoV2bhEukuavwzqIT0nB2kXpG
 420d5OkXRGFRKp5YAFTRt7Z/BZz86a2SGOgi3PaNRovTgkzuSQUh5wByOzpN0GI993AwFA5
 l6sb+Ck4ckzUW4d8k3waw==
UI-OutboundReport: notjunk:1;M01:P0:oelrBn90HP4=;91z8Hcdc9urxKXu7Nbc+I1kpRiG
 rk1L++fDf++7NJ5F1LaZ4us4xzxAdNa4JbWt5FQtHUK803/9NosYotlQsVji3Xkz5FcbxHPBQ
 vlXTVlJfIOnPskn/sERnslIA4T9dG5g01sg8mUGPdOH66rxWrKiQWHuOovMSU/bUozzyVXksk
 lGuBRq18iQzl7rJeHyVbtDDqroBhex/JoVahhlmk6g7u4sEqEmJDFW4GwKP6X4MQcYyYUzIDi
 mN/pQfNLMUJv+UdVbRvB2mf4+PLgOeRFpsoAXwg4sOpio8LGHjkREm+zDd1MPaqrW5lFFLTe4
 rqVJMNHxUokVjJ+g8TYt+87kHYSaYbsiDdzYW2PX0TGenGvrw5qsXPVR474ey0SZHnqT7jbVL
 cE1mUnfvFLNIbs3UGpk5uAMeqEOxWFASOaJIfDjahjUYdAZgbqQL7oyZJ3bTezJvUeP6SEHk0
 boY3Nl86SaUdnDgDfK1ZEZbdzzWh2dxo4njLdt4aBlAlgg+Gw1hFvcU/WtjuKBEiwNXYFRv2e
 XcRw8soV8GHkfeLDo2cpYUq0FccvrkbkOmPUF5bp3kIadZOjIbTLVQk++MP0Macj2Ir2TwG0T
 HF6UpQprYFZTQblvM5+o979sZLUYRtAzQ3t2FGrgoKwF6guf+kzUNpkjTGWKwm/CbrFmjXXbQ
 Ym86kbcc91XlozOgIs82YEXDfufd0/C3y4hWgIjjjcuzfqgLqowCiID90s3Le0wWdocX2Vvmb
 D1/ywRDN9HeLXfxRd8qyqJCBbkHfPnfa0mYVxUqMdvSRHXpI1vcVCRzr5ZRqYvAt9xXsBpS+o
 srzFe/iTlZv4vaQEMfXG/UNg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1722985046; x=1723589846; i=j.neuschaefer@gmx.net;
 bh=nfW4Gj03SRRG6Z6KOdFvmHK/q7jp8YmmEeLIkV6getw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UkbVkMMrjdEODstEOiFRKzDDQI+aOnq6YbinanQD8fsvrbWxdpS9DagxACzLnOgW
 yzvvHND2z93BkD111zp4Fn6ENNC6ZHYkbTVU9jfowAFN9xzPAWbFrhje4THXwg9t7
 8/ODyLGcsYMb2VRdYrr+O3C8Fzu3am2VYnVG//cizXSZQ7e5lvLFviIex4XJ4L/mw
 BRvBqmXLBSWctcuLA69xnPDzA2nuenADqtIHpRJFWwoalomhS2DrmFg56xfQsvyAW
 wUaKvuCf6w6lt1p6RyXQOQ2xUK4yKEJhYpBQVBBvCkE3CHSiJstN1Isv2O3CgKBxX
 DR2419zXo75V3o7IWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=UkbVkMMr
Subject: Re: [Buildroot] [PATCH v2] package/uclibc: fix missing m_tim issue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Aug 06, 2024 at 12:45:51PM +0200, Waldemar Brodkorb wrote:
> Hi Baruch,
> Baruch Siach wrote,
>
> > Hi Waldemar,
> >
> > On Mon, Aug 05 2024, Waldemar Brodkorb wrote:
> > > Patch from upstream to fix missing m_tim issue.
> > >
> > > Fixes:
> > >  - http://autobuild.buildroot.org/results/f07d6d6ae2331f9972974093c0503b9d3c6b914a/
> >
> > The autobuilder started showing failures like:
> >
> > In file included from /home/autobuild/autobuild/instance-12/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/sys/stat.h:106,
> >                  from /home/autobuild/autobuild/instance-12/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/fcntl.h:37,
> >                  from libslack/fio.c:72:
> > /home/autobuild/autobuild/instance-12/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/bits/stat.h:201:9: error: expected ':', ',', ';', '}' or '__attribute__' before '.' token
> >   201 |     int st_atime;
> >       |         ^~~~~~~~
> >
> > This is from
> > http://autobuild.buildroot.net/results/f3b3942b6b645d9523ab08d179a3f8aca7d6641c/
> >
> > Is this patch related to that issue?
>
> Good catch. It is related, I removed the patch and then the compile
> works. But I don't understand why it fails.
> @J.: Do you see why it fails for mips64el (n32)?

I found the issue: In the per-architecture stat.h files that I patched,
there are sections like:

	#ifdef __USE_MISC
	    /* Nanosecond resolution timestamps are stored [...] */
	    struct timespec st_atim;            /* Time of last access.  */
	    struct timespec st_mtim;            /* Time of last modification.  */
	    struct timespec st_ctim;            /* Time of last status change.  */
	# define st_atime st_atim.tv_sec        /* Backward compatibility.  */
	# define st_mtime st_mtim.tv_sec
	# define st_ctime st_ctim.tv_sec
	#else
	    __time_t st_atime;          /* Time of last access.  */
	    unsigned long int st_atimensec;     /* Nscecs of last access.  */
	    __time_t st_mtime;          /* Time of last modification.  */
	    unsigned long int st_mtimensec;     /* Nsecs of last modification.  */
	    __time_t st_ctime;          /* Time of last status change.  */
	    unsigned long int st_ctimensec;     /* Nsecs of last status change.  */
	#endif

I tried to change all instances of "#ifdef __USE_MISC" to
"#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)", but I missed some,
because MIPS has four of them (for the different ABI variants), and I
patched only the first two.

I think my original patch is salvageable, but it needs a follow-up for
MIPS and a few other architectures:

	$ find libc/sysdeps/ -name stat.h | xargs grep __USE_MISC
	libc/sysdeps/linux/sparc64/bits/stat.h:#ifdef __USE_MISC
	libc/sysdeps/linux/sparc64/bits/stat.h:#ifdef __USE_MISC
	libc/sysdeps/linux/common-generic/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/common-generic/bits/stat.h:# if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/powerpc/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/powerpc/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/m68k/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/m68k/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/x86_64/bits/stat.h:#ifdef __USE_MISC
	libc/sysdeps/linux/x86_64/bits/stat.h:#ifdef __USE_MISC
	libc/sysdeps/linux/mips/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/mips/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/mips/bits/stat.h:#ifdef __USE_MISC
	libc/sysdeps/linux/mips/bits/stat.h:#ifdef __USE_MISC
	libc/sysdeps/linux/common/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/common/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/sparc/bits/stat.h:#ifdef __USE_MISC
	libc/sysdeps/linux/sparc/bits/stat.h:#ifdef __USE_MISC
	libc/sysdeps/linux/nds32/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/nds32/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/xtensa/bits/stat.h:#ifdef __USE_MISC
	libc/sysdeps/linux/xtensa/bits/stat.h:#ifdef __USE_MISC
	libc/sysdeps/linux/ia64/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/ia64/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/kvx/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/kvx/bits/stat.h:# if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/alpha/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/frv/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)
	libc/sysdeps/linux/frv/bits/stat.h:#if defined(__USE_MISC) || defined(__USE_XOPEN2K8)

I'll see when I get around to sending the follow-up patch.


-- jn
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
