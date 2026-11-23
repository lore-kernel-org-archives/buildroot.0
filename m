Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A132606A31F
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 09:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jZ1kPacF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=orange.com header.i=@orange.com header.a=rsa-sha256 header.s=orange002 header.b=W4z0kVcN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1988C80DA8;
	Mon, 23 Nov 2026 09:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WlUCwhLFuJu; Mon, 23 Nov 2026 09:36:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 70A5A80D7F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795426616;
	b=hGH1vqRfuJV8fpTKqiuPEqWAUocSDVtmS+HvuHsRsPNjkU/j4iF8FSVt7nJGiAYLWXfo
	 J4BPABSuL4h2ab9ZQw98/LWUM9us3om2+r7zrW/KrdFPQ1u3INUsXOBrib2islJ73qR3g
	 cCbKr96NhPeKGIb6Lz4YVfb8Q3gqFMekAOWRWc34WKnwr7bYLTpoAn1rwCg0seVOzUCmi
	 IEZO/DuBh673I8/SoK/IdZUuWJsvEn7HUiENBUXFYZTGLg//ePtIkDpW3dXdAZne0vSI2
	 ZZR9xN6hBICel08rOfjb3+wsZRjwJJoaG3YCV1lzV4ShGqYfBYfJX4AbJCVvJY/iGjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795426616;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-Amp-Result:From:To:CC:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Originating-IP:X-ClientProxiedBy:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MvS87t/vZYVbQPiFO6ObX5G3iLVdksTSVIPLg5YYG6Q=;
	b=iyX4TBSEnv5igDit2puM/7/RLmTOj+cCwb8h0J+XstHvKGbLosqxhhblwsYkBhRN7/ro
	 EVyypWqTYuiXINxVEbtFLe063cGXUiQ5pnVDLw9ZqAei/xosANuJB9P0u6xrvTbHyjVa/
	 RbWwXbgS1NDJfvYvaB996sOMHyT4c1Nt/J7JgEbH5YAnKJSFpeZIGidoa4Cub+eh2hAc/
	 3y3jI9va0lkj6larbSeOOMkcSGR5Fs5B8BDb2JG2z64v9gX6jpWsv/2TccxOztox/cXuH
	 pwB6vIIQAsEw6uI7rOLBEQM+Hdi8yVE84mbSXqERdc2NkFGk+5hFc94Bb0usw2k8ROA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795426616;
	bh=MvS87t/vZYVbQPiFO6ObX5G3iLVdksTSVIPLg5YYG6Q=;
	h=From:To:CC:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jZ1kPacFpCesD9W0AlL3CQJBG0lK/9CHg/drk9L3ziCA+YYcg6KNVC0/ESpT4oNeu
	 OZ4cavJHHslJRYrxQB0nbnd013WWRQc0rkOjiwbSw3chGt0rDZJmVz01GsIR9N05lC
	 F1kPtS1LFKZd0frVc2RkjzbdFoPt17kdNNmDBVRTL734XKDNlMkcSRu16CvsVeYK3c
	 3rk3ZTSaiMiQqh5gCQ2oTQngczXR5CfUrFPs5i6mRh6M7gkvAFrPQM4l3gjt4IE3KL
	 +TLDQNkNBKNEC4QkzTrUcHDmG16X8MFTjkL/0ZytDK8DWfzH0lmqhsInpKo2zLzKWA
	 5ukzQ4JvRPYPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70A5A80D7F;
	Mon, 23 Nov 2026 09:36:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B1CC1AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70DD9405AE
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVi6j6Jaj1ip for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 09:36:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2653E4056C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=80.12.210.124
X-Greylist: delayed 63 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 23 Nov 2026 09:36:54 UTC
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=W4z0kVcN
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2653E4056C
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1795426614; x=1826962614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x4WWT06aTZMIy2EZLFka2e8CJCB9rAKpDUkOOwEUNKc=;
 b=W4z0kVcNHw+5gToeOCn9yCS0XI0jm/pEMc791zKnNXlveLuFu+ijc2R8
 frZiwT9J2PW/XC+yGn1Xpp/pc4QnJz7zQa809f1MNtiA1zlK3MBAKycTx
 UGbEow3c1cnm4EqYAT2M3zL8WnyEoYIaM2aY8uyMNQeDisSgROfoo2AIe
 98qkQ41uAjeLqzuya4lXozk6mv5WWcAwwJKpOpMWyvIhTz+nbYxls6r3A
 hxOI8R2Wh22EnVqjKcs1RovwYVXWx2X+XdNDZm6nkxxsfdUydZ8uJGjJf
 oBzi4+dhee45Q/RXoHbWvQ14rkKTYILVKGmg+7nS14DA3hVCIeua217vi w==;
X-CSE-ConnectionGUID: jgEj9wy0SgqC+uZ75A/0Fw==
X-CSE-MsgGUID: J4oO8G1yQ0i4KqcHQ+aeKg==
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Nov 2026 10:35:48 +0100
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:35:48 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56;
 Mon, 23 Nov 2026 10:35:46 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Nov 2026 10:35:46 +0100
X-CSE-ConnectionGUID: EF1QCe60QtSJVBb4kr8ibQ==
X-CSE-MsgGUID: Nnqsceo5QN+VY7Vk0l7o4Q==
X-IronPort-AV: E=Sophos;i="6.27,227,1787004000"; d="scan'208";a="497364979"
X-Amp-Result: SKIPPED(no attachment in message)
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
CC: <yann.morin@orange.com>
Date: Mon, 23 Nov 2026 10:35:43 +0100
Message-ID: <073f42e897525c61a26ac756cf05a3ed5e1d83d9.1795426541.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795426541.git.yann.morin@orange.com>
References: <cover.1795426541.git.yann.morin@orange.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ope16normbx505.corporate.adroot.infra.ftgroup
 (10.115.27.25) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: [Buildroot] [PATCH 1/4] package/distribution-registry: security
 bump to version 3.1.2
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin@orange.com>

Fixes CVE-2026-85747 and CVE-2026-46595.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/distribution-registry/distribution-registry.hash | 2 +-
 package/distribution-registry/distribution-registry.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/distribution-registry/distribution-registry.hash b/package/distribution-registry/distribution-registry.hash
index 9c2fa922ee..3ef8dac11c 100644
--- a/package/distribution-registry/distribution-registry.hash
+++ b/package/distribution-registry/distribution-registry.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5ed3891ed90c7d097304f49aec2e1f16299770309e2f424b5ee9531b1da2429a  distribution-registry-v3.1.1-git4-go2.tar.gz
+sha256  593cb55ca7495b35620447fbec5cdb1748f2ddd2fc5763fa64d3fe8bb09bd974  distribution-registry-v3.1.2-git4-go2.tar.gz
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/distribution-registry/distribution-registry.mk b/package/distribution-registry/distribution-registry.mk
index 1119132b48..ed44c3c206 100644
--- a/package/distribution-registry/distribution-registry.mk
+++ b/package/distribution-registry/distribution-registry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DISTRIBUTION_REGISTRY_VERSION = v3.1.1
+DISTRIBUTION_REGISTRY_VERSION = v3.1.2
 DISTRIBUTION_REGISTRY_SITE = https://github.com/distribution/distribution
 DISTRIBUTION_REGISTRY_SITE_METHOD = git
 
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
