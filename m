Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2AFC433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 17:50:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 513D761108
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 17:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 513D761108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 193BF834C6;
	Fri, 22 Oct 2021 17:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4148ukx0hJVY; Fri, 22 Oct 2021 17:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A2E58348C;
	Fri, 22 Oct 2021 17:50:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A08811BF298
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 17:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D5BC605BD
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 17:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7F0drPK3lXY3 for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 17:50:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B98C605A7
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634925047;
 bh=yXquCMYi+QEnAPlhW/6AUXxvG3duXGAOjyQsV9ONcEA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=TPs4Kpf7fy4fvYwXAZ2TemvMbWZHY7UNJmS7u/IPZ/zf5ZxhudNYLXfgW/AYzROHj
 EF4cYivLWnt5K9o/8xSE8RxM7l0IrmSlQjt4aVqACc5l9yKcjxiIuRQp7AlF45V9Un
 eiptsxW6Err0KEOJDiMfWLe/tj0G/JsnSvsWSM6k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMXQF-1mN8l61gVb-00Jbk5; Fri, 22
 Oct 2021 19:50:47 +0200
Date: Fri, 22 Oct 2021 19:50:46 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: "John" <joblacker@cfl.rr.com>
Message-ID: <20211022195046.476ef082@gmx.net>
In-Reply-To: <000201d7c74e$f2d6aa10$d883fe30$@cfl.rr.com>
References: <000201d7c74e$f2d6aa10$d883fe30$@cfl.rr.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:+Q4qy7+zWq4P+8pqPAPjYcfVAWuyEgR3bhJZPdkp1nF4BXtg0Da
 eXJDZzNbWN0tGlirJtXbQoyf0sdXFvMP8jT4/B7KW2aWIonVSOYYOy15gFFPVAMvTv1P7JQ
 ygV9s9t5Hp3rCbJThdCJMF47YDpb0gaYP8vizViM96oPc1oNeFVBwrw4HViqjwmG8YKEG+i
 1UcnGz7Q7B5oRzaOMUDcQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rDBc79UTSkU=:MZD2uLQw6DxuPcVwm51NVw
 pHksuXRh27I4f9wPTj6HyXvw0dBKkDyOMeqpMTw67tBN2hlgl+lc1fCBHRlmlRNS/5Pem78ka
 MX2VdFwLjBj8BrNHJttNuyEqmPGlMQNA3JaLlOLH/Y/eRWFwHe7oc0jU391QNqMzMd1m3GeGb
 F5wxpCi14QkrRhX6/gDnplwKlHev1vsI//Ox5xeuCJMbJpf3OhpPmPgCsOAvBMfm7hFFBMZFP
 SxcmOtTfYG5+0GPdDcHCNROorYVCvcuzEdjjHTXteDrRlTQnkJplvSxkl6jaTad6f0fb4p4he
 ZohfnyrbPU+SrB/e6oxcxYlZBk/0KCwv9jrxxpYvsG8MMNw4nb69x2lSEC74oGYKuA8lwV7pq
 4K7w6dfLJNumqHJzZ+avlbDfk6J33cHcXVQCaBrLi2+YgfmG+N9dzfUQrRD+/iQ3cOHLFqlTL
 bIAPLYZ20wDQ1ZA08CzGhSF9Gwz6UMErZpXQqOXNmg4xZfs+eKNOF+r2lEfOhpnVWuuSYjFxb
 tdbibctAsmXNsK1OYuRk7Iqf/lQpMXsX1UwBsIBlFDp/jdYQhj4JzlidMXfdM8Kj4ev8j0DM3
 i7NKmvhrFZAAlPdPzBjLAfn174i4S+4eJYlbt7Jh53e+I4AlLRcVzQhr3cYt12d6X5MJJ927C
 t1r880dZrq1C0Dd1dzviMWs8q88OVkKMo93+yYm58cTw983kJKXKCepLEbWBjrIrUrsMJJ36z
 OnmGD9vDU9fmmKObWXVDuWkRRPU8Rbgipqcnwuu0vMxeQ5RnnqwL9ONaqVZYP/sV8kSsBIOyy
 joHW1xdZfNSbFKN/fznwDIqeDVSy16hnRee94ZGLEY41eCbifYNAvX1D4puGLOpINBm5pHYrd
 dvr0yFCUwrQYp9gQkLMN+VRPiDMeX38bkdyQ0KxzeRcnD1Sq/Nok2XXC2ttvBQg1JdLKRs4ti
 8GUgp1zihjRMgJhXtM3XY1xaqaQQCK+VnS2zAO37QFmXTj2LyvuXVZeyXpq8L/qSrd0e1r33e
 xM/y4swkypVY9BhfrR29jkkp+pSCLzPA0MahU66bYDbpMt9+F5lSAE1OPZ1yzuDqMGYUuVKsg
 OM3wuDh6OjJCvI=
