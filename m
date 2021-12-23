Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92AAC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 00:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4049560ADE;
	Thu, 23 Dec 2021 00:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2tgovbxpfgH; Thu, 23 Dec 2021 00:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4351E60AD9;
	Thu, 23 Dec 2021 00:24:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0ACA11BF9CB
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 00:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E69CE408FB
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 00:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=paral.in
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFAoCY7DFiJv for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 00:24:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CC0B40901
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 00:24:33 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id p2so6976142uad.11
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 16:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=YycZO/M1YBpiu4NNivsCuD1M1uRduBxp8dxcSJFWDFk=;
 b=VTeEXB/XYRE+QSXsN7wAFGSA40Lyik/KbuD3sa7Sx6ETZRW0c2q1Gq+GXFpjJB5aaG
 rBaab6c+uOmdPYYvtVhYZcA4wWZELsH8kgVviqsDCqmKKCKiXRe7CKcqoIY/LIdXbjJp
 kg7nhxKVVDmk7mPTDsW0WvoOFTR8tyYgQE/MUntCRoSovY2dWvmjjaDNV4AclSG4yd+G
 dHW/kG2DUYg/aX3tUKMoa+UzoFTsII7FGhhxtHxjHAJqfrdIBSjb8XfysBpEKNHxHM/g
 i17Rv0DZUvO5qCyHpGWMv288qDkQuURQSIVyR1ZzlwfaQH6X8jKMAO3kY+Ljs1z4f7K4
 56/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YycZO/M1YBpiu4NNivsCuD1M1uRduBxp8dxcSJFWDFk=;
 b=gRR9pz72d2HWfjawzcI+UMRMGFiTSm+HkxcFHyWOmHgqOkW9ANHI5+7KZ9TCJ6l7B5
 JbchkgVOKxqS+vvOWvq9yJAnRy9yJownJdiNZ4sJgdGGEH1QySUpWLu6041klyqjTsGB
 qwHAoPsDY/HOmC1Ybx9gaMDAQJ4rZTspUro3fDPLzSJg6ybBYrpBpLcTt6S1wKrQqPBC
 ifipnzd/mgrJvCMlujzAk1L/Vws0Cgl6Q7gStXZUfeS6nByVsvpC4jMjgyE8b7sRarBA
 ru97xzwjkS1f1kaEMlIofoIoCaBGBIRBHRMB+DR6fxjreF/MTM3jRI0BWD+heRYb0iMo
 +8iw==
X-Gm-Message-State: AOAM531jD+3Mf+6FJ8nr0J4oWhrjr5GH8lo8nSd8AZNARQ/sCP03/WG5
 BkYZ2ymneb6lVYn5OHPaqXLnb/fCF9I8Pg==
X-Google-Smtp-Source: ABdhPJw60nBP+hdZlRaRAqwUc4gh3EcxddXwpCaREEAtGSVB7a+VJ/G2UD977YHNVuUn9A/amPZAHQ==
X-Received: by 2002:a05:6102:300d:: with SMTP id
 s13mr10280vsa.64.1640219071849; 
 Wed, 22 Dec 2021 16:24:31 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id j145sm696915vke.47.2021.12.22.16.24.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 16:24:31 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id p37so6982052uae.8
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 16:24:31 -0800 (PST)
X-Received: by 2002:a67:cb91:: with SMTP id h17mr5938vsl.35.1640219071168;
 Wed, 22 Dec 2021 16:24:31 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 22 Dec 2021 16:24:20 -0800
X-Gmail-Original-Message-ID: <CA+h8R2r5S9NkHzwB9N57Ww9aLs2WoFRUSbxANZ1o7fFFBkV6Og@mail.gmail.com>
Message-ID: <CA+h8R2r5S9NkHzwB9N57Ww9aLs2WoFRUSbxANZ1o7fFFBkV6Og@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: [Buildroot] Issue: /etc/hosts file does not have ipv6 address
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

in skeleton-init-common the /etc/hosts file is created:

127.0.0.1       localhost
127.0.1.1       myhostname

Shouldn't this also have a definition for ipv6:

::1             localhost

I think this is why a lot of times "docker pull" fails with an error -
[::1]:... connection refused

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
