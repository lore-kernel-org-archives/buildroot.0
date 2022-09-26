Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFBFC6FA82
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 16:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D00C60FB9;
	Mon, 26 Sep 2022 16:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D00C60FB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hvLPFhb0tL1P; Mon, 26 Sep 2022 16:16:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A988C60FB1;
	Mon, 26 Sep 2022 16:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A988C60FB1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56A1A1BF2BA
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 16:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A4AD415B5
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 16:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A4AD415B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lt1zEVJjUEdf for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 16:16:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49CA24156A
Received: from c1552.mx.srv.dfn.de (c1552.mx.srv.dfn.de [194.95.239.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49CA24156A
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 16:16:00 +0000 (UTC)
Received: from chuck.hrz.tu-chemnitz.de (chuck.hrz.tu-chemnitz.de
 [IPv6:2001:638:911:b0e:134:109:228:184])
 by c1552.mx.srv.dfn.de (Postfix) with ESMTPS id 0E0AB16006D;
 Mon, 26 Sep 2022 18:15:56 +0200 (CEST)
Received: from [2001:638:911:b01:134:109:133:32] (helo=mail.tu-chemnitz.de)
 by chuck.hrz.tu-chemnitz.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mario.haustein@hrz.tu-chemnitz.de>)
 id 1ocqlw-005FcO-3y; Mon, 26 Sep 2022 18:15:56 +0200
Received: from mail.tu-chemnitz.de by mail.tu-chemnitz.de with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <mario.haustein@hrz.tu-chemnitz.de>)
 id 1ocqlv-0048s3-Pu; Mon, 26 Sep 2022 18:15:55 +0200
From: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Sep 2022 18:15:29 +0200
Message-ID: <3721052.kQq0lBPeGt@localdomain>
Organization: TU Chemnitz
In-Reply-To: <20220924103036.6ba8ea92@windsurf>
References: <20220902222849.1098641-1-mario.haustein@hrz.tu-chemnitz.de>
 <20220924103036.6ba8ea92@windsurf>
MIME-Version: 1.0
X-Scan-AV: mail.tu-chemnitz.de; 2022-09-26 18:15:55;
 ac0bc05c25f20c8e6e9b559ddb0ab20e
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=tu-chemnitz.de; s=rsa-dkim2022; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o+MbNU1RYnIY5rglaHZpNMN4TFVfxC0Am8JsY65O6c8=; b=KHWO+hPEVkb/XyAO7UgctqQw1y
 i3s/17aW0khF9rzOX5JNFYf+3x4qYO+rtKW8Fh1mR/fQn1NIgvwl8TosRuF7Ja+8gveYgYgMkivMw
 VTmXRKT2dkOIefCKkMVhPN7FApCTscAGbPJpB+hPRdrY2nQEt59a1x0hgD6m6VmSK6AruBt9T6Iyb
 PQnvOg2RTdbRHrGwPacird0fzWcqVI7hY/sroLHyMQVW5lfDbOi6dbB3MFBvRB0fDvhKJPcTWkErr
 r7O2tWYtRgeLF+UxPFnBRI/+OCz6o774BeoSTbKc2qiXk7e7eny38xFa8A6MDuaPPDK3LwvMbzeJZ
 +7Bpxg/w==;
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=tu-chemnitz.de; s=ec-dkim2022; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o+MbNU1RYnIY5rglaHZpNMN4TFVfxC0Am8JsY65O6c8=; b=J+5JzRet74lo/VBiXEWFyIF7Gt
 4uivl9HdnulDMakGEpIt9hx/qJbpCdyZp4+0UtQ1nUbSqs0kMiS/zOeI8eAA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tu-chemnitz.de header.i=@tu-chemnitz.de
 header.a=rsa-sha256 header.s=rsa-dkim2022 header.b=KHWO+hPE; 
 dkim=pass header.d=tu-chemnitz.de header.i=@tu-chemnitz.de
 header.a=ed25519-sha256 header.s=ec-dkim2022 header.b=J+5JzRet
