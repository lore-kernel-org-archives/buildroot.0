Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF412C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 03:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD17418C9;
	Wed, 27 Apr 2022 03:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewupylXXveMo; Wed, 27 Apr 2022 03:50:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3351E41727;
	Wed, 27 Apr 2022 03:50:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A95B01BF9C6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 03:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96C1D60DFF
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 03:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXpd0n7UrhE7 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 03:50:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94A2760A70
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 03:50:49 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso745490fac.2
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 20:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gal3Fhf0ZUdLubJw+7mG2Ts2SfGZtKS2OoBR5q5dimw=;
 b=UdVLP4F2QEUerJd5MIcH6OMO1AlhxX6aEPhSnvFYa8Oyk3/CZXa2pznhcvq2OyWL1R
 bldD8EFhjqYU2SXif2sahZcYcRJfx33yP/dotxpNMLUXskp8o+SV3bd/eE52U56e4dEd
 FgVvECdTjyJ1bieCBfiNNZpn4FZ9Gd63g5Y9RwIX6qVxGnMJuVsfdG0ADTj2VlKapGiQ
 OGHcl4fnCvCaK7Hq58JZ2VYgqcwjfMBNC7x6No4b9XBwWVgn1140v3yy6J57FujL1XmT
 Jza6NetFyeLOFPrzZQu04XQTgZiARDWMncGOj1UuuxLU0gmSGnIzmryMzYGhsS2VYM2v
 AqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gal3Fhf0ZUdLubJw+7mG2Ts2SfGZtKS2OoBR5q5dimw=;
 b=BuyWJnx5I3xmoGhybMbsE9yaSrXXJEkk4Cw9FP+wXb8S7Xx5vFIL5OzmzwPM0iUHG5
 h3cCtVoZuC4e3hsepELQoQvKV20AmfQBkOnqZ7PvKPg2aetXK5wHMmmjjq/JlrshMjcY
 WxP+eolRzsIWACQdLt0iEkUjtrHMbP9L7ztAo/oJdLnrIvLtZl0ln7c2Ilqj3WsGEyb7
 OhlLZIZsFY9meTGYf2eX0HW7/8S6ZlJjyV/W1G09mCvIe1fKja2YnAlWrm6iTLi5Ay/8
 vP46xYvqKTiZuQpLcJoY5QCgrbxQkHgF3QivlnwU2TOL8Tq0NNLO0icPCoOXaA1QeSzj
 ys9Q==
X-Gm-Message-State: AOAM531i2+jwFUR4vp9ZHsPZZBJHWDrWVVMQgb+kNMzqhy0kZPekdd5n
 aUrSXitb0la3npO3aJUgPIblT6X87xA=
X-Google-Smtp-Source: ABdhPJxApn4zj3Ahuj24/79ofotMDQC0GMbIpzv+3QLtZ+wX7Le70OVH651+d/3YpCwd69Y+WMob+g==
X-Received: by 2002:a05:6870:b14f:b0:e9:2216:b396 with SMTP id
 a15-20020a056870b14f00b000e92216b396mr6874456oal.157.1651031448326; 
 Tue, 26 Apr 2022 20:50:48 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 t6-20020a056870f20600b000e686d1388dsm204663oao.39.2022.04.26.20.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 20:50:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 21:50:39 -0600
Message-Id: <20220427035039.1664864-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python3: drop libressl support
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libressl is no longer supported as of python 3.10.

See: https://peps.python.org/pep-0644/#libressl

Fixes:
 - http://autobuild.buildroot.net/results/a16/a160cfdc9dfc036c4dc41af1c796f8838d91c573

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python3/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 61470c2944..761c38c850 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -89,7 +89,8 @@ config BR2_PACKAGE_PYTHON3_READLINE
 config BR2_PACKAGE_PYTHON3_SSL
 	bool "ssl"
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2
 	help
 	  _ssl module for Python3 (required for https in urllib etc).
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
