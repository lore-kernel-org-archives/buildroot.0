Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3EC606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ba9TKelG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=orange.com header.i=@orange.com header.a=rsa-sha256 header.s=orange002 header.b=Scis08ym
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7DF480DC5;
	Mon, 23 Nov 2026 09:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uhqwWpSQXYLe; Mon, 23 Nov 2026 09:36:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C4D2680DC9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795426618;
	b=HGkEfPE/rXmym8Xti7uyYReyRIZ6/Uzlei2NWdUMTmq7jTI9Zb5pjChRoYOaAPMUohFu
	 oQAsxdNElixXXnQmlmHrW7Gzu2ajmn8Q73hXULsAGQeLAR6j3dbejvCsa8skCXWGNWY6u
	 9vGWPRj/XD94KoiJauBagISYSwYS4u7yR7v51RRxzsTt0H2CatLK+L0blZ0ibRJe1kdQt
	 qXknNj2MAKWBlpBWErGw7x0frHV/iDeDDrQJh0d0YjA/1KU3BYYqDrpMI4NQ0MBir84nl
	 oFlzhyo+V9dVrZJqta6UJS+bpHDpjsY0zlLgtDEuNw2+f6m9Sebox7gfeknmqj1/jmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795426618;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Originating-IP:X-ClientProxiedBy:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3CMafVKGGAiZRJma6jmGLajiGXlA+7uMNAXhs0jE/2A=;
	b=eXiQ/2VZSKIX0M5PNTYFI9Ntz0Afi7UcGBCMs3b0vJvUCEWaDAKtrFqyDYiqXyx9lM5S
	 P8w1WIl/NX4gW1a5kvKzB0Kz8xeymxxeGPQ9+bKf+QUXHy8wMNDlXfHXLbnJAkh5fzLuI
	 cpoAVOKVsYA5VUXAzkStskAjvxfXeSSm6JqiVOkrt+Q9aKIlZRgdIJ5zgHM6s1qrvBbZI
	 TjUS5Dp1CXpi8gjfoJujEFdppin4KEXRsR/HY/8znFuA5smUzi80HmGavOj6DGrxdjNZr
	 1ddo+X/eYQyxXcTYBBwhT9wIVHK3Q7lqUmkq4ksj7epUtK10OKsTzGOyyiDTb2nEaTg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795426618;
	bh=3CMafVKGGAiZRJma6jmGLajiGXlA+7uMNAXhs0jE/2A=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ba9TKelGaw+zW2XkX8UwgSSzvqeNxhFTWTeWCxxgW8eJU7giVXlPhaUMhRnpMLoc/
	 ykwVPenxt/Zd3f9WIHUWpP3qPW7QH1L6YeHJ1v8+M3ylElEMdLI69nsJyIaUZP7Pqb
	 od1GzWHyl37LIE829HZtNgfRJAFkQx9Z0o9itpUXX7euN5sDqsT98ZUsM5Y8EtQLrr
	 E5ZMlH8yTrO7mCUg1FPfmyNxpJcEQPO54aHoD0YMrPDnG8CTKiaEk0ckW35cUTJCZr
	 2q430JHKZZirWsWCEZlLQACdMB7c647ENgCQ+ZcJsw0lpiC4/JBgq8/oLpFw9weY00
	 xoHf5KmpOLHkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D2680DC9;
	Mon, 23 Nov 2026 09:36:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67A57260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6500D405AE
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F67Prp_q2csB for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:36:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C56654056C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=80.12.210.124
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=Scis08ym
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C56654056C
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1795426616; x=1826962616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OwGch6ECYMBdy87grauV71xuKO3sVVk7nw4CtqGGPNo=;
 b=Scis08ym3R9BgoH8ATlyVU0B+rZC2EjUDQTKCMYJ7xKmWl9QeQUZDA8N
 PsCMTeCeM+2tHGIah6RyQA0/M3rqJ1lwNZfhlRVAYjgsT/F2fqrPg6w9I
 2yNVnUZPDHyFrh9M/rLiRS1SPf1xDJoLdrk/vml6hPTZXAuo7laidOG3R
 g/8YHSloLCxwgdcKiXz4KfT+BvZ2t71RkSmbCOtLfwxw4fv7AOGZWgUhj
 X8ODaBaGNCaPeesJg4k4/W7+Ge3HYrl9Xu6EGldktpbxievhOrN77d/E+
 CHZdMlmtZUA+4aLgRqaOiuWEmiGgQGxurmkooLOeljzx5HV7JkVQj7xru Q==;
X-CSE-ConnectionGUID: UOK4FvefSeetR9KoKWyjIg==
X-CSE-MsgGUID: kmnayPTPTFK4XMmgGeLc9w==
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Nov 2026 10:35:53 +0100
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:35:53 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56;
 Mon, 23 Nov 2026 10:35:51 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Nov 2026 10:35:51 +0100
X-CSE-ConnectionGUID: Hn8648jQRbS6q2pN1aeldg==
X-CSE-MsgGUID: 9J4mjsbBRAupaT8HeU7P+w==
X-IronPort-AV: E=Sophos;i="6.27,227,1787004000"; d="scan'208";a="497365032"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 23 Nov 2026 10:35:46 +0100
Message-ID: <eddac025a1ef7230a625f0b0f8259da7b06cbf6b.1795426541.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795426541.git.yann.morin@orange.com>
References: <cover.1795426541.git.yann.morin@orange.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 4/4] package/docker-credential-gcr: bump to
 version 2.2.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin@orange.com>

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/docker-credential-gcr/docker-credential-gcr.hash | 2 +-
 package/docker-credential-gcr/docker-credential-gcr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-credential-gcr/docker-credential-gcr.hash b/package/docker-credential-gcr/docker-credential-gcr.hash
index fe022e4391..27d0e0221e 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.hash
+++ b/package/docker-credential-gcr/docker-credential-gcr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4f624eeab2923fc135b8d69211036b6fb04f3d62290cac63260d07d3f2f9eecf  docker-credential-gcr-v2.2.1-git4-go2.tar.gz
+sha256  1d9245338465d02067573c9a83314ad5f32b3b0a74e3b984f00607e412e8b437  docker-credential-gcr-v2.2.2-git4-go2.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/docker-credential-gcr/docker-credential-gcr.mk b/package/docker-credential-gcr/docker-credential-gcr.mk
index 95c7af83a4..1fa01a1e19 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.mk
+++ b/package/docker-credential-gcr/docker-credential-gcr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CREDENTIAL_GCR_VERSION = v2.2.1
+DOCKER_CREDENTIAL_GCR_VERSION = v2.2.2
 DOCKER_CREDENTIAL_GCR_SITE = https://github.com/GoogleCloudPlatform/docker-credential-gcr
 DOCKER_CREDENTIAL_GCR_SITE_METHOD = git
 
-- 
2.43.0

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
