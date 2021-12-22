Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAEDC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 08:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF806415D7;
	Wed, 22 Dec 2021 08:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XCuQqH6bb9Zq; Wed, 22 Dec 2021 08:35:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE975415D8;
	Wed, 22 Dec 2021 08:35:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2445E1BF2FA
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 08:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12E47415D9
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 08:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zicswYa_NG_g for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 08:35:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B76D64157E
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 08:35:25 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bu9so3728686lfb.7
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 00:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pv5xBt823aR8vyQx7BuBgDPyp3m0Fo54cS+oG4ippZM=;
 b=P9osHX+bR6V2LqDtI1uowA0qkmcVmRK47ZBJBV1d9ZZQHwVU+d5aXywdKfTfD9N74g
 d3eH6TihwhZwZ0Ax5se/3okJHNiijEQdMaiU737BOanMo3iDnUvGa72WzbB8Q/i0k4Ik
 YF4/WbtYFv5yTCBAUA4tfPlFRyrlCiOjNu867pkPwLtb75+HfWGJVwX7eabb8bShx+21
 lC+qLxALZ6p3VUkQLX6N+y61ZRGxcNI6aWHJSdIOci3mx1EVsS4QK8BNPfpqTOgjqtlv
 erBaL16NkKDOIhyySb6FOWgIYhS4ip/Fhdi6HvjSabVhNKe63Vrj5E/KQI+0GD94XANi
 XUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pv5xBt823aR8vyQx7BuBgDPyp3m0Fo54cS+oG4ippZM=;
 b=WWeOTT5X+CwlWq5DHHbAhsjV6RYUAXLYlJgCaVLT+CUtS4p4D1ouAg6YjkVy/1x6mU
 fNByxMXa8fXfcXsLYU10R3MW4dIhNbk/CiI3vHCVMSu+x8VMaNUtwJBvq0EAg0mxl/ux
 bmual+B1Cd++dvz5Ko6qgW/Te07KDbrP2VIMzS+cJMvsdvRvVJ6W89iBceid9T4LnXUL
 hEfn9n77ptlPEiqpZWFP4NrWm7+Eaw289Jiy4nfcfZfsp9C8T/rj2fgDJLjYDTEeUmWD
 2zQBF+esI4p85541p1cRGFDzpHYnAaUzQYS5P006BDnQ/jOReGqMsmmg3lochGFpURWf
 iMDw==
X-Gm-Message-State: AOAM533CMCtwsK3qqCYd6ofAZffEIHnHLLl/qD+C0RZGHY5FIm5UnChc
 4Mgo1gOKwgAablcgTTSG/xpP6megyes=
X-Google-Smtp-Source: ABdhPJy7mCzdZMXx6JhffMRbF4VXCd4nxFFoC/EjCLzkEr/Xs/rsEJNhdcYpmBf0z7kHi/iWg6d6AA==
X-Received: by 2002:a19:505b:: with SMTP id z27mr1645049lfj.399.1640162123208; 
 Wed, 22 Dec 2021 00:35:23 -0800 (PST)
Received: from localhost.localdomain ([98.128.186.122])
 by smtp.gmail.com with ESMTPSA id x28sm147988lfa.85.2021.12.22.00.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:35:22 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 09:35:13 +0100
Message-Id: <20211222083515.1150267-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/2] package/makedevs: allow recursive on
 directory with symlinks
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

while fixing the chmod() issue with symlinks in makedevs, I realized
the program was also in need for some coding style cleanup as well.
So I'm including a patch just to quell my inner daemons, you may of
course skip that part entirely if you don't agree with my changes :)

The first version was reviewed by Yann on IRC, suggesting we instead
use lchmod() everywhere instead of skipping symlinks.  I deceided to
only change the two places that made sense.

Best regards
 /Joachim

Joachim Wiberg (2):
  package/makedevs: allow recursive on directory with symlinks
  package/makedevs: coding style and whitespace cleanup

 package/makedevs/makedevs.c | 78 +++++++++++++++++++++++--------------
 1 file changed, 49 insertions(+), 29 deletions(-)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
