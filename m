Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CE8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 17:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3787A60BBB;
	Tue, 19 Apr 2022 17:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngCg1SiY8D87; Tue, 19 Apr 2022 17:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D5BB60B1E;
	Tue, 19 Apr 2022 17:41:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CF0591BF293
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 17:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CABBD4010E
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 17:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pAaKOSeGiREW for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 17:41:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 075C1400A6
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 17:41:49 +0000 (UTC)
Received: from pwmachine.localnet (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id EEDB220C3620;
 Tue, 19 Apr 2022 10:41:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EEDB220C3620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1650390108;
 bh=KO/rPTrDLiYD0p8SkOO7ebTXTqnQf+aavZJ7/qlA57M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JMzKQ6TgpWUJ1AzfdjxEnut5FKRHbuHgTjcP2OrlF3YRnlhXHr3yCSqa8I5zmFuN8
 vV+IB7MaNWMTheK1jkfAY2aP9CVoo77zp43E6C2+iv5iWbjShTIaXET61BwPspFp0q
 PQvwJCMk3ETglMBwAmBdI0qxVqITF/oGDKXNHPWM=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Apr 2022 18:41:44 +0100
Message-ID: <12997361.uLZWGnKmhe@pwmachine>
Organization: Microsoft
In-Reply-To: <20220417104244.6d681b10@windsurf>
References: <2098999.irdbgypaU6@pwmachine> <20220417104244.6d681b10@windsurf>
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2022-04-14
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi.

Le dimanche 17 avril 2022, 09:42:44 BST Thomas Petazzoni a =E9crit :
> On Fri, 15 Apr 2022 17:42:23 +0100
> =

> Francis Laniel <flaniel@linux.microsoft.com> wrote:
> > >     arch     |             reason             |
> > >     =

> > >          url
> > > =

> > > -------------+--------------------------------+----------------------=
---
> > > ---
> > > ----------------------------------------------------- xtensa    |
> > > host-pahole-v1.23        |
> > > http://autobuild.buildroot.net/results/fa4fb6ca383e058e89ff8796ac9ae6=
8a0
> > > b16
> > > 81b5 m68k     |       host-pahole-v1.23        |
> > > http://autobuild.buildroot.net/results/b584c57a72e4604112f4b12c0c7b21=
e1a
> > > 4b4
> > > 1dd5 arm      |       host-pahole-v1.23        |
> > > http://autobuild.buildroot.net/results/b43be30cb177066d1b49bf4822790e=
c0c
> > > a01
> > > 9d03
> > > =

> > > =

> > > Thanks for your contribution to Buildroot!
> > =

> > I suspect this problem occurs because Ubuntu 14.04 kernel does not know
> > the
> > problematic symbols.
> > Indeed, PERF_COUNT_SW_BPF_OUTPUT was added in :
> > a43eec304259 ("bpf: introduce bpf_perf_event_output() helper")
> > which was released with kernel 4.4.
> > So, can you please give me the uname -r of the host-distro?
> =

> I can't because these build issues (or at least the last one) occurs on
> Yann Morin's autobuilder, so I've added yann in Cc.
> =

> > If my suspicion is good, I already wrote a patch to throw an error if h=
ost
> > kernel is under 4.4 while building host-pahole.
> =

> This is not going to be the solution. Why does host-pahole depend on
> the version of the kernel? Why does it need the NR_bpf symbol?
> =

> There is some logic in src/bpf.c to get __NR_bpf if not provided by
> kernel headers:
> =

> #ifndef __NR_bpf
> # if defined(__i386__)
> #  define __NR_bpf 357
> # elif defined(__x86_64__)
> #  define __NR_bpf 321
> # elif defined(__aarch64__)
> #  define __NR_bpf 280
> # elif defined(__sparc__)
> #  define __NR_bpf 349
> # elif defined(__s390__)
> #  define __NR_bpf 351
> # elif defined(__arc__)
> #  define __NR_bpf 280
> # elif defined(__mips__) && defined(_ABIO32)
> #  define __NR_bpf 4355
> # elif defined(__mips__) && defined(_ABIN32)
> #  define __NR_bpf 6319
> # elif defined(__mips__) && defined(_ABI64)
> #  define __NR_bpf 5315
> # else
> #  error __NR_bpf not defined. libbpf does not support your arch.
> # endif
> #endif
> =

> but this logic is only partially duplicated in src/skel_internal.h:
> =

> #ifndef __NR_bpf
> # if defined(__mips__) && defined(_ABIO32)
> #  define __NR_bpf 4355
> # elif defined(__mips__) && defined(_ABIN32)
> #  define __NR_bpf 6319
> # elif defined(__mips__) && defined(_ABI64)
> #  define __NR_bpf 5315
> # endif
> #endif
> =

> That doesn't make much sense.
> =

> Do we need that BPF support in host-pahole in our use-case of host-pahole?
> =

> BTW, I'm seeing that we can avoid using the internal libbpf, and
> therefore avoid using git submodules:
> =

> option(LIBBPF_EMBEDDED "Use the embedded version of libbpf instead of
> searching it via pkg-config" ON) if (NOT LIBBPF_EMBEDDED)
>         find_package(PkgConfig REQUIRED)
>         if(PKGCONFIG_FOUND)
>                 pkg_check_modules(LIBBPF REQUIRED libbpf>=3D0.4.0)
>         endif()
> endif()
> =

> So we should definitely do that, and have a separate Buildroot package
> for libbpf.

I think upstream code has actually a problem buildroot test infrastructure =

highlighted.
So, from my understanding, the best solution would be to patch upstream =

libbpf.
Indeed, I do not think adding a buildroot package will solve this problem.

Were you suggesting than by adding a buildroot package we could add a local =

patch to fix this behavior?

> Best regards,
> =

> Thomas

Best regards.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
