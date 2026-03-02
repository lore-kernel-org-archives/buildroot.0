Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71244EB3636
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 21:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 146C7612F1;
	Mon,  2 Mar 2026 21:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThB_UkwaIVVR; Mon,  2 Mar 2026 21:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30B1E612F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772487635;
	bh=m+JVeHSeXpvfBb29bTFstQuw55hI3bcEAz4l0M/OcZQ=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p10SheqrfXjDoTiHoAKWQTg6SDbhYZ3fe0q0ArS7wA1H0EY/5jKCyybmhyxy6XqM2
	 rgRIvsQT7W6PZmSr1tOlXOkIF0sJjpEZRrrlSYQq+GNHIwI+qWcYiv58tRGOMgE0B9
	 DKc7IFiObPVq3gUb9vwLxgKuXaA4KxoqajSRe1/hzwnfotLBYCwXQ56BKm82Pg2MWY
	 EAf3ENBYizlVM+4VfSaazpkcnRLeqB27j426P5N5yx+UB4LQ7AsqC2EiBXwvCLEyW9
	 JfGTnGB5ij8BGzWrihW2o4Q4XOFljnqb3kNozpVxtatiMwvOGJW0hUQrF0gA8AcfGB
	 j1y42PjXr66sQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B1E612F2;
	Mon,  2 Mar 2026 21:40:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E55C231
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 21:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8440483EC7
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 21:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58Wc-JCzmKwB for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 21:40:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 747B783EC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 747B783EC5
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 747B783EC5
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 21:40:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D14FC31E0CB4; Mon, 02 Mar 2026 22:40:29 +0100 (CET)
Date: Mon, 2 Mar 2026 22:40:29 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <aaYDzc8Rh_u-Vb2I@waldemar-brodkorb.de>
References: <aaQ0OC8I4PAx0xZz@waldemar-brodkorb.de>
 <294c54a635aa57d40cda161b8af98f8f@free.fr>
 <aaXHi1j_b4fRSI-V@waldemar-brodkorb.de>
 <054ee3804bf26bee3dadf8425e0f723c@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <054ee3804bf26bee3dadf8425e0f723c@free.fr>
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1772487630; bh=N6ifYVdo4l4p1IF39Hv1Uz5pIVtgnZCkRipuV73JENc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nydHacr4bcNGXAjrL9+9mwovZn2Uw8tBVEc//PN2V0CgjI7sFVFeqEc66TxlB8YG/
 5mekDiH+i3unMNpB8j6GV2+NLf4V8fzEKcNFlQDus6XXSFrRaH8DZLmX/5jxsHe0u6
 Ckd5phLD4LCR1tVM6p3F3K21ewrTYsTHdZG4287888UJgJvQdDJib1EoQJGXkFgqu8
 aGY6eYGEntyQ5/YNH9GbASRtRXCuDC2yY4HORAex13lriW4WkxCbNqMhmK/xa9H2Fe
 +7cjiR+68KljVrknJNg8EFSduI6ZOUO4pomZ0Bhg0XMz9sBQ9BXEziHJFLCogbiZ3F
 gynBc1pwx79qw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: Re: [Buildroot] [PATCH] package/uclibc: bump to 1.0.57
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Hi Julien,
Julien Olivain wrote,

> Hi Waldemar,
> 
> On 02/03/2026 18:23, Waldemar Brodkorb wrote:
> > Hi Julien,
> > Julien Olivain wrote,
> > 
> > > Hi Waldemar,
> > > 
> > > Thanks for the patch.
> > > 
> > > On 01/03/2026 13:42, Waldemar Brodkorb wrote:
> > > > Following changes made it into the release:
> > > >
> > > > Joris van Rantwijk (1):
> > > >       Fix adjtimex() with TIME64
> > > >
> > > > Waldemar Brodkorb (8):
> > > >       sys/stat.h: remove _STAT_VER/_MKNOD_VER
> > > >       fix gettid() declaration
> > > >       add statx syscall wrapper
> > > 
> > > This new uclibc version is introducing a test failure
> > > with zfs. See:
> > > https://gitlab.com/jolivain/buildroot/-/jobs/13308829775
> > > 
> > > Running with the previous uclibc 1.0.56 works fine:
> > > https://gitlab.com/jolivain/buildroot/-/jobs/13308875027
> > > 
> > > It seems related to commit:
> > > https://github.com/wbx-github/uclibc-ng/commit/d3a819aff25af436e22abd5ba01ff2cfc0631b32
> > > 
> > > Do you have any idea which component should be fixed?
> > > (uclibc, zfs, or the rutime test_xzf?)
> > 
> > It is uclibc-ng fault. A fix and a patch v2 will follow.
> 
> I looked a bit more into this. The statx headers for glibc and uclibc-ng
> are indeed the same:
> 
> https://sourceware.org/git/?p=glibc.git;a=blob;f=io/bits/statx-generic.h;h=9bb9701dc67eccad968b338aeb15d87378fe65cd;hb=ea37298b65bd67f94c3c2640e91ec5865a5019ad#l66
> 
> https://github.com/wbx-github/uclibc-ng/blob/v1.0.57/libc/sysdeps/linux/common/bits/statx.h#L88
> 
> On its side, zfs is (re)defining the function slightly
> differently in its test:
> https://github.com/openzfs/zfs/blob/zfs-2.4.1/tests/zfs-tests/cmd/statx.c#L57-L59
> 
> Also, this test does not include the <sys/stat.h> header. It includes
> only <fcntl.h>. In the case this test is compiled with glibc, stat.h
> is never included, so the error does not happen.
> 
> For some reason, in the uclibc-ng case, sys/stat.h gets
> included from fcntl.h, generating the error. See:
> https://gitlab.com/jolivain/buildroot/-/jobs/13308829775#L237
> 
> Maybe the zfs statx test should protect the statx() definition
> with a "#ifndef HAVE_STATX".
> 
> Or could uclibc avoid to include sys/stat.h from fcntl.h,
> when it's not needed?
> 
> What do you think?

Just in this moment I came to the same conclusion. Glibc includes
only <bits/stat.h> since commit f095bb7204d80f609a73a22796edd6cffd4c6add
in 2010. uclibc uses <sys/stat.h> since 2000.

I am actually not sure what can of worms I will open up when
changing it to <bits/stat.h>.

But the zfs test is nevertheless broken, as it always use the
fallback even if glibc provides statx(). We should change it to
check HAVE_STATX as you suggested. And the STATX_MNT_ID check
is also broken, because it is not compile with -D_GNU_SOURCE as
required for a GNU extension.

Can you report it upstream?

In the meanwhile I will sync statx headers in uClibc-ng as they are
heavily outdated. At least this was a good thing to find out.

best regards
 Waldemar

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
