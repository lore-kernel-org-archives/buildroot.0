Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A284C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 20:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B38AC4063E;
	Tue,  4 Jan 2022 20:51:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEKsAFCnG_QG; Tue,  4 Jan 2022 20:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9901404BC;
	Tue,  4 Jan 2022 20:51:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A50E1BF44A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05FC360B75
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 20:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBJaQmtSyX2W for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 20:51:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5269C60B8A
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 20:51:07 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 v10-20020a05600c214a00b00345e59928eeso465701wml.0
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 12:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2iDWNqsYJhZjHxOdqVvWLr924sjJjjENVMB4+38fPxo=;
 b=JTk7mhPt7eqtruHTfCXbNETf1dyh84EDzHuQI3EH85E5SQjOVhGmFXcaFLeaYHcg6B
 XFwZi6yEQUoNmA9FHenBya8+WqkHVAA9OceyBKE5UFrWezKimDDsmLEwizs0EeCrsspI
 8bsrRxlRPP183a71oYfcMFC/3aMXLjjvzWfluJ4R0QpuoolTyzkznVZg2zk5D20sqf/S
 sM2l2WKFY7bv5gSzGP0N5DJQAm7tzDT06R8pQq+5myb1RHxjB27o/kpxFTamZOr0S5FS
 Fl83/oApC4Ujw4X7FwERXoJVVc3nBAr/Fvd7LgduW1UZjqejSO9mf/SgpWc53g64FC7C
 Ff3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2iDWNqsYJhZjHxOdqVvWLr924sjJjjENVMB4+38fPxo=;
 b=4HmlqqgUWCxJ4HcgQKYJ8EKHk4hf+JzoGnxUrWBliwDuE1Gku2+sr8lCL1yL1iK2dt
 tQWzYpFFKcaWWU+osPWWKYW/tIwD+9cBbwf0nSe79joaI6dZAvjgZnRi5enKAqVO+qxU
 BrzrU787AXZsle8/guYpg4l0G4iL8hH2NTjRCQOxHVGUaukFc4rX8ES5o375QBXzyIjT
 o9uSVwfQK3oSOPzlN/c+GMO84uSzP6pODKWNwNPISCv3WB7OACYjGpzcfXhK3XdQfKfN
 bICllEnq1qp/3vdhbU9iAqRr9QU0H9GXzyU+psOtOELylf6rempc8odYcn3S9xXRZSGh
 j9JA==
X-Gm-Message-State: AOAM530ZMMFwihiVY5wCMjV+sMTFyOX2kCGTzgoFhUgnpMYyfkkexE4+
 KqZJPp92xf1kTlUv0QpN4Ta9Ac1a0T0=
X-Google-Smtp-Source: ABdhPJwCOhSCgV1yH0axqVws6n03lmEUBl5KcykqSidKu1U4zcdBJNKMTLPtXEePDZL87OFRJ1/P1A==
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr111616wmq.158.1641329465354; 
 Tue, 04 Jan 2022 12:51:05 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id p13sm33427386wrs.54.2022.01.04.12.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 12:51:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 21:50:07 +0100
Message-Id: <20220104205008.3631801-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libvirt: install in staging
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Install libvirt in staging to allow collectd to use it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 9a4788c905..41218c0e53 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -10,6 +10,7 @@ LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
 LIBVIRT_LICENSE = LGPL-2.1+
 LIBVIRT_LICENSE_FILES = COPYING
 LIBVIRT_CPE_ID_VENDOR = redhat
+LIBVIRT_INSTALL_STAGING = YES
 LIBVIRT_DEPENDENCIES = \
 	host-libxslt \
 	host-nfs-utils \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
