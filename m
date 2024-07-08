Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC59C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 10:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10229605C6;
	Mon,  8 Jul 2024 10:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZb8gO0j5qwa; Mon,  8 Jul 2024 10:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16E8E605A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16E8E605A7;
	Mon,  8 Jul 2024 10:18:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3DBD91BF470
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 10:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3586D80EF1
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 10:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBJ8sAvpb3iy for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 10:18:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA5E380EEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA5E380EEF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA5E380EEF
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 10:18:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8obG-1sMn7348GM-017djl; Mon, 08
 Jul 2024 12:18:40 +0200
Date: Mon, 8 Jul 2024 12:18:39 +0200
To: Stephan Lukits <stephan.lukits@gmail.com>
Message-ID: <Zou8_2qVLeyRWPaD@probook>
References: <DDA24EB9-F4B2-4BA9-8A2D-C28C9BAE8F8E@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DDA24EB9-F4B2-4BA9-8A2D-C28C9BAE8F8E@gmail.com>
X-Provags-ID: V03:K1:11JngcXRvJ1swCU1pnkVbRzommc2iEmHWVilPtIzSrtkuC3rYL9
 YDT6qqq8cRpf4l9m19WpjVW66S+QgWMDu3+K5Fc6f2h2zgagJ/LKKxlc5BnYIX+esZ6O+te
 Jr7IEZsIofqTolEmpK7AHOO3omJbrknKKhaE7o9DXcZ1Bj+f5qSHdiv0RoiZ0ckou8RWJKn
 v5qGxavqnDSDJrrO+x+Zw==
UI-OutboundReport: notjunk:1;M01:P0:IYkSy3/HM8I=;tgSygvDMccDEUL9Kl9/E5gEkL1u
 UltWEdBcwVzetAwFKmUZh9o0GnnQlV3wXZN/DSdojqcM4AsLLR0oCiKSD9IdNRmL6H4VXoq2j
 Mcr0CcHqizzyBMBLeUjvI4YGw2XZu28EJnjH9P+Ss/OdP/8lR+J9nNB9yj9COr2FLbewwkolR
 tZ3Kmo1jRnErN/noSKhEW93TYpdfbXJ3JQ5F3uKStvSp8e4kE52HgiWFryxvhGp8hggJ3tz4b
 JHfUUYr4yNzDUtUgrYA8wnv4AxaiC6Q5KI3X7v2Xq6Oa5WRTPAqvzZZeKOGJUGEo3vL+7tDQS
 saSz6hSagLFAA/4e8xbhQr2oZp7zzLA/tr6C0hOCafd5p4I5rKHSZ1qkffCq51MQA0RiiuQLp
 uNA4OTCdkvvFKg+hB61FiXPBnVjRcEiR9DmQEryOE/XmLseyGxVhZbPikSTOkfdHj7YJpwE4D
 Sg/it6u8MK4BKthh4opdyoGHGZEai2rOtgFSdxayajPyuDYdEwg1ab6viwPgNzXxg5Vo06Hwx
 7hexpiPw3Wsvzl4mfPniiy4POdCtjHKLKwsipJwRf6GY8yIuioTwXvwh8bCnFyiM78Tb6qnSa
 YZGz7NHlZncUJH+Ri1A7hsjdi1CUYex+WziLoHXr53ttpphQdwKLCJm5AXg/Ypi+BvTh0kRme
 +hJ2yZnsKMY3hLO/p9MF+P8ywFMoIBj/9eJXhI7ZBt9GAj2/UN7EFyroOxq66eDhZM0kgv4y/
 vV1NS+TNZ65htXIS1HB5EE6wGPpsqVMjGD29xIm2tIthUv6fOc2/Xp1y5kPtGwR65IPWFjIMA
 /tdt6qvF/q2GwjZONFeyaAxllNf8a7bi0r6bmlW6WUEeE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720433920; x=1721038720; i=j.neuschaefer@gmx.net;
 bh=lpgU5Oq0IK0q81qfmGLJAX8q5jotfAQ/PRRPIXfJIes=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=b/qVtm/T8zY1edmRY75GP5titoKXrKpRV7uyoBqdBw/mpa9fsN+mdPVfIe5zGtRM
 YsIhLqGN2FA5e9Ot7v09G/CQgqta5Eiqkd8XHbISid8MCYDU6YkY25+hfKpDOcOGC
 9Noo/sDIH9hLrASstLIL+pFkpU2NUVhPOg1mqicYcB759CwhC3zWfnyeOB6X577Zf
 eQ14GMSu3VNV/BnmAyDdT4G0p8kYVsfeLaT5G8ofg/2XV4QVA45yP4s2Eo0TITjPR
 +GWiHTOzzecgzHaQpFuTAKCEvHuozsFUMgdmGzpEUlZ6BNAMesI+GWMdxnXp/f+Tz
 PwSyJ1uyIKVfmCxqVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=b/qVtm/T
Subject: Re: [Buildroot] configure: error: kernel headers required on Linux
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, May 28, 2024 at 01:17:07PM +0200, Stephan Lukits wrote:
> Good afternoon, in an alpine docker container executing
>
> $ make raspberrypi3_64_defconfig
> $ make
>
> fails with the message
>
> > configure: error: kernel headers required on Linux
> > make: *** [package/pkg-generic.mk:273: /buildroot/output/build/host-util-linux-> 2.39.2/.stamp_configured] Error 1
>
> I wonder how I could fix this, thx, Stephan

As far as I can't see, `apk add linux-headers` should do the trick.

Arguably, perhaps host-util-linux could be patched not to need the
kernel headers, but that would be more involved.

-- jn
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
