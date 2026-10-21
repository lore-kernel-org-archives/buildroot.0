Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D165606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 14:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=coB77yMx
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 052F460884;
	Wed, 21 Oct 2026 14:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFJgEWJAbdP5; Wed, 21 Oct 2026 14:36:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 464116084C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792593374;
	b=oPsRRjW2NzlabFtMPlh4SoDAwyj9DoFC41hdtHkswUrBJmlvZHCwEBGQkKKCwF99eHtf
	 k8+3DLtJI5JVO7eyN3dqiGG6BHW/uIxbCXK5qeDJW+4ZUJtNAsKW1miVt+JgRlOb5IwWU
	 Y48nqkOihkQHNfa+a3YWBuwsmXtNQBee9n6uvg76aqMiTpHyGv9Dsp/iUDMIWG51q8col
	 ePlUpIIZXHJGM6zsUVBOEDwS6FmoJT29DJF+1Eu1Vr5Pc2sWxjqK8DNWP43rvXNGLMXi7
	 0AP3gS5caen7qXsZj3RQVKBBnQa9zsOwYTtEBq40cBk0Qyh8NLBA2t3/NCjqyfwGXCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792593374;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ukARyKCQuvFdIVi4301xlSEU7RckzntOT3O1r+IzhYw=;
	b=fPywMuoG7zWMG7kXLc1FpTw2RMCD+KG7LTc4cvlOZjiNS4pscviIa3K5BqOCQbY6Zr/c
	 U8jMg2Zwsx74FbgejQMZA3h+4SX4i8Yl1E4LGUVZG8LdWK3XlzxNcEMNxpNGTc0L9tzDJ
	 vElqT/gPdQTrlmxIK8wkjgQN1+4hcyV7Qo0uxH1OwaP8tdAQzS9EV/tO5rXeN+FCuTUyw
	 a4SfPfP0f0yHUIJvz93h4Apdd3EmzxRerdAumm1CTiINUPKpzXQiOYJ2fqU5aC2k//DJd
	 fIPA71TlV4e4yzkuReIxIx8wUbdOhM1PoUupK6Y2r9Zao9VN83UijRVY0zDfQlxAsHQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792593374;
	bh=ukARyKCQuvFdIVi4301xlSEU7RckzntOT3O1r+IzhYw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=coB77yMxz3eTzuwJglq89zBOJrxm14msVkT/5FQefaOpFUXv/WHS3uJgNo6eCzqXe
	 p3B49bHeb6PuHGOGItQvO+OnfFLN3Ur/Q0nEVT/HxsFqlvgGiakAZOt1YZasK/8gA0
	 522t/SjhyIYz4BH+roC1CPgEC52bErR5Q5Ey/+9Ktr7JNB6uLY29VN2cAoFfvtxmiS
	 pyJy6CKRVe09Nch+BaQDE//Q8kz0WTxOvGqrNvAFk/ihvZ9cAQt+X9tYFscL+Zpilp
	 qlnGFluaVhdRFRsIx4AWrWDJjckYpGAOIevaXG5dEHBquZ298pLaLcfxPSVNuysojg
	 H4BpepLWlfA0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 464116084C;
	Wed, 21 Oct 2026 14:36:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E33F9765
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 14:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9347408CD
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 14:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJ9JzVBFP0Kx for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 14:36:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C5192408CC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792593371;
 b=svTxHaXpDtHC//Rl+2CrSOhZlRsKOL5fv8/eQL9/67BMiyPQsE/wql40eDhmjDIG6rml
 YjBoGnEc9yZead+63s3k2eWoVZLH3rxVBaefBzp/2BLcT1kh8aWhQ1Wps46gECsSpFce6
 hh70qASdWA4JzkY/6cNyaEfPE0lrVwvWBR8yzUXHW375MVCMr3ZnKMs9ffixA3vvj0azq
 0ohOaHpYAJ3bol17dCaSC4Gtd+efwwzzn1+gTpwm3/7gDRdbt0qtDuSvmAQYJr7bLqdtJ
 3oDNV0sZBTaQgkzKAHYyRRcvN/6fk7JcwiI8PABFIgi7Kry5KhDyw913AxceBfSIe1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792593371;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2JZul9gPkv8IphBze8JLitIQUfN6Z4gPl9J7uGS5WqM=;
 b=KOtCVTS+gVjhecFC0YUofwe06XcJdgDp9zgBAomHS08gN1agKUW++WNjJjeIVE1D2GAd
 bywznvWHqNv4q+eeeRqOT/4xomZWCATBBawbHb/ADsvky1zCM1P7DVbnANSWIuG8CFEMJ
 rKsU5lgO2Ne+h9nSsVcsrc8LEFMe576k4ZCLR/R05Q9M0hs6fqSi97f7tPJVh+ncBEzEK
 XEV/1eka8er+cV5/yVNpx+XHlHTVl24bQtroB6D45xEYTj9ebZHF5rJxFE4G65V7wP9Cx
 lvvFw34GKhkRBpmHxDv66/jTdmOvVlSJp4ztDnGxfLrOsQalYT7zMYZgiIUkE1j/Dfg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=R94vgeoq; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5192408CC
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 14:36:09 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48dc202a60eso399274f8f.3
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 07:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792593367; x=1793198167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2JZul9gPkv8IphBze8JLitIQUfN6Z4gPl9J7uGS5WqM=;
 b=zVIxzw98uu/SAd2w4eBOLxipvWaefcwJZALv7iXlghity8O9wh3SSieBNf712O71jd
 qOZFeD4QWfARXPY9aYdRiKDlY9vVNbIfGaHrweQErBzuCbWI5gHj0OhJ3JJdg3JeIYI/
 5AlNS7dvvKHdpTMWcFo7Bh+JwEp9Qe6hvZL8cRVvN5A3bDr9OFde6st6sFe0LGO3L4w2
 Y2GR9sEj6U0q5wYF17gw9ShUeEQk47A6F8dRzhui6iEDl56sdV8eauFkDpFgSdWW+/XD
 xAsWU/3UOxZwZnhwmrmthZFNUrd7m2p7TeW9HW68ePJj6N+g8U7WyxjKNdbVUp0SJzwF
 e/lA==