Subject: Re: [Buildroot] make failure trying to buildroot for raspberry pi 3
 using external toolchain
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello John,

On Fri, 22 Oct 2021 10:13:12 -0400, "John" <joblacker@cfl.rr.com> wrote:

> I'm trying to perform a make using the latest buildroot version (2021.08.1)
> but it fails at the point of trying to build libgpg-error.  I'm running on a
> Ubuntu 20.04 VM under
>
> Windows 10 VBox.  Here's what I believe is the pertinent output info:
>
>
>
> configure: WARNING: unrecognized options: --disable-gtk-doc,
> --disable-gtk-doc-html, --disable-doc, --disable-docs,
> --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6,
> --disable-nls
>
>
>
>         GPGME v1.15.1 has been configured as follows:
>
>
>
>         Revision:          bb988077  (48024)
>
>         Platform:          arm-buildroot-linux-gnueabihf
>
>
>
>         UI Server:         yes
>
>         FD Passing:        yes
>
>
>
>         Language bindings: cl cpp
>
>
>
>         Mismatches between the target platform and the to
>
>         be used libraries have been been detected for:
>
>           libgpg-error
>
>         Please check above for warning messages.
>
> End of output log:
>
>
>
> libtool: compile:
> /home/jb/GitHub/buildroot/output/host/bin/armv8-rpi3-linux-gnueabihf-gcc
> -DHAVE_CONFIG_H -I. -I../conf -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64
> -I/home/jb/GitHub/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroo
> t/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=1 -Wall -Wcast-align
> -Wshadow -Wstrict-prototypes -Wno-format-y2k -Wno-missing-field-initializers
> -Wno-sign-compare -Wno-format-zero-length -Wno-format-truncation
> -Wno-sizeof-pointer-div -c debug.c  -fPIC -DPIC -o .libs/debug.o
>
> libtool: compile:
> /home/jb/GitHub/buildroot/output/host/bin/armv8-rpi3-linux-gnueabihf-gcc
> -DHAVE_CONFIG_H -I. -I../conf -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64
> -I/home/jb/GitHub/buildroot/output/host/arm-buildroot-linux-gnueabihf/sysroo
> t/usr/bin/../../usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -Os -g0 -D_FORTIFY_SOURCE=1 -Wall -Wcast-align
> -Wshadow -Wstrict-prototypes -Wno-format-y2k -Wno-missing-field-initializers
> -Wno-sign-compare -Wno-format-zero-length -Wno-format-truncation
> -Wno-sizeof-pointer-div -c version.c  -fPIC -DPIC -o .libs/version.o
>
> make[2]: *** [Makefile:534: all-recursive] Error 1
>
> make[1]: *** [package/pkg-generic.mk:270:
> /home/jb/GitHub/buildroot/output/build/libgpgme-1.15.1/.stamp_built] Error 2
>
> make: *** [Makefile:84: _all] Error 2
>
>
>
> Perhaps I have a configuration error but I don't know what it is.

Your log seems at least incomplete, the first part seems to be
from libgpg-error, the failing package is libgpgme...

Did you do a complete re-build after package selection changes
(see [1])?

In case the error persists after a complete re-build please provide
a minimal .config (or defconfig) file to reproduce the error...

Regards,
Peter

[1] https://buildroot.org/downloads/manual/manual.html#full-rebuild

>
> Please help.
>
>
>
> John Blacker
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
