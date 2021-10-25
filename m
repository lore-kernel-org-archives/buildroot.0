Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15581C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:32:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFD8761154
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFD8761154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E90B403D2;
	Mon, 25 Oct 2021 19:32:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zk9kMMGa5254; Mon, 25 Oct 2021 19:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 802D2403C6;
	Mon, 25 Oct 2021 19:32:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 015431BF34B
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4142403C6
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBKIFyymKoiI for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:31:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B143C40288
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1635190315;
 bh=2W5QwSHzsJJGx5JiZkdMSG1/GAMARHFcoGiMuWrPA0Q=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=FDrFh0d/3i4dCPnSchOytY6hcVWp1nppISLUr+ZWG6hKCh6IE+ZgjvGAdsj181ykp
 VMpMFOk+Q/A25GJLvq8acRjQMVAlrhTGX3632EFpcHLya9YkEfFmzG700ZZJlENGz9
 p2NhJ06Ue1bV+ndD5SmEjOwCW2lEY1wYrw1kBnec=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.232]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLQxX-1mMjdI1OGB-00IUqk; Mon, 25
 Oct 2021 21:31:55 +0200
Date: Mon, 25 Oct 2021 21:31:54 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211025213154.6f9ef25f@gmx.net>
In-Reply-To: <20211025083217.3988476-1-james.hilliard1@gmail.com>
References: <20211025083217.3988476-1-james.hilliard1@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:eHugR/utZy5lKOLWadWWWuT+g0hq1SoF2Ie/YKTXfcFEAutr7gl
 s+b25pHeiWFODurD0rVuBbMJgGWo5IEtSG+/1ba9Vsowq/z0krtQeLlA0H/JYqYM/PiCaec
 431NjqjBGSTtPFARyHq/JCoJjCsluo2cmGTwXtMNAQqcDqvI+aVfPFrv+wwY52XDYQuladv
 aHWf26DZzlIKDvQ7OqDjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qd1Xr040jK0=:ju1g86sZCSpkgLl1A5AbCB
 4haoxRx1SE/5C3+k1kQPtzTCMmEpRkgTDuoBAuUvuIKmlUe2FOcgdLvn19RnRfdMbuHzcTP5n
 TQaJMGCvTm6TnJvLyVzOWEBwrAqrp2JMrR7c/nXysmXLehdXhefgLyj7JI7P3Q6VBz+NVIH7p
 cEk1N07rbeY/zAdENSntF915YRHspMVBuGN9r9QPvoxpBhrG/ObIgYzK8+Yf51bxXxDPLUXfK
 /AZJSPEzYMANdMJ4c5y6pf1SX2wn9n1oS/KEOhXYTksNkwRySeeKOm8A6QKNEOOmZWUPYifw3
 DIYI40L4gjVpC3Uk9eo7yVh5JgPKEhyKYMczQyvSGnvpIhJOxbVJZOp8tauJLAXXI7lQ21ULG
 vYZQusE1KltmeXtIEpIGxYpfF1aGI/k9wy90BmpWUruX6smxWnPEXPZ7yIbTFg+hJO6XjASAq
 uIBEO9pous5I5u4mhEyjRhujaBp6CKhJguOs2HxvvVqTDQacihWiDnu0n8KGDlGePwZpMMWY0
 nrNRyxJd07vJGL9Z548T3KL1pmJp69O4uSKXwP5ix7sgiBjuKGeA8c7aDiKBnBBc1WWRLMS2i
 HqqGC/wYlsmK9Qr3LYTZZ4yQOJKW23iWazwHIPJFy0z9zcYy8d65ah0IPr1cMrqkndeVUnMRt
 2gZZ/KpqXTJUHRogreiO2y2GcTw7vnzAoXDoQK2KiPdmx9uhAL5By/uZwSnMdbEOWtzdGJPnr
 RfmFUfn0cgjxHlxrKGj5VGbbINLkNygy+oa9oWszbMIJ4YeJlNptT0UXpFl3gOhbvR7FUXSee
 O/6K9yXmmupiT+6PVKx+OlRSua2vEd8SoSutplXj+GMX27csJdh0wELPLaqrHMwt5pBYRHfyI
 p1PjpoXbaTPj2l0n4+vSui3ff9iUOaiJdNGScJoGFtu0e0UsZWUOlmeclAqtlChMyl5x7eKxa
 Z9BpxXDA+lxMmVVfk5of9qdLlFKN/OkTgQ6q3ANVw4QB1qV7rj43Mwp2F9xs5daEspBFcaWdm
 qVIa2mg+BKuLSSy2SBLPUHJ2vjMPbcqmswzsOLB5Ex8GbdUDjesb6vTtnV6xp3rRB0QYXW9Ur
 gKwpbRpaYz6rFQ=
Subject: Re: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-vaapi: fix
 tests config option
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

On Mon, 25 Oct 2021 02:32:17 -0600, James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> output/build/gst1-vaapi-1.18.5/meson.build:1:0: ERROR: Unknown options: "test"

Same comment as for the package/gstreamer1/gst1-plugins-bad patch...

Otherwise (and thanks for fixing):

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regars,
Peter

>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> index 497c6df0d3..9810b12cf7 100644
> --- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> +++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
> @@ -24,7 +24,7 @@ GST1_VAAPI_CONF_OPTS += \
>  	-Dwith_wayland=no \
>  	-Dwith_egl=no \
>  	-Dexamples=disabled \
> -	-Dtest=disabled \
> +	-Dtests=disabled \
>  	-Ddoc=disabled
>
>  ifeq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
