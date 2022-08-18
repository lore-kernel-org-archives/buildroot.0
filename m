Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D750C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 09:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C48558403E;
	Thu, 18 Aug 2022 09:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C48558403E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdej5qWuDcOk; Thu, 18 Aug 2022 09:59:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EAD98403B;
	Thu, 18 Aug 2022 09:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EAD98403B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64EAB1BF2AA
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 09:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EDAB41B9A
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 09:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EDAB41B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jef2zhTuHOtl for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 09:59:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F5C741B37
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F5C741B37
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 09:59:03 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id y187so738390iof.0
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 02:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=S4qJgLzObAci/plD6gj7Bux31IYmNbLm8+7uB/1/t7I=;
 b=urkDEzv9773VDnog+HX63vndYlVmfs4C2XCY7f/ryGhEr+5fr5QvdFaQS63IT3Y+1O
 5aGyeksPuTal1CN7fw9RIb64vcpajN+Tcui9vvHk/3YmmsQeXWYSt4jnuEKwb0x1dhfg
 CQX4GpMLMBMWS0Qnf5vkHiZykztn+eqHCYO9SpEpvLUE4NkYA2FGSv+aIeZSt9NuGvIG
 Dw+JDlJwwLzuUtKKQYUFT5WfS8P//RAtziKnTfPnKTPQGxGwqSYPuH6h+Uzu4YOe3pAH
 3fz1P5hfcb5b4UPxqejoX7ux1dPN49/AF2M2vBx0Y/Gw8fH0RP++Cp2Wx9L37t+w7x/Z
 A5FA==
X-Gm-Message-State: ACgBeo0fDD6AyDoVbciT3GTxUk4iO0wcucTcktael7l3Z8wLpLHPAdYc
 6B6ayKuovYx43t36rB6mQ1IrcekN5PinUfVj2h9wCKMKb767Dg==
X-Google-Smtp-Source: AA6agR6SWeEHcbIA7/yGS7Cg5d5s1C4gPUlDEzZGre7iu2eppDZ9Z5egJXVKHLicJUi/nQYp143X2XRDuxRWX4vdtAA=
X-Received: by 2002:a05:6638:1511:b0:346:c9a0:5ad7 with SMTP id
 b17-20020a056638151100b00346c9a05ad7mr1036518jat.46.1660816742255; Thu, 18
 Aug 2022 02:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.15718.1660811183.92745.buildroot@buildroot.org>
In-Reply-To: <mailman.15718.1660811183.92745.buildroot@buildroot.org>
From: Dillan Jackson <dillanjackson45@gmail.com>
Date: Thu, 18 Aug 2022 02:58:51 -0700
Message-ID: <CAOgdC_ULWrB2uSL0LV=Fjb3k6ZnxQ04k8FnsR+EHTEK2VnWNKg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc;
 bh=S4qJgLzObAci/plD6gj7Bux31IYmNbLm8+7uB/1/t7I=;
 b=mwxnXT6en4OJnO7/aZPt2sP9XihzEkPf3CE6/DPDVDdb3A47uwCbUjlaeMpfND4Rus
 zJnaNjfPNEUSNBrG1wQNt8aUFeKpczdaPhj5MdOhi7WnKtAaAg+L3Q4fiYkCkd//8P53
 ldH4R8RWdrHTMdcvscxvPcxV3kgY1BVAVBnoweCo/xXONLFn6B7pnAl6c0e9s1euuxIq
 /xY44pHQWcDsonpgLqdY6AmPNwqyX3Ze3TG7DKPfvpmc+T3gc6N9YYN2KLHntsHsvmPK
 EmKbuXRak/zXkywH5jVsNRgMo6kOJw3AbBEa8W3o3XD1m1Aqxn8z61kV3NZU+VglD+Lf
 H/LA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mwxnXT6e
Subject: [Buildroot] Emergency
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
Content-Type: multipart/mixed; boundary="===============1471634655558317825=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1471634655558317825==
Content-Type: multipart/alternative; boundary="000000000000f5913605e6810782"

--000000000000f5913605e6810782
Content-Type: text/plain; charset="UTF-8"

Please send me admin login information my name is Dillan jackson urgency
please

--000000000000f5913605e6810782
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please send me admin login information my name is Dillan jackson urgency pl=
ease=C2=A0

--000000000000f5913605e6810782--

--===============1471634655558317825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1471634655558317825==--
