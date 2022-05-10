Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFE4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 20:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94E7E417C8;
	Tue, 10 May 2022 20:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mssWzIJ6hlNW; Tue, 10 May 2022 20:16:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DD99417AA;
	Tue, 10 May 2022 20:16:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E467F1BF82F
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 20:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D38C982DD9
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 20:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5t8SlJH3zc8j for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 20:16:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C600382881
 for <buildroot@buildroot.org>; Tue, 10 May 2022 20:16:02 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id bg25so18094wmb.4
 for <buildroot@buildroot.org>; Tue, 10 May 2022 13:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:mime-version
 :content-disposition;
 bh=CgFI8+8WINQ9wuGQuZ/xOcJcRoSMYRxv1Q14IPViihI=;
 b=FcAnmvZOZs5172SgcMFH+FwhwPw9QZxXTJnpgC4p0KRkc8QYVlUNEIaeXADvw85dvH
 UnMa+nmhf+KlOMST2tE1RCA5h03zWfNNOV/yNh4OkvYh/yF9YfHpUyT9BnRsxqe7fXhp
 LtpJt3QhJmzuAUH325wABGzM26dsupYMI9WR9gJev9AAhBmOpQvj0r9yqxBMpt7Rss68
 xcxJ8vTOCe+r1MugAqX0130ZFl5882H1CXiHOC0DXos8CwPZtmk39dKV5e61Qw4uBijv
 zFzSz+jQqEuUpOzWFs6hCDZtzeoqfG3OY3bGdbs4D1J42hAFQV40AmnOj4/MFZb4PpKC
 Kc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :mime-version:content-disposition;
 bh=CgFI8+8WINQ9wuGQuZ/xOcJcRoSMYRxv1Q14IPViihI=;
 b=PyI3K+uuf6WvS7xACPq+cCj3scvu/cJXYrSSeT2Cm9lfpceK0QNnuHUYmC7v4Arowj
 yfQwzcAu+4U7GyapvKlSLX/pJ8+vUV2FBNUBRg3mSe0C8frzpDqwOQb1NyI30FbMD72H
 AMAuPqs34GLm3hgL5BJkspJwC/aNZ/JTXUKslKBu8OWSKuQPOy+UkY8Mw1ELoZIMkk4d
 Wjc1s+b1kW5TqMTQdksLafVmevieaionQ9+hPEdhTb0NcRzpdgt9VV27lZpu/MFsoxL2
 0n4hYJZig3Df32fNVxri02Nk0v859na08rovXCaWHUfbvKDt9/WdNbAJoTEgEQBiMoI5
 YTuA==
X-Gm-Message-State: AOAM531C+39dhZlSSTATjPmpepJu4yoi+TqNvK2dNC0AVQBKXeVw1lr1
 aenUpz8xCncqvC/oOpyxH7qGWJLwLHA=
X-Google-Smtp-Source: ABdhPJzib2LE3OYx+1zmukBoARpEWFUiWv0VYw+y+9Mo+OZjaDk64nl9qHoAPTtPRXLAC7YhlFqrhA==
X-Received: by 2002:a05:600c:2112:b0:393:ff25:fb92 with SMTP id
 u18-20020a05600c211200b00393ff25fb92mr1589572wml.194.1652213760641; 
 Tue, 10 May 2022 13:16:00 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 l68-20020a1c2547000000b003947b59dfdesm3915773wml.36.2022.05.10.13.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 13:16:00 -0700 (PDT)
Date: Tue, 10 May 2022 22:15:58 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Message-ID: <YnrH/mfbuJHRpYnw@pevik>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [RFC] iputils (meson build system) has git version from
 buildroot instead of iputils
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Dagg Stompler <daggs@gmx.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

meson.build [1] uses git-version.h.meson [2] to produce BUILD_DIRECTORY/git-version.h.

Building from sources (not in Buildroot) it works:
$ head -1 builddir/git-version.h
#define PACKAGE_VERSION "20211215-15-g309f285"

But building in Buildroot it gets git version from Buildroot:
$ head -1 output/build/iputils-20211215/build/git-version.h
#define PACKAGE_VERSION "2022.02-876-g3ef096786a"

Is it a bug in iputils or in Buildroot meson?
Any idea how to fix it?

Kind regards,
Petr

[1] https://github.com/iputils/iputils/blob/master/meson.build#L14
[2] https://github.com/iputils/iputils/blob/master/git-version.h.meson
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
