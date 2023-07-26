Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4800EEB64DD
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 02:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80BDA61195;
	Wed, 26 Jul 2023 02:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80BDA61195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYItFJz9OfWG; Wed, 26 Jul 2023 02:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B72476117C;
	Wed, 26 Jul 2023 02:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B72476117C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B31C1BF39E
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 02:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7091E4060F
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 02:43:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7091E4060F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0BhRUSB3TeBj for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 02:43:12 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 121B840169
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 02:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 121B840169
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9a28a4166so20504731fa.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 19:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690339389; x=1690944189;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rmict+25nAh/yVYg2ual9q0rLjjb/yZm/bjG106Zhqc=;
 b=DjviM9bp3n8B1vzeP39YQ5azMNVsVOVAhhLijwtHMXkMb/Qs9BOJzqzmehS5j03Gp/
 ZSSsw+ejLofJe4ZPTtoyGQ3RF08nhTAoisjMe9LCf4NMQawwmxzjxmdJ9cl5/9tCQTnf
 B43clQDoaHLgMYG3Oj7tpmL4fYcTfkRA1j5D3OY4WMDNgiZSZetvet9Hw3eudT+AvSdo
 HLAp5rWt6lgeixo/+vxZm+LAaU+slQnrXTf4z19kf3JCmL6/XJNqvWvwI/VCs3UKKxL/
 O3oGDuqB+eYVzPSzfQblDid+j6KDwF+Vyky2UBAsp7cXoPGGb3Fu9wH9YRVEgiac5v5T
 80uA==
X-Gm-Message-State: ABy/qLbz9d3guZVmHaprLQuBnvF3OKWgalxBraixO5tKbGVwseNtVANh
 W8t1ByBYqBLaquaxf8LdTIBVKSMCxgEOztkzQmXV74jUls4=
X-Google-Smtp-Source: APBJJlFRnGfgEFWpZIsoTlbLFwu4nVtJebMMO9wkICigiiDkP8R9p9p7Faq+rxjzDVVy9gWCLQYF/2q8GXVqhJqxOI8=
X-Received: by 2002:a2e:3c07:0:b0:2b6:9fdf:d8f4 with SMTP id
 j7-20020a2e3c07000000b002b69fdfd8f4mr339114lja.29.1690339389340; Tue, 25 Jul
 2023 19:43:09 -0700 (PDT)
MIME-Version: 1.0
From: Zvi Vered <veredz72@gmail.com>
Date: Wed, 26 Jul 2023 05:42:58 +0300
Message-ID: <CABRndgydwGOk5W1QFQQ3CeM3724aU5-AKeh0yRBw9dJD0yr7Lw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690339389; x=1690944189;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rmict+25nAh/yVYg2ual9q0rLjjb/yZm/bjG106Zhqc=;
 b=MrgQnG6FH0lh3uOcKnspAr9eD+trcKUw4l3by0RCh/xlV18ISCt1hmS2f19t4WisJG
 VF1OR2Mrkk3iRxXLUt70OJdV2PGrGABDKTtE11ectc5j/QT8FIXDLnICeYPRapp5BfFr
 Y3ublTO7J/GOT8O4kgi/jEAvI5AX6YojfuiVyXuHUc6T1OBv3JA0+g7UkZhcCHBiudKR
 FKMCMgMTB2j/S5yqIRTHsPrQmtLMTE3SD4/ag06gB6fK9p4O3knEUBcv6Z4GMJsjh9l3
 NJ/hp9Q7sVP3125V++OpCE4sLRcMt626CCX6R165pxhSJUwrzf9pfZF6hZbSwGbVEQIJ
 +NTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MrgQnG6F
Subject: [Buildroot] buildroot 2023.02.3 : containers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I built root file system with buildroot 2023.02.3
The kernel is vanilla 5.4.249
Architecture: x86_64. It works.

Can you please tell if I can use containers in this setup ? How ?

Thank you,
Zvika
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
