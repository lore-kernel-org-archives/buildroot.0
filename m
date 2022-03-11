Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B203C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 07:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02B06841B0;
	Fri, 11 Mar 2022 07:24:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HytZYaDRRFBO; Fri, 11 Mar 2022 07:24:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AA8983EA4;
	Fri, 11 Mar 2022 07:24:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C05881BF297
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 07:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A69E160B24
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 07:24:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7btd2DsSZa-3 for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 07:24:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AA1160B1D
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646983454;
 bh=203nCSf6iQW3q9de5AB6eNdBISlRxJNDAkqyMTZz60s=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=VQVugjL4/yJM6wLE6uPoGNAnrARYfq9xEs2CHihrEm3gS4+vv4HZwfRX3D9fG1TAR
 3+BrPz0T/V1NotZSeX9lpYRWiS985jm+I0C3b+husoOZOlCiAsIeNT6FaJxGh/lEqm
 OPb8TKv0/QI4NYAyk2X6UefdWTFi8zy4AM3T1xq8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.204]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDQic-1nKIRM2TFW-00AV3g; Fri, 11
 Mar 2022 08:24:14 +0100
Date: Fri, 11 Mar 2022 08:24:13 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220311082413.4bfe7465@gmx.net>
In-Reply-To: <c5548e2e-8cd5-141e-3f8a-060127e43540@mind.be>
References: <20220310140350.1955655-1-john@metanate.com>
 <20220310213840.32655ec7@gmx.net>
 <c5548e2e-8cd5-141e-3f8a-060127e43540@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:SpxMZSzm6GQeqa+8pw3AmLB32XgTMuKMM0hg62xOd/Mkjm1z9A7
 1HMdOtRLivrEl3N9LkW6ZLZ5NjhpY8y31+xJXjktqRFQlwoGIgysimV2mpnlkJ0GNeXTwwk
 lTotz2gQauxiFqguLXsh3atNDKQPvQjfy9yfQihs8j6wpObBHO9VZZys9rH19etjO7YGy5v
 gfzs4lrVqLlYbN8mHnQZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fMb6joFQ9Ds=:UAoPD8ENdAKwWiI+WmCouz
 kUW8vml/vXXR/+DHhkiSYkmdaDaArdk0KxzgIF0lD2JdaqSeJRN2WWrc83nOmWyIXpfSrIdBu
 1cItLn2itGLs9qLjzSrmvq4Mdt2fvK6OIhN0JEf2fXP6XftJcJtLuBtKuBDyLqhZ4X9Wzd+aW
 cfGPS/lZV9ILKVLLdBNsUNvRNyCQeEb8t306ABeBqX4RlsN/qcQVWmWl3QChVo5345L52SEyr
 bYKW+AO21mofEeM5U2jKQpfmtflrfZAsOoG2l3qqeKwIKSG5LVtVBHbjy0H60gaQJtap+lFF0
 VSyYvslb5cWxuY5mfsMGnTJizfVTKZvOARs3lKrTfU1J93X8j7kKugA/na9nlQTPCS4bf57Rl
 WFfEsgf9reG+5lp8+bjT2S5kUvRw9kW8DfpWBpG+xAmQCBjPwvlTZNoaVsFdYjh0a83PNBaXc
 gHyd62SRpNCtyHPyDJ4xZo425IIIMUKfd++VoIlOiLlXXGRx2czmtpy+8WcOquses2NazBNTa
 vKy/epw8m5jyeogLo3iLHK82AehrT5frzSp8SL8879t3BrN8QhHrv4nRgdne77Dbfa6lFJ26R
 5ddcEPOuicKalkpQ/k8YkokEnW5b9XGKlC//ea1qikXBdRLBGJFqf3i3Dgdf8BvayWv6AnKW6
 +RmRYjWTtuac2zRPzHE3d3QKkvYOWYr6j4b3KYQSd5sjG2bG1khN/Mmyqzp1Pz5kzRwJWv/9O
 ufX44KY7GhnKIEVH/uU3GSh7XJhkqwCF/qsslHvWrvDJCsjy64DnnpTZrFRejrHsvxdjTBt+r
 ovR2q1jmoFhE07L8YXIb5m+PInBVtHb+E7nWl9VPsuwAznYVMCkybwOKMyURslMOA/OX2TrEM
 R1T//EPkyvQLE52ezDozoyzwpoK91Y/8WlH+vsh9a7nLb3uNG//zJa229ngXsYD4il6mWxwAL
 fpdt7P+Jvs6F62Dr12PmDPnoPoEl0YYudU6akT7siCZ6OD1O2xyEyunahxemh4FS4o9QJBVVo
 irW6KqAFSBNlCt3isBrdkEGJHSIXnhVWB6+Lya5qA6vr0lEsgj5a7IvWPnOCejoBhLpemON4N
 J/nwjRJitXL6Ys=
