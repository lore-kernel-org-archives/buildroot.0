Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3445C54EE9
	for <buildroot@archiver.kernel.org>; Thu,  8 Sep 2022 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E66D41600;
	Thu,  8 Sep 2022 15:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E66D41600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XeHs5159BCf8; Thu,  8 Sep 2022 15:54:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6582C415F9;
	Thu,  8 Sep 2022 15:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6582C415F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22B821BF2B7
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 15:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A6EE415F9
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 15:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A6EE415F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2mQpo1CJxFA for <buildroot@lists.busybox.net>;
 Thu,  8 Sep 2022 15:54:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FC0D40A14
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FC0D40A14
 for <buildroot@buildroot.org>; Thu,  8 Sep 2022 15:54:01 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id v6so7040070ljj.0
 for <buildroot@buildroot.org>; Thu, 08 Sep 2022 08:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=QQFgRJWEcAV5+hNFDtHokKi1VuCgzDHfdT5rglBJ3G0=;
 b=emXqnJaF7Q5Z39LtdGp96Nh3GYM1iEy+OMQs+Re7ho/LROKyhefUKIQi4PeVim7mxg
 jcuM+LtqCO032L6qrwU6mOswyHQewJnpkuoqWDFE5IWYsyR+Hb02i4MgKQ7leP1rzueN
 l5SXbfrAsjy75OlQ+efvk6/vP76QnFLFFBtjvZU7bbyWYwRPPMkNLgF4DIeKukEKWVEO
 iwBztj4BSPIX23ne5AS+kLw/YAcNc5PbXp7paWoOt0qh75yOrYSNOoSYKAOCCz6VcX7H
 uUxdfKk8xMQ+NemwjCvt3SjZ9M2o3OTsvSDGF89Fps28/hJtHB4ehEX9sj6p74EMN63f
 VgtA==
X-Gm-Message-State: ACgBeo0YcdfA2p++CRmEI50TRph2xD/GQ/uT8GODBe/CB1fMaYwRRgcp
 /vhLsKUUJJdYHJ6tsStkXlfzlwSWHZKB1AZtLfjMi4BzYqc=
X-Google-Smtp-Source: AA6agR6dRNw2m1Tnwc/jYhpOdUV59O+HPYG/2ClCIs6fBMl1Ji3CNEAfPgPuSNy0CTz5vxMkrRkzxx1dwLVW2uT10e0=
X-Received: by 2002:a2e:a448:0:b0:262:f7c4:31ad with SMTP id
 v8-20020a2ea448000000b00262f7c431admr2651713ljn.283.1662652435962; Thu, 08
 Sep 2022 08:53:55 -0700 (PDT)
MIME-Version: 1.0
From: erichiggins@gmail.com
Date: Thu, 8 Sep 2022 08:53:44 -0700
Message-ID: <CAHfxMJ69P8NVSqJr2tkNajMbFG-FD=Wz2DUfdstRQSqi86_3qw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date;
 bh=QQFgRJWEcAV5+hNFDtHokKi1VuCgzDHfdT5rglBJ3G0=;
 b=CZbagUY/ryIsK2ciEpJMGesVVthdt6LGSA7WvWlDD9wl1ODH+RYcH11u1p1PCN3oFn
 A6KtzCXUpyUhtDBGZnISKsIHaN09ds8g82C2RTZjx2RQ/guY/ihRcJPRWooJ7/T9slwx
 Lc6GU3EejnIkDoiwjCrsXJ9HgWBDzYngBQjfDT1kxg19ZjdYI8Ayolj4GlM2qcMrVqfv
 H09zS0YJlGR7Nx9mNVk3xU9bqIsApkg6JpxYxAFkkdNT0qisSANQM0Dv5bvNjT0L9lpM
 ZwQ0BmdX3RBY4okEVL55vvgJSpT609vA2h120AmIpbVG3oo+5i2sMUohWb0afCNm66Pt
 ucDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CZbagUY/
Subject: [Buildroot] Patch for buildroot script utils/scanpypi
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
Content-Type: multipart/mixed; boundary="===============3816457855739825161=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3816457855739825161==
Content-Type: multipart/alternative; boundary="000000000000d4a2c205e82c6f00"

--000000000000d4a2c205e82c6f00
Content-Type: text/plain; charset="UTF-8"

Hello all,

I've created a minor patch to resolve a bug in the utils/scanpypi script.
I've written up the justification, examples, and technical details in the
following GitHub gist which also contains the patch contents.

https://gist.github.com/erichiggins/223b2495ada64001c44deedd3a3df6ed

Happy to discuss further either over email or IRC.

Thanks!
-Eric

--000000000000d4a2c205e82c6f00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<div><br></div><div>I&#39;ve created a minor pat=
ch to resolve a bug in the utils/scanpypi script. I&#39;ve written=C2=A0up =
the justification, examples, and technical details in the following GitHub =
gist which also contains the patch contents.</div><div><br></div><div><a hr=
ef=3D"https://gist.github.com/erichiggins/223b2495ada64001c44deedd3a3df6ed"=
 target=3D"_blank">https://gist.github.com/erichiggins/223b2495ada64001c44d=
eedd3a3df6ed</a><br></div><div><br></div><div>Happy to discuss further eith=
er over email or IRC.</div><div><br></div><div>Thanks!</div><div>-Eric</div=
></div>

--000000000000d4a2c205e82c6f00--

--===============3816457855739825161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3816457855739825161==--
