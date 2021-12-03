Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02E0C433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 23:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A5460BE8;
	Fri,  3 Dec 2021 23:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBJ-cP1gL3ok; Fri,  3 Dec 2021 23:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A13A960BE2;
	Fri,  3 Dec 2021 23:09:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBDE61BF3FB
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 23:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7A4A60BE2
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 23:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7JteWaPnFlpd for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 23:09:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4FCF60BDD
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 23:09:28 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a9so8754011wrr.8
 for <buildroot@buildroot.org>; Fri, 03 Dec 2021 15:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=66RDjqSutQxWAnfp4G/MksYWHHZngGyDBKUhR7oIKgw=;
 b=VEVEXet2Tyq7BXEcD8R50B6tmNdweX8Pgun/aeMJ0kCMsPFaw0qnVwtbMyZ+PkoKH2
 lmM3gV+OGEPYwBgjEu7E8BJUPzwV3RS04WkwQVfnuMocrPoZ3zNukkfR+GKcmP6QRc9e
 +35ZLPMGQ876l3SGL7btI73IT4Jvu07no2mypI3fcymSi/namnc5dVSEYox0BGbsw5Pm
 AgXq1FV7IhDcRnFjlNPiSMzSzXARjo21E4U2zfoz+Yya+1pvoR58SKRI2jlV+381GlMj
 nbh8N2R5QTun3taMl9zEEw8+XhZkB3lSsUq9w9hy4sfQakCVzWxn6h4xTEtMX4EqmYl/
 OTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=66RDjqSutQxWAnfp4G/MksYWHHZngGyDBKUhR7oIKgw=;
 b=H6fbvhroydiqqBtTm5mVTdqDqYBtL3avw1IXyME5RdUHPOInzYHmGBWqeLfn0dDAEv
 oGRADKEPJ5AbyT0UcMoQnkAzLLe61unrjCNOI8yTSrSfd5vpNXjx50DBuuYbg37gYjl0
 YG4YdX0oV8cB0MKobCC9gxcqqKHu2WJyW3AfHV1Vk+LMnlz5PKArlYsZBYgb7AIksh3a
 hzoJm+fbieR5I4pbt5wUIZlo9CVA08niNQxLUgZp0Vv62S1JNmOWLAFWc9ccFFMqkmyy
 olVXhXV20yly1DLsnJAXsnmvZCkY3kASCGSGYj7p06D5iwMKiH+xRLQjtQj2K1vriv1G
 UUcA==
X-Gm-Message-State: AOAM533KQqTm/AkISX6MIDq2dXEuDpm5+HOzGSiyiuj1PBD1oL82hrgC
 3pltK2dkkGv2W7BRLM96KtxnT+FrK/tCe3hn
X-Google-Smtp-Source: ABdhPJxhzbU6754vNaRalr4gNzUpiqpK4eM/VGf2qWctBhrEdE9jziaGofP93B6QD4+z7AO3N2fYIg==
X-Received: by 2002:adf:c10e:: with SMTP id r14mr24128518wre.558.1638572967080; 
 Fri, 03 Dec 2021 15:09:27 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id p13sm6200725wmi.0.2021.12.03.15.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 15:09:26 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 00:09:18 +0100
Message-Id: <20211203230919.683527-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: adopt odering in
 nsswitch to newer versions
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This modifies the order of the nss modules, reflecting the current
state of the documentation.

nss-mymachines lost support for resolution of users and groups,
and now only does resolution of hostnames. Changed in v246.

Multiple changes in regards to nss-myhostname now recommend placement
after nss-files and before nss-dns. See commits ce266330, f918c67.

nss-resolve handles the nss-files logic itself, and its suggested to
move in front of nss-files. Changed in v249.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
v1->v2:
-   fix whitespace issue with mymachines
---
 package/systemd/systemd.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 373e5c82bb..8e805e8cd1 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -563,13 +563,11 @@ define SYSTEMD_INSTALL_NSSCONFIG_HOOK
 		-e '/^gshadow:/ {/systemd/! s/$$/ systemd/}' \
 		$(if $(BR2_PACKAGE_SYSTEMD_RESOLVED), \
 			-e '/^hosts:/ s/[[:space:]]*mymachines//' \
-			-e '/^hosts:/ {/resolve/! s/files/files resolve [!UNAVAIL=return]/}' ) \
+			-e '/^hosts:/ {/resolve/! s/files/resolve [!UNAVAIL=return] files/}' ) \
 		$(if $(BR2_PACKAGE_SYSTEMD_MYHOSTNAME), \
-			-e '/^hosts:/ {/myhostname/! s/$$/ myhostname/}' ) \
+			-e '/^hosts:/ {/myhostname/! s/files/files myhostname/}' ) \
 		$(if $(BR2_PACKAGE_SYSTEMD_MACHINED), \
-			-e '/^passwd:/ {/mymachines/! s/files/files mymachines/}' \
-			-e '/^group:/ {/mymachines/! s/files/files [SUCCESS=merge] mymachines/}' \
-			-e '/^hosts:/ {/mymachines/! s/files/files mymachines/}' ) \
+			-e '/^hosts:/ {/mymachines/! s/^\(hosts:[[:space:]]*\)/\1mymachines /}' ) \
 		$(TARGET_DIR)/etc/nsswitch.conf
 endef
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
