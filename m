Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF883C43334
	for <buildroot@archiver.kernel.org>; Thu, 16 Jun 2022 06:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 363AA41A31;
	Thu, 16 Jun 2022 06:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30KOB2JTliqu; Thu, 16 Jun 2022 06:16:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F0C541A2E;
	Thu, 16 Jun 2022 06:16:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 91EA91BF352
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 06:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8128C83FAA
 for <buildroot@lists.busybox.net>; Thu, 16 Jun 2022 06:16:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hpKw-gdkHTLL for <buildroot@lists.busybox.net>;
 Thu, 16 Jun 2022 06:16:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BED0583F9C
 for <buildroot@busybox.net>; Thu, 16 Jun 2022 06:16:51 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id i15so509681plr.1
 for <buildroot@busybox.net>; Wed, 15 Jun 2022 23:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=+S2Tav5B6EVAhbTDMTIIdbJxeyXYr5v7Mf+gwhUfuOQ=;
 b=lxBd/aS7zGibjQPxAlQGxfPIg9tokksqAJMtItqjG7CyloXzWguT5J1oobsWH09f14
 QIGV0lUn/5nb4PiG8FFu4u9wgJlayrXzPyh9ehzIeZHu8zcPW/Q8e3fhjik0mf5bGZ2J
 yipSbLWLAN3592mF39pIUywDVOkcJDIO77FbvCxQmxIQ8pATHePuCJznZXoa3ceNSTXB
 qm7ZRM+Awbr3E+GBvvVwkGGV8ikNk2XEK+XJ5lB/FJQeqJf0oo4k/wyIoOkKhZmVSlde
 Pfch0zDh+FK2mpgG8eLp2JZRUeenRu8xPZd3iji729dqwqeSdHA9N+y7oB9NO2v+Q3Nh
 AP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+S2Tav5B6EVAhbTDMTIIdbJxeyXYr5v7Mf+gwhUfuOQ=;
 b=D7d9je4l+e33YlPuZckupl4VzUooBrGxCOhjfaZE5hHFZZ1CvLpSGFHNiDiVT2aloM
 VRFrXstD/soIe+Ldo/yXrzJAj6pQ26K+RIZM5eG8oRe3KOIo7yj7NADwxsSqd6KBFpwD
 koDueC0zXrSHbT1W5BnB+Rg7OdSRtmy93gZs0OZZg/Uw8jlpb5PFn30KaFW1jDRrFfvJ
 +Zpm0M3H5wOQ+iDKc/aFJqPhQ3Z6iC/2soD5EJXGbb13qUXCjOcfNYIB1xobI6qKKkjy
 aN88R+KeXhcgjUmwagSxJ/VBurFb82/X3oEYDtvUuAgavY9as0bXlBmgGIm4sl5Dy7bV
 8Xaw==
X-Gm-Message-State: AJIora/tGg7LNX7jenUnqOFJQtCxVMpo8ZvxWw61asC6gr7W2gpDN7Ii
 g/bucHJmSkKA/bqmcABHYW9lsb8pXfwIRsIFj8Dpeik/LIg=
X-Google-Smtp-Source: AGRyM1v60kj3Eg181ShVxUqeVa2zH1FASRJxJ92nRTmu4BGagkj5jTdCqgSmOsdBDBOGxIAOkIn4iTXYL/+pgLpH4Bo=
X-Received: by 2002:a17:90b:384e:b0:1ea:d168:a57c with SMTP id
 nl14-20020a17090b384e00b001ead168a57cmr9692208pjb.130.1655360210599; Wed, 15
 Jun 2022 23:16:50 -0700 (PDT)
MIME-Version: 1.0
From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Thu, 16 Jun 2022 08:16:14 +0200
Message-ID: <CALtfCQZti1YpcOR4D4=KVyH3abkwihtt5W4MUKzcqZybbO_xgQ@mail.gmail.com>
To: buildroot@busybox.net
Subject: [Buildroot] Using two package mutually exclusive
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

Hi everyone,


I am having some kind of problems using Config.in in my own packages.
I have my own directory on: [BUILDROOT_PATH]/packages/my_folder

And I have two packages: package_a and package_b:

1. [BUILDROOT_PATH]/packages/my_folder/package_a
2. [BUILDROOT_PATH]/packages/my_folder/package_b

The Config.in in the package_a is that:

config BR2_PACKAGE_A
    bool "a"
    default n
    depends on !BR2_PACKAGE_B
comment "You cannot use the package A because package B is selected"
    depends on BR2_PACKAGE_B

And the Config.in in the package_b is like that:

config BR2_PACKAGE_B
    bool "b"
    default n
    depends on !BR2_PACKAGE_A
comment "You cannot use the package B because package A is selected"
    depends on BR2_PACKAGE_A

Therefore, when package A is selected it shouldn't have to appear the
package B and viceversa, but it didn't work and I don't know why.

I realize that if I  select and deselect another different package on
the same page, it works. It seems to be the screen is not updated.

Does anyone know why?


Oscar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