Subject: Re: [Buildroot] [PATCH 1/1] package/dcron: fix /etc/cron.d/system
 cron jobs
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
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1146125565490035603=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1146125565490035603==
Content-Type: multipart/signed; boundary="nextPart3483726.iIbC2pHGDl"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart3483726.iIbC2pHGDl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, "Alvaro G . M" <alvaro.gamez@hazent.com>
Date: Mon, 26 Sep 2022 18:15:29 +0200
Message-ID: <3721052.kQq0lBPeGt@localdomain>
Organization: TU Chemnitz
In-Reply-To: <20220924103036.6ba8ea92@windsurf>
MIME-Version: 1.0

Am Samstag, 24. September 2022, 10:30:36 CEST schrieb Thomas Petazzoni:
> Hello Mario,

Hello Thomas,

> Thanks for your patch. See below some questions/comments.
> 
> On Sat,  3 Sep 2022 00:28:49 +0200
> 
> Mario Haustein <mario.haustein@hrz.tu-chemnitz.de> wrote:
> > Jobs with the syntax @hourly, @daily, ... were not executed since the
> > recent version bump. This patch fixes the bug downstream.
> 
> Which "recent" version bump ?

I meant the latest version bump in buildroot, so effectively the bump from 
version 4.5 to commit 1ba33c3325df48de46263276a43ed76cf9d81518.

The bug was introduced by the upstream commit 
f048a83da348c1d62204fcbdf407b7abf33e3db0 AFAIR.

> The last commit on package/dcron/ in Builroot is from January 2021, I
> wouldn't call it recent. It bumped from version 4.5 to
> 1ba33c3325df48de46263276a43ed76cf9d81518, while switching to
> https://github.com/dubiousjim/dcron/ as the upstream location.
> 
> Is it this version bump that broke things?

Yes.

> Could you use "git format-patch" to generate this patch, and include in
> it a reference to the upstream pull request
> https://github.com/dubiousjim/dcron/pull/35.

I prepared an updated version of the patch. I hope you are satisfied with the 
update. If there is something I missed, just tell. It's my first patch to 
buildroot, so I'm not familiar with the procedure.

Kind Regards
Mario
--nextPart3483726.iIbC2pHGDl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0dWxQ/gtEp4RcqrdrrMm8sIKEfoFAmMx0CEACgkQrrMm8sIK
Efp+3RAAlhsiqkH8azCFpEC0Ox4DmSz0NWwJSVt+kDhlVz3zFjbkgNq/sBU9Y7Yq
a5AmQFyhFnEC2ZX4eAT8hnVwTh+xl9IyUSLrI1+6+VACLZbdd+sytK2b4l23K59f
nKt21rzrps7mKiap09nfnZ5yZqGEyWzoHhQjZlNbbcmxtOcNLw2gQujAp/G406Bb
1ywNZTR99CL05xrk1DbqUfPq0TZAi5DQ6UZSF7BU2RGvGLMYIAezqfOFOId4uG7c
7Ma9+3unlBgIMIXP9SVKni89t6SojYKfNdyfUZ9zimr+Pgca9HKCex8L8lFDNQWu
RkUKbzZowVyX95M3lbnvdWEBgQlbC0k8ULzDjNJyeeM8dRNY7bDX/NFEH2EwED7I
S5MYMFBBhkGWn0/EPOFy9QDCbG6NjZgLgU1RrunoGzDN45IL/RVgraGK1Hn2NfWO
KVDqvwMojRVLCCv445IVsRisZjr0qNsQRvPhbmycHW0jgEojmnQ9XOc4F97oXgRA
yw8sF9HpPxZbasCxB4n2h4wncxsNCjqXL4SPn3BAoJYPBGoAh4l1ApzelAr3FKFC
PDrTJ/SSbp6cfmCWe0v2AUY+Omyg09K1pCiGA66JeJxGxI5Ww3lfxLB/w2Hx/wiu
fcmn1Oafg4UH3kAiLueCMO94q8sfSTa+e7TAG1DLcZl/i55RIJs=
=UoC9
-----END PGP SIGNATURE-----

--nextPart3483726.iIbC2pHGDl--




--===============1146125565490035603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1146125565490035603==--



