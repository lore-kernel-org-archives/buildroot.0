Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CD1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 08:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0820541CE0;
	Sun, 17 Apr 2022 08:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdM5nMFlTDdU; Sun, 17 Apr 2022 08:42:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB45041CDD;
	Sun, 17 Apr 2022 08:42:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A3A3B1BF286
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 08:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FC1441CDA
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 08:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J_yFWJSJUl_B for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 08:42:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A337641CDD
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 08:42:48 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 56F72FF802;
 Sun, 17 Apr 2022 08:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650184966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uoVxfVVG5kK96guyn8CSSKnZnjUNDddKRWndP9xTSuQ=;
 b=YiCzD3QrPX8LwK42d8vfWIHafabeUSVOMeXm5UrpxHImTRl/2Z5PKs8GMa9QSvpJR58zmj
 ZieTGWUc9M1dQEjAhnpOC3SG3P2b4KWkRVrxg5+fSt424ArUJsUYAyrT8gxbyQ1jXBUxmh
 1hUzSz4v6EMkgGWT5EYhsezDFPW6C5lbPmcBTia6G8lsywmc6RSGCrcjdJTY+aj75stBkO
 pkcqDee5GN32AnwcL5tGKRjY+YfbchLx1ecZnd5AwXytemVtnynLw4kyqQrPjvM4NNs9ub
 KW7vHSMKUfc/NVD9vfOAQgQI+OtB57Z+XXuIBkcJO+OB4x5XxkppsVL06vTyuw==
Date: Sun, 17 Apr 2022 10:42:44 +0200
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20220417104244.6d681b10@windsurf>
In-Reply-To: <2098999.irdbgypaU6@pwmachine>
References: <2098999.irdbgypaU6@pwmachine>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 15 Apr 2022 17:42:23 +0100
Francis Laniel <flaniel@linux.microsoft.com> wrote:


> >     arch     |             reason             |                             
> >          url
> > -------------+--------------------------------+----------------------------
> > ----------------------------------------------------- xtensa    |      
> > host-pahole-v1.23        |
> > http://autobuild.buildroot.net/results/fa4fb6ca383e058e89ff8796ac9ae68a0b16
> > 81b5 m68k     |       host-pahole-v1.23        |
> > http://autobuild.buildroot.net/results/b584c57a72e4604112f4b12c0c7b21e1a4b4
> > 1dd5 arm      |       host-pahole-v1.23        |
> > http://autobuild.buildroot.net/results/b43be30cb177066d1b49bf4822790ec0ca01
> > 9d03
> > 
> > 
> > Thanks for your contribution to Buildroot!  
> 
> I suspect this problem occurs because Ubuntu 14.04 kernel does not know the 
> problematic symbols.
> Indeed, PERF_COUNT_SW_BPF_OUTPUT was added in :
> a43eec304259 ("bpf: introduce bpf_perf_event_output() helper")
> which was released with kernel 4.4.
> So, can you please give me the uname -r of the host-distro?

I can't because these build issues (or at least the last one) occurs on
Yann Morin's autobuilder, so I've added yann in Cc.

> If my suspicion is good, I already wrote a patch to throw an error if host 
> kernel is under 4.4 while building host-pahole.

This is not going to be the solution. Why does host-pahole depend on
the version of the kernel? Why does it need the NR_bpf symbol?

There is some logic in src/bpf.c to get __NR_bpf if not provided by
kernel headers:

#ifndef __NR_bpf
# if defined(__i386__)
#  define __NR_bpf 357
# elif defined(__x86_64__)
#  define __NR_bpf 321
# elif defined(__aarch64__)
#  define __NR_bpf 280
# elif defined(__sparc__)
#  define __NR_bpf 349
# elif defined(__s390__)
#  define __NR_bpf 351
# elif defined(__arc__)
#  define __NR_bpf 280
# elif defined(__mips__) && defined(_ABIO32)
#  define __NR_bpf 4355
# elif defined(__mips__) && defined(_ABIN32)
#  define __NR_bpf 6319
# elif defined(__mips__) && defined(_ABI64)
#  define __NR_bpf 5315
# else
#  error __NR_bpf not defined. libbpf does not support your arch.
# endif
#endif

but this logic is only partially duplicated in src/skel_internal.h:

#ifndef __NR_bpf
# if defined(__mips__) && defined(_ABIO32)
#  define __NR_bpf 4355
# elif defined(__mips__) && defined(_ABIN32)
#  define __NR_bpf 6319
# elif defined(__mips__) && defined(_ABI64)
#  define __NR_bpf 5315
# endif
#endif

That doesn't make much sense.

Do we need that BPF support in host-pahole in our use-case of host-pahole?

BTW, I'm seeing that we can avoid using the internal libbpf, and
therefore avoid using git submodules:

option(LIBBPF_EMBEDDED "Use the embedded version of libbpf instead of searching it via pkg-config" ON)
if (NOT LIBBPF_EMBEDDED)
        find_package(PkgConfig REQUIRED)
        if(PKGCONFIG_FOUND)
                pkg_check_modules(LIBBPF REQUIRED libbpf>=0.4.0)
        endif()
endif()

So we should definitely do that, and have a separate Buildroot package
for libbpf.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
