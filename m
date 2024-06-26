Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91B7C27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 08:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DB57607A6;
	Wed, 26 Jun 2024 08:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLUv5WyRt1kI; Wed, 26 Jun 2024 08:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 575B360856
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 575B360856;
	Wed, 26 Jun 2024 08:36:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67D4D1BF41B
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 08:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5574E80EF5
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 08:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QGmyjipl7cxd for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 08:36:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 242F080EEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 242F080EEB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 242F080EEB
 for <buildroot@busybox.net>; Wed, 26 Jun 2024 08:36:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.75]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnJlc-1snmwe32yi-00gOgL; Wed, 26
 Jun 2024 10:36:24 +0200
Date: Wed, 26 Jun 2024 10:36:23 +0200
To: yann.morin@orange.com
Message-ID: <20240626103623.7d7412c0@gmx.net>
In-Reply-To: <Znql0FCAPG8jP+Lx@tl-lnx-nyma7486-2>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-5-ps.report@gmx.net>
 <ZnqUPBAcDbB7ND64@tl-lnx-nyma7486-2>
 <Znql0FCAPG8jP+Lx@tl-lnx-nyma7486-2>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:aJnWli9/W+aSjhwDjxPPpiaBnd2fhjNPh6Tcp5WJnlvBXQ/M9ng
 d/bC1vB7Wo6TJiT7zEUP1wn5+4sd8sjODYQQvoQCrcb2gHXkK0+6L/0g2om/8uluQKlyPuv
 sgt8BO199P5geUkTt43AbfhS+OSMZG4cwH7PWvBMctCO+3sPZtKuJYROaZ1rYoAbHB9ouOw
 r6TucbimxNUPHTgPYeZxw==
UI-OutboundReport: notjunk:1;M01:P0:rSX3egjyWtU=;00aVytLYFbBrejE/xo7AXYNHATi
 AUPWQve6wlEtIR1d5PaQKNE0jQPM/i+xwRJpXbG3haRb2RgjbOYaG7MxTCHi06WSt6NURr8PZ
 JGUuLTaG14QTITNDkdOiBbYAgwXA6lycXcMdcPpbCFbgfwZka19ZaoMxMFh3kCo1Ye0niliW5
 rnARuRQaSTtRXsvEi9QROs2Xngx2kXfQyN0CHbtdqubMCSX/nj4HO3BmGst8BlYlpmet4lVvx
 RUlSApvyO9PVPY/vezSD/3+IVdtmiBAci8EIaj6UBpdH8NHhC+tP52BRbjTCBGWYJWuv+NN++
 mCROnTztwWcza7hInJ1ZLkZiqQHXPlvGlA4czjxC1Orwtd+7ts2jXTV8nlGsecz3PrlluOOnl
 BY2EZMlEm7fjz9L5C3KXManYDF+ySYODS/GG9X3GDO+xaBp96PuMAYw2K+o03GxfFz/D6Rpxf
 4IK55tKuAUBtQPbGg36O70ZXRpslgfqlUyos8ISPh5Bu5ahDIKi0WIGJqFM81aQNxgPsB8oV7
 L/lo9oXNIOw8sQspNVxzWfAykicSs2Gt44tcKpBd8Mtb4hmP5Q3GhQOE52vzPp+97jqHYCRoQ
 nWo5lngFtL4tSQbbIl1BlyPMpFWSDTWMJW3mJQ5bQGcuJkEhBMckf/cmb8CFqKUi90idH4Vgm
 DdwUiUK/KVoMU7M0M4su2Za7j/d2VFNh5byU7gF/kKV5dXK0CYkItRyKKYBr1tnk39lVntAPh
 lBBfgLk4CJn7BAgdz7yaEuR7YKiTMoXK420YufdjAqHDSMfVlJrvEcuSjs6i0By1bvGz6S8+b
 WFR6xc5P3BNDVi5NDvkoXkTg7iVhvnbBD4+i7OsiPPxTo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719390984; x=1719995784; i=ps.report@gmx.net;
 bh=78p81HGXEIcyAf68/1kHPE8dtRJAXFHX8X6g47C5BBg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=c/KOeWPDg0tB7gkXr29T0Mc0LxS5lLNf5pM/eH6ejbbN7jF92J7m1wok+j+mgMqX
 OUY00zRakeNy6TC6dg6sigklxJce5RSgyrZqkspnVkvc9ysSMH/Mg2Rfw29CQX36n
 dOwIq3FTAP0sQzjS9MMCBLq+yY+xRXdxSmyFcnxoYM8EuZAFMBW+YYlL1AIOWdXTO
 KNBn65hZtfkbX9NoYNvnEkf9U7wZ5TA9oeEFzTHt91UdnbGvHXo32Pbiy98Hxd7r0
 4EgRExBu3jMyYfuotauYXgSwySfk4/fylr1VMXVUeCSEbqmsfmYtnWyUSZmlElhNl
 0iml2w6hqVusMvgacw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=c/KOeWPD
Subject: Re: [Buildroot] [PATCH v2 5/5] package/xz: convert to cmake build
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann,

On Tue, 25 Jun 2024 13:11:12 +0200, yann.morin@orange.com wrote:

> Peter, All,
>
> On 2024-06-25 11:56 +0200, MORIN Yann INNOV/IT-S spake thusly:
> > On 2024-06-12 15:57 +0200, Peter Seiderer via buildroot spake thusly:
> > > Convert to cmake build with the following autoconf options without
> > > direct equivalent cmake option:
>
> The autotools build system is still operational, and still works. So,
> what was the rationale behind that change?
>
> Was that a defence against another backdooring attempt? If so, I think
> it should have been stated clearly in the commit log. Also, we can be as
> paranoid as we want, but it is possible to inject a similar backdoor
> in cmake as was injected in autotools, so switching to cmake just for
> this reason is not rally sufficient...

No, as the first suggestion ([1], marked as RFC - missed the RFC marking in
patch set version v2) predates the backdoor detection (but migrating away from
autoconf/automake was discusses as one measure for backdoor avoidance),
my motivation was the following passage from the NEWS file ([2]):

        - The CMake-based build is now close to feature parity with the
          Autotools-based build. Most importantly a few tests aren't
          run yet. Testing the CMake-based build on different operating
          systems would be welcome now. See the comment at the top of
          CMakeLists.txt.

And the amount of work done for the cmake build system seems to hint
that xz is moving away from autoconf/automake towards the cmake system...

>
> Note: the issue I hit can be solved by passing ENABLE_NLS=OFF in the
> host variant; we don't really require translations, so we can
> unconditionally turn it off.

Seems my intermediate step from 'package/xz: determine all autoconf options'
and '--enable-nls' unconditionally for the host variant was wrong...,
care to send a patch (as you can reproduce the failure)?

>
> However, we might hit a similar issue in target builds, and there, I am
> not sure what would be the best solution...

Already handled(?) in package/xz/xz.mk:

ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
XZ_CONF_OPTS += -DENABLE_NLS=ON
else
XZ_CONF_OPTS += -DENABLE_NLS=OFF
endif

Regards,
Peter

[1] https://lore.kernel.org/all/20240307165218.10027-4-ps.report@gmx.net/
[2] https://github.com/tukaani-project/xz/blob/master/NEWS

>
> Regards,
> Yann E. MORIN.
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