Subject: Re: [Buildroot] [PATCH] package/openssh: backport upstream fix for
 32-bit
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
Cc: John Keeping <john@metanate.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout,

On Thu, 10 Mar 2022 22:03:23 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 10/03/2022 21:38, Peter Seiderer wrote:
> > Hello John,
> >
> > thanks for the patch, some minor nitpicks...
> >
> > Better patch subject would be:
> >
> > 	package/openssh: add upstream patch to add seccomp ppoll_time64 support
>
>   Applied to master with this changed.
>
> >
> > On Thu, 10 Mar 2022 14:03:50 +0000, John Keeping <john@metanate.com> wrote:
> >
> >> sshd is broken on 32-bit systems because ppoll_time64 is used by the
> >> application although it is not allowed by the seccomp filter.
> >>
> >> Apply the upstream patch to fix this.
> >
> > Better:
> >
> >    -add upstream patch ([1] to add seccomp ppoll_time64 support
>
>   Since the subject now already says that it adds seccomp ppoll_time64 support,
> this is redundant. Since I'm lazy :-), I didn't change this.
>
> >
> > [1] https://github.com/openssh/openssh-portable/commit/284b6e5394652d519e31782e3b3cdfd7b21d1a81.patch
>
>   There's already a reference to the upstream commit in the patch itself, so
> this is not really needed.
>
> >
> >>
> >> Signed-off-by: John Keeping <john@metanate.com>
> >> ---
> >>   ...llow-ppoll_time64-in-seccomp-sandbox.patch | 31 +++++++++++++++++++
> >>   1 file changed, 31 insertions(+)
> >>   create mode 100644 package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
> >>
> >> diff --git a/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
> >> new file mode 100644
> >> index 0000000000..34b309bd9a
> >> --- /dev/null
> >> +++ b/package/openssh/0001-Allow-ppoll_time64-in-seccomp-sandbox.patch
> >> @@ -0,0 +1,31 @@
> >> +From 284b6e5394652d519e31782e3b3cdfd7b21d1a81 Mon Sep 17 00:00:00 2001
> >> +From: Darren Tucker <dtucker@dtucker.net>
> >> +Date: Sat, 26 Feb 2022 14:06:14 +1100
> >> +Subject: [PATCH] Allow ppoll_time64 in seccomp sandbox.
> >> +
> >> +Should fix sandbox violations on (some? at least i386 and armhf) 32bit
> >> +Linux platforms.  Patch from chutzpahu at gentoo.org and cjwatson at
> >> +debian.org via bz#3396.
> >> +
> >
> > Missing:
> >
> > [Upstream: https://github.com/openssh/openssh-portable/commit/284b6e5394652d519e31782e3b3cdfd7b21d1a81.patch]
>
>   Except for the signoff, the patch is literally the upstream patch, including
> the sha1 in the From line. So an upstream reference is not really needed. Still,
> it's useful so I overcame my laziness and added it.

But the sha1 alone does not tell to which git repo it belongs to, but the explicit
upstream link does (and has the nice effect to gain a one-click link to the
corresponding patch/merge-request etc.) and is a prominent remainder in case
of package version bump where the patch comes from...

Regards,
Peter

>
>   Regards,
>   Arnout
>
>
> >> +Signed-off-by: John Keeping <john@metanate.com>
> >> +---
> >> + sandbox-seccomp-filter.c | 3 +++
> >> + 1 file changed, 3 insertions(+)
> >> +
> >> +diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
> >> +index 2e065ba3..4ce80cb2 100644
> >> +--- a/sandbox-seccomp-filter.c
> >> ++++ b/sandbox-seccomp-filter.c
> >> +@@ -276,6 +276,9 @@ static const struct sock_filter preauth_insns[] = {
> >> + #ifdef __NR_ppoll
> >> + 	SC_ALLOW(__NR_ppoll),
> >> + #endif
> >> ++#ifdef __NR_ppoll_time64
> >> ++	SC_ALLOW(__NR_ppoll_time64),
> >> ++#endif
> >> + #ifdef __NR_poll
> >> + 	SC_ALLOW(__NR_poll),
> >> + #endif
> >> +--
> >> +2.35.1
> >> +
> >
> > With this fixed you can add my
> >
> > Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> >
> > Regards,
> > Peter
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
