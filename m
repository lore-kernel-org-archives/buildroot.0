Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3179C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 01:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A0FD4011A;
	Thu,  2 Dec 2021 01:39:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDs2kn_UYw2i; Thu,  2 Dec 2021 01:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2884C40109;
	Thu,  2 Dec 2021 01:39:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C7051BF5DB
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 01:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED4F160602
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 01:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iy5KUdEozzpL for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 01:39:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A7A4605E3
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 01:39:07 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id l22so67573488lfg.7
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 17:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RMYDWdU8n27bBY1Ac5quRKfBay5jImBQ+mKmNVLhNjg=;
 b=Pqj+5I9L+8sJpbllIzxCfx20gIndZAM/pbF0/dr4MF7VhtrwHrpip7xbuXzOM9qodh
 WM4c6ngoeNPlBf4N9Z67ifnT68gJ0GFFkPNbevlVsjJjictnT0CCKy/QuImbnhc+vM2V
 nIdpDp8Hk6vtDTPF9ExIEe/FyFo27ui88F9WrIeqAufVdWTleIv0yXznybJ+lovNl3HU
 KopFo1bEx7pWeB7lf3xXYwAlCBXbhmrw9pMlRm7fyrUrH5AOcjXyI85cDSDznLMjukWE
 fGytdf0685caJWbILyls6GH+Ndk9dUmOKqAmTZtVDrtla0Pd5Ugt1FkK/NmgmKF6zw4D
 vwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RMYDWdU8n27bBY1Ac5quRKfBay5jImBQ+mKmNVLhNjg=;
 b=5GV1OZJBFNcmiSQIrCstVSwBYhG7M/lPVIbAh3x07X9xMnrIhdC0lAav5UMrqx26pm
 uU3wpL6O81wfr5PbqxpawntVchGmcJ61Ir26ROfl07Sf5mJancBHM3ROEjLOjsS6lTNd
 uE2cnuJP7uPeFBdXCMZvFCtYrLoxGqeZRA3msuUjrI1LHtLwLTRCBRZAxEvFg6AiejtE
 0o90OeZHaDPZEhTO6RjmOt8PGOzSvnlS1AtdfmxgVyehE2IFHctxAnwQaqJm3v5n5Gi4
 BHkRNlqurRKL74ICHhU3lz+Muh9eq8/0g7ZIl4hoFtCInMEjsgHJQmXdlzxm+VpmvSAc
 vuIA==
X-Gm-Message-State: AOAM533HeTWzudvo8bqeotuB5Rhe99EOcT7wfQyuk5Xx9yK8iz/jKuVo
 OfJUbYYLDGSgjQRDCVLdNWtMF08z2JM=
X-Google-Smtp-Source: ABdhPJwclgCJbltPRgfcyuimfiwK2wO7dVtDn0HYL9VRubmvXhbYnuxQ5e0S3tlu8L4VKBkjtk0pFA==
X-Received: by 2002:ac2:5932:: with SMTP id v18mr9038647lfi.611.1638409145700; 
 Wed, 01 Dec 2021 17:39:05 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.198])
 by smtp.gmail.com with ESMTPSA id b13sm176939lfv.200.2021.12.01.17.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 17:39:05 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 Dec 2021 02:39:00 +0100
Message-Id: <20211202013902.1593562-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH next 0/2] fix name clash between libite and LiTE
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

this patch series updates libite and watchdogd to correct the
unfortunate name clash between libite and the DirectFB LiTE
project's header files.

http://autobuild.buildroot.net/results/185c753af2aa159b494b13f78b0826dddbe4aed6

Note: if applying this series in fragments, please update watchdogd
      first, otherwise the build will fail due to the relocation of
      the libite headers.

Best regards
 /Joachim

Joachim Wiberg (2):
  package/watchdogd: bump to version 3.5
  package/libite: bump to version 2.5.1

 package/libite/libite.hash       | 2 +-
 package/libite/libite.mk         | 3 ++-
 package/watchdogd/watchdogd.hash | 2 +-
 package/watchdogd/watchdogd.mk   | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
