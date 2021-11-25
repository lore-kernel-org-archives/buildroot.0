Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0E7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 12:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4288D827A9;
	Thu, 25 Nov 2021 12:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0m7KN62KSULz; Thu, 25 Nov 2021 12:56:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 984BE827A1;
	Thu, 25 Nov 2021 12:56:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 817461BF30B
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7007C60A62
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9z6sOxv1j_CZ for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 12:56:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D19060A40
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 12:56:08 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i5so11475690wrb.2
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 04:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AKHU1iE9r0oJeWoa/44a9bRBQKrfY3bW0vH5kHvsM4g=;
 b=a9uV0/Kn08+aE8wY7OHTS1oWeTBS1BOrXgo3QYMNRwIZlw2p4kAH9jYC4FkNtNwjiM
 qzZ3ZSpARS9zNVG0+uV8a7CE/oLE3908nf642Ok/kkICmfSYTvM8vIPue5Sh6Ck9c6t0
 ml3aE9BCV3DuV1AoP07zZCWsGm0fHe0OJei413lcmriaDL6K69bfdkSHkamFdufNGMhV
 yLODhJQ9l6R2UM+M9Flp5YXg56xcjQM8C7GjVTz2dKIfxg7gIB4hrKd0RdZR9WRbQ4I+
 THCzb454q5VVJfHtjU/iamDKunPuM6zsSrzHLwAYnlkf89d2ybmi0r2IzhJq/yIuvzCw
 Z/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AKHU1iE9r0oJeWoa/44a9bRBQKrfY3bW0vH5kHvsM4g=;
 b=zEYNwh4Od0Wuy397mg3YjRKNVJK3Fz8K0Ukkb5Pjr16EX5V13N5U/MChDEsg0Ha27I
 zht/TV+pVH14lkzdIejfaDHnvnWKOZt41cNAxJ35ostvsC167BrP3J/A+lKJD+vm9v3C
 OsKNIYJg+tILZCpyJFr1LhZZ7UcpfzCEiNv0cvJoRh3FmLrbh7Iiu+6WO4zK5VLZXDei
 25S3JYiZgpy2eqP/3NRh7SBFLH6V6SzjVE9OiI41NtPfy6Wq3aCfvMwwzWWskvr1Zx3V
 sfkenSKwTLNgxs+SobTw3x+F0PaSy7XR94bIejiQ6hn81DoA3/uFeDZi7lahcwe4j/72
 F19Q==
X-Gm-Message-State: AOAM532HN98Tcw3MZMV/r1vzylSt9pUhNRafahE2Moz+RvECfEF1xrhS
 XsB0M9xjO/zO0LgpduzBi4CHyNwQtIA=
X-Google-Smtp-Source: ABdhPJz+w8Q3UNv6RffDXsZ5e3JJZuT39mZ6LkPGgDQWWYSHwZrFy/UYJPgywT355QMPMdXKdLiWKQ==
X-Received: by 2002:adf:f444:: with SMTP id f4mr6114789wrp.538.1637844966419; 
 Thu, 25 Nov 2021 04:56:06 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810c:8d40:ec0:e54:15ff:fe38:2651])
 by smtp.gmail.com with ESMTPSA id r62sm2909178wmr.35.2021.11.25.04.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:56:06 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 13:55:55 +0100
Message-Id: <20211125125558.1087094-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/4] Bump netopeer2 and dependencies
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Vadim Kochan <vadim4j@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For updating netopeer2, the libyang, libnetconf2 and sysrepo packages
that depend on it must also be updated.

It should be noted that libyang has an incompatible API change from
v1 to v2. Currently, the v1 of libyang is still used by the frr package,
although a newer version also uses v2. We should therefore bump the
frr package as well.

@Vadim: could you take care of this?

Heiko Thiery (4):
  package/libyang: bump verstion to 2.0.112
  package/libnetconf2: bump version to 2.0.24
  package/sysrepo: bump version to 2.0.53
  package/netopeer2: bump version to 2.0.35

 ...IX-netopeer2-build-fails-when-buildi.patch | 34 +++++++++++++++
 package/libnetconf2/libnetconf2.hash          |  2 +-
 package/libnetconf2/libnetconf2.mk            |  2 +-
 package/libyang/Config.in                     |  3 +-
 package/libyang/libyang.hash                  |  4 +-
 package/libyang/libyang.mk                    |  6 +--
 package/netopeer2/netopeer2.hash              |  2 +-
 package/netopeer2/netopeer2.mk                |  2 +-
 ...uild-with-musl-libc-fails-due-to-unk.patch | 42 +++++++++++++++++++
 package/sysrepo/Config.in                     |  3 +-
 package/sysrepo/sysrepo.hash                  |  4 +-
 package/sysrepo/sysrepo.mk                    |  8 ++--
 12 files changed, 93 insertions(+), 19 deletions(-)
 create mode 100644 package/libnetconf2/0001-libnetconf2-BUGFIX-netopeer2-build-fails-when-buildi.patch
 create mode 100644 package/sysrepo/0001-sysrepo-BUGFIX-build-with-musl-libc-fails-due-to-unk.patch

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
