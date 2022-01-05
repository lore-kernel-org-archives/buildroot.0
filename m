Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4EDC433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 18:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFDA96FB93;
	Wed,  5 Jan 2022 18:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5BQPViJQ_4jK; Wed,  5 Jan 2022 18:06:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5486F6FB90;
	Wed,  5 Jan 2022 18:06:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 588D41BF47E
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48563428BC
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 18:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9w1R2YFUo57N for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 18:05:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EBE8428B9
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 18:05:55 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id o30so164836wms.4
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 10:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mgGoyrYLUBIWIib4ertP/ZsXaBPL1FD/ZDS4VPwlM+w=;
 b=mi2/qaM8I0h4TPTeMn9q9d7FW2sdV0HD9zCpDGbEFyu/dKZPqvTajKCSRnLBfbbAeM
 Djj+qBcKobhnA5jG5PeGDo2yh/ODbmdEpoPryqB8akklg7NMdeaSQ9Wp2TBL26IMJteQ
 IaC6Eh7iMTWeVsWFOXHLX/OLQ93wrGUEKN6m2NxjuAZYYAhZIkxXpt08biZ5ide7qiVh
 dJi8AIWE4dKtl8X3+ul2LcZI8w0cS9ai4JXwKofvRNVsWqO5SZMJHYvqso5PmA1h1Re4
 blxp/UW3m2Se0Nm3rrdWCTwDfcrKQxkkHUUgmyExIehqQVHXMtwpd79KR8vJCMna5huR
 1n+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mgGoyrYLUBIWIib4ertP/ZsXaBPL1FD/ZDS4VPwlM+w=;
 b=Yj2Z2zSIpu87Gud2F5uCr1ywiqWxrVuuBIk1wwxjJg9R7dkwwTtn5F1UmcsDtGjPjl
 W5dp+HlKH7pYvDHbbSI3erMIkJmaOVsms48wRLTmC82kEcDaxSQkL6mLGDsSeSq4BS3d
 95AbsLcdj34dCT/vSoYC1/FQhJX9g5efzOFEXT2dXqzlQI2giM0TjaVpYTu3iW/zy0cj
 PD4QoebF06zOTHaT/cVflVFPW1/icOOKopGtHpCNKVvf8AWnsD1QdwoR+FyAPRK23rBx
 htxGDW7QAFHKpaybMKoBWax00gSBGbflcH94saaMTBYV+2OGC0khx+kWrFlWS2EJEPM2
 e8xw==
X-Gm-Message-State: AOAM531txZGdv33WSxyGNq+SbArUwjAakSWeM3oh9VlsWtla+gsCYv0v
 SYw4W1XXrCAQls0hLu93lum8nKER3zc=
X-Google-Smtp-Source: ABdhPJx2P+1FKWWJJXLRDQ46VzSVXWNIiBMictvmmgyNziH+zcoK/fz9jYDb1GL7ZhXt1PmaTSakJg==
X-Received: by 2002:a05:600c:2283:: with SMTP id
 3mr4009856wmf.182.1641405953279; 
 Wed, 05 Jan 2022 10:05:53 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id p62sm3191773wmp.10.2022.01.05.10.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 10:05:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jan 2022 19:04:53 +0100
Message-Id: <20220105180453.388499-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mdadm: disable -Werror
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable -Werror by setting CWFLAGS to ""
This will avoid the following build failure raised since bump to version
4.2 in commit b03fc7974536378ba102418451ba7e9801bc6251:

mdadm.c: In function 'main':
mdadm.c:156:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
  154 |    if (mode == ASSEMBLE || mode == BUILD ||
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c0f216b7aadb794110409d03dcef7fa58e833cd4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mdadm/mdadm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 6ee0bb60c9..0a2eb4e5bd 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -16,6 +16,7 @@ MDADM_BUILD_OPTS = \
 	CC=$(TARGET_CC) \
 	COROSYNC=-DNO_COROSYNC \
 	DLM=-DNO_DLM \
+	CWFLAGS="" \
 	CXFLAGS="$(MDADM_CXFLAGS)" \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
 	CHECK_RUN_DIR=0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