X-Gm-Message-State: AFq9FYLltMaJi7d36icraf9tyMUcPzd+zb+PVNblmmyfpFSMo9e3HwU+
 CYWCJagX1A66h8NmCv8/zfzbD1OFiGIl6JAUOJI3LNJY2oD8rhGTgjjV1/8dCqT59Q6Xc5siGZY
 /LOHD
X-Gm-Gg: AYBFou1sxldSWZ2dZhc3HjozPwkfReTbWjKdnjnkMiPkowvLvo3GhRYPufI0NPX+NRY
 bOTAcpyAIMSHM4UmfIrgJtnHdkbvh4zr5NkPudE56VSqXIybWDI5lkBCyEVkGNMUXQgVBUV3D4S
 ovOVLqHGNvQ4/MDaZSvtffb0CnzuQd+BHeXP+UE52U54kRFk95oiw0bHGVTRqACA1ODt+4c4PHn
 Zl0x6ic5hdiB2WNEM5AsG3H4QCf4spHKKIu7sLBDhysu0sJeMmEg12QpjGrOl7uhuogQF58S1yy
 T4fv8KwO9pP+z1UloUxG433ayRWO1ZHsUXtRzTffEvf7f9vJzYhkRTqZ/D0z6WsiQThgMyTuL40
 uOn01u6xz9YBmvN447OK0pV8A49u+ZEPpnFk4ei45nxWO1NiHyOIkRzxIPNGFE1GzW0buHB+EXs
 vpAEbKFW/vOgThT/2M4CdFVXGrjo3zuRAruil+W6rBpRj0hTVJrpvKAO6egtBCbsLvJlbTY3b0p
 01D5sKrYI4GbM16rjoypApgZOAxUme3ohfeHLwLfY6+7OaTJBUBtShgXG/AtASboL72TA==
X-Received: by 2002:a05:6000:2dca:b0:48e:3d2:44ac with SMTP id
 ffacd0b85a97d-48e264a65b8mr4676844f8f.15.1792593366961; 
 Wed, 21 Oct 2026 07:36:06 -0700 (PDT)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e25835247sm5697832f8f.41.2026.10.21.07.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 07:36:06 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Thomas Perale <thomas.perale@mind.be>
Date: Wed, 21 Oct 2026 16:36:05 +0200
Message-ID: <20261021143606.428870-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x 1/1] package/php: security bump to
 v8.3.36
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This release include fixes for critical remote code execution
vulnerabilities:

- https://www.php.net/archive/2026.php#2026-10-21-5

See the release notes: https://www.php.net/ChangeLog-8.php#8.3.36

This fixes the following vulnerabilities:

- CVE-2026-109618: https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w
- CVE-2026-109619: https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 99ce84673e..604e52a54f 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  ff4630fbbbd94359134b7d3c223db59329905bdc4f5a9ef93d257b48e358619a  php-8.3.35.tar.xz
+sha256  dd54693aa334c5c4d72e9aee96b082c2473750a18a6c1d105789c93a3b1692fd  php-8.3.36.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 497ccc49e4..fd01d75e7f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.35
+PHP_VERSION = 8.3.36
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
