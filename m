Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A67AC83F12
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 20:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C52B4099E;
	Mon, 28 Aug 2023 20:09:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C52B4099E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sn1rEC-7oZQW; Mon, 28 Aug 2023 20:09:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 254E7408D2;
	Mon, 28 Aug 2023 20:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 254E7408D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8BE191BF2BC
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 20:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57DA8607AA
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 20:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57DA8607AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O95IsER72hTL for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 20:09:44 +0000 (UTC)
X-Greylist: delayed 423 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 28 Aug 2023 20:09:44 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A08DF60792
Received: from 001.mia.mailroute.net (001.mia.mailroute.net [199.89.3.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A08DF60792
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 20:09:44 +0000 (UTC)
Received: from 014.lax.mailroute.net (014.lax.mailroute.net [199.89.1.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by 001.mia.mailroute.net (Postfix) with ESMTPS id 4RZM0w1FYZzlhb6n
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 20:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 014.lax.mailroute.net (Postfix) with ESMTP id 4RZM0s0Tfszlv8Qj
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 20:02:37 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 014.lax.mailroute.net ([127.0.0.1])
 by localhost (014.lax [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id JQn8zU6T3jwW for <buildroot@buildroot.org>;
 Mon, 28 Aug 2023 20:02:36 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 014.lax.mailroute.net (Postfix) with ESMTPS id 4RZM0r017kzlwJ2t
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 20:02:35 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Mon, 28 Aug 2023 16:02:34 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Mon, 28 Aug 2023 16:02:34 -0400
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Github download helper possibly not working
Thread-Index: AQHZ2eqW8N1URE8y9EqxWw4NqNowfw==
Date: Mon, 28 Aug 2023 20:02:34 +0000
Message-ID: <ad574a2a-a776-d7e5-8dcb-f3693d222558@carnegierobotics.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
x-originating-ip: [172.30.0.81]
Content-ID: <1E0C69AA03765C4ABDE6D74C1D86F7C5@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=mr01;
 t=1693252956; x=1695844957; bh=HaPvsirN3R6nWyjWTtmNV+SHHEMj8BQj
 EoEw9VdC2iA=; b=BgFWqSRHFE2x4L76AG56NDCalZ3Cd9BYC81jhVCnTGR1/2BF
 SL24AUX3f79pSYKcW02qiUYhSzvNK70wkKYOlhjE6ns7F0vi/6mDd/fGpH3dK339
 /Z+sCYIFqVqM20YUBZXx3/RDsESQRBEEfJr+g6qew6s5iH5J922hyCVCllE490bP
 7xCz3tHL+4CXHbvHSABbu2DxjgHxKruQ2hlBwmsmZG5tPfog80C/7B711gm+6/0O
 2NVBhCZgyfMNwbwvxtbefcdHQXVSyXT3ldUS6hFCUbhYyubsK/im6W/O1JDRW8Ex
 cZu8OiNmDI5bDflvO8qDc6i2MV6eSC7fJlto2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=BgFWqSRH
Subject: [Buildroot] Github download helper possibly not working
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
From: Woody Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woody Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello all,

I've noticed that packages that use the `github` download helper are 
falling over to buildroot mirrors. I've tried with packages `yaml-cpp`, 
`zlog`, `swupdate`, and `pcm-tools` -- all are redirected before 
eventually getting a 403 from codeload.github.com and falling back to 
sources.buildroot.net. Is anyone else seeing this behavior? I'm trying 
to find a workaround now, but I'd appreciate any help!

Thank you very much,

Woodrow Douglass


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
