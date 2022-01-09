Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9757EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5913940302;
	Sun,  9 Jan 2022 15:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zuKdnPsmXA0F; Sun,  9 Jan 2022 15:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94723402C1;
	Sun,  9 Jan 2022 15:01:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69EB61BF4D6
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56C846080B
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZMn6q7-Tr3r for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:00:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 385CF605E0
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 15:00:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id w26so1286617wmi.0
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 07:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jJMBuiCam6fJeibIpCW7wj2lF4ZiuadVucJDatqNK60=;
 b=c2ZtVMKBCyY6QBTQSoWHpV/YN+SZvb9pbXrEl/GqEzMfVwCrXKXFMRqO9P5NjVYx+T
 A9SsQTX2bHXJhjqB7geCkztOYj3eH8B7TXUlXRxkuqznGGtGLF1T4Wp+vMgKMis8qBVM
 M+77GNj2VfHI5VXXYhL8o+g8SJaTWW4coi0bp8la6QMQEjvk6/S2ScDMyjYKJNGatj2A
 GpgCr1WQmySGK1p5fEhjqXxmVMBzUh6ghd6AS3PQ7cZpbVzC1fVUy8GiIlG/014K9ysf
 PrxLDNpeGHl9ubp4n9hC4V36jor74HU4x699Gj3Ow3Kl57TsTmGEn7WGFH4gzWRoNX6g
 cXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jJMBuiCam6fJeibIpCW7wj2lF4ZiuadVucJDatqNK60=;
 b=gSUnPujbs/5NtWYnYZaj6NLK3WfC8rUfPPadkVguzQY+HG69/SbScNZTucWIaYG/+l
 Vyr3+nAu4jkfVUNy8G6gu+XaXdXyvPwqJ+r1z7Ka2lrvuL0vPkhnqrJfprBLYsSmae+n
 +hND7t1lVu0KvQB4YGkwriS+9SRjaWSxEomyrpzObgcbDiql209ZVhMNvBLrxnXAbchC
 Kjfe7fo5Hz8fai4OLYFSznSf6zBQUPzG0mQmwKyixiATEd7p3iAPBg/Y7r5By7XzDNuT
 lQYaV/K84g2NyGsBDnITauwYDN5hSJLjc/mlv7J3mizH0aoXsQv7Xd25WglRJMBfIQQ4
 ZZ6A==
X-Gm-Message-State: AOAM532HzGk6kWjxEee5BKZaY+Z8+5R8wroSHYB23JADMTPog9dlXOho
 Fi86Fxhh8XmP87Uua41FaLZohnDGUtVjPQ==
X-Google-Smtp-Source: ABdhPJw2Qw+p3/de1/SxIDS2cC1g5zne0cksKEEj260pNUuC0NuAP8eWWcB84yKMHYEeWl/ApBSDew==
X-Received: by 2002:a1c:f012:: with SMTP id a18mr18340719wmb.73.1641740416471; 
 Sun, 09 Jan 2022 07:00:16 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id j26sm4781562wms.46.2022.01.09.07.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 07:00:15 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 16:00:11 +0100
Message-Id: <20220109150012.1907226-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/pkg-golang.mk: set GOPROXY to
 proxy.golang.org
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While packaging telegraf [1] the download step failed due to a checksum
mismatch:

    go: downloading collectd.org v0.5.0
    get "collectd.org": found meta tag vcs.metaImport{Prefix:"collectd.org", VCS:"git", RepoRoot:"https://github.com/collectd/go-collectd"} at //collectd.org/?go-get=1
    verifying collectd.org@v0.5.0: checksum mismatch
        downloaded: h1:mRTLdljvxJNXPMMO9RSxf0PANDAqu/Tz+I6Dt6OjB28=
        go.sum:     h1:y4uFSAuOmeVhG3GCRa3/oH+ysePfO/+eGJNfd0Qa3d8=

    SECURITY ERROR
    This download does NOT match an earlier download recorded in go.sum.
    The bits may have been replaced on the origin server, or an attacker may
    have intercepted the download attempt.

    For more information, see 'go help module-auth'.

go-collectd was bumped in telegraf since several releases (since v1.19.0) without
any changes regarding the go-collectd hash.

Some users reported an issue [3] when using "GOPROXY=direct" and used
"GOPROXY=proxy.golang.org" as a workaround.

[1] https://github.com/influxdata/telegraf/
[2] https://github.com/influxdata/telegraf/commit/d4b051edc247a13d7fbdaa49d95fe6e93505d14e
[3] https://github.com/google/flatbuffers/issues/6466#issuecomment-781954742

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-golang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 35bcb1673b..e23778d96a 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -85,7 +85,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV = \
 	$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY=proxy.golang.org \
 	BR_GOMOD=$$($(2)_GOMOD)
 
 # Due to vendoring, it is pretty likely that not all licenses are
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
