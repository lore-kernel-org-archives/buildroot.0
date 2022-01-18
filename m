Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE55C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 20:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09493827A0;
	Tue, 18 Jan 2022 20:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEEUrnol3Pkt; Tue, 18 Jan 2022 20:17:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 671EF82611;
	Tue, 18 Jan 2022 20:17:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36CA21BF4E4
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 20:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20EC482611
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 20:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Vi7oWuJPAqv for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 20:17:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60BBD81D19
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642537031;
 bh=+B0XTi5sD6Y8jRZKksJICRtoRSZ+pWPMsCnkmkBC+2s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gX2oud5ibVa/eI2drZ+3pSrafO3vpgyEMtFqbQdUYsJZ+dHlYxRti0fBI9kYnaxHN
 r7yjLmdmANRD/8xNlZwx0wXWHgzLH3hqrG/0IkaoR+CPjroj1f6g5SC9MpNQQ2mQfR
 dbs/pM9BloETUsdWiCjifNc/LnPBIK5dp9D3xRe4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.124]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MEV3I-1n7A2W3aeI-00Fxuu; Tue, 18 Jan 2022 21:17:10 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 21:17:09 +0100
Message-Id: <20220118201709.25366-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118201709.25366-1-ps.report@gmx.net>
References: <20220118201709.25366-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZpV0fFP3aMK//OW3jXpMcRTS904diHLRZ/75OhtcvrmT2ue4XJ/
 tS2CaCmKfk4dElstEXm1iGRQiCv7PIYTPKwSoxoJkOsoCmBHq+ku9FTfeNvdX6OkgAqM2Yc
 01IPPwMBp8kYXiu5pwvXf2cD9oGswfcAI3mBoyc9rAlzk0tWEfze9mhVlQw1AbVqeFuwnv4
 cwQO6IXJDrtB+8kRonOqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/kqDlWiXfAY=:SE0XcwNVWAt5hPVCfKVlON
 evahoOUNoAaSYjCi636vDwZ86ZhHlgYL0Q4A2QkL3hwD0pwzoLNasxrp/vVyTf425deXfifA5
 AjEHfBSvOJuZAxJ9leChQZ1G4ufjD23jK20ctUu3kJc+kBboeXVD+e/O93nxALniyEf4yGCKq
 WwfMvdqwH7D2rX7IQlzL5fGJ/jlHY+hA4G80igXKUQJg6KuPb7NWvC5W7l5lFUJNYZ5u/GnPv
 Kz8CQvKHfdttZNb4+HDe6pY+fsvlddJY6bTS3Qx37F6JB4ycCNWhb4fwD0CXHj3V5KWNKF3nO
 f+oJmM0LnoTuaPKS2tdDsGARwjKmOiRGn89p/x5VCwRMP9hSMOAoz38ipgW1VlOXZvaZMRrnx
 kyFsLJWX1+o9vd46iUgO5m4J6nkK3BRj2GDVVcxQUPR/GhMBSPkYDz/vj4GleAC17HBXNpKmW
 Li0n6m6DHeRhZ69yDEhrV7XxjxnwvskyczN9a02VcmxwXgxVWHj0hWWTULm4NSMj5cqGtKfWi
 e4RWS+SwZZO7vXqgMesAyous8OAK9hqxyZz/uXne4eGP+Oiftu3EhoYh7FUrFtcf0SOnCxKf2
 508eXWQTuOr+Su9r2Ene+kTq7JtqVWBevaThyJnAsKo6cWsPIAPIpN5bmXbI3YBN6hY7f9WLM
 er3zZ0maE28kqhhmhTrNj3ElN2svqD3CNpmzAta5RX0Rnfzzjv7k9A/5b9QVsxCPEu2Tvgsix
 zcyS+9ieozARqigpxuHnu0voFeC9Og4SfJZkebxMGa57OkmXqlhec49ZEHCNTwoKXW08NjRvB
 vUl1JLHd28tj6vadKf+fsTWVfv1BXm5YvfBIa2MJV3OaM9ol/0GMPDGIFL7UDsWbLpIK90YrP
 sACZMMTz6r30zgqt7TvkeozUXK5J2Ijkz8rgT9Ozz+2GfZhF36TQVFKBuIoktblJL2s9tsLiS
 5qXeCZY4dFalZLHE2ETpRfzb3+6KfpOavDXZzLzZtoty5fFqXlwDoZdN9hGk0ve96gG/e703j
 WfbouDDZ3MbFVE8l7G7Rhv0nAlmr8A12+G9hUfYWKM4Dx7+a9GK8lGC9mpNjbiyJlO/BiWqzj
 QmxPxMzQyHkTyc=
Subject: [Buildroot] [PATCH v1 2/2] package/enlightenment: change download
 URL to https
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/enlightenment/enlightenment.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 640d5a62bb..24bbd96cd0 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -6,7 +6,7 @@
 
 ENLIGHTENMENT_VERSION = 0.25.0
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
-ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
+ENLIGHTENMENT_SITE = https://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause, OFL-1.1 (font)
 ENLIGHTENMENT_LICENSE_FILES = COPYING \
 	src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
