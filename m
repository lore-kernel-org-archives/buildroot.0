Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB19606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MQnuejgo
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49A5E60873;
	Thu, 22 Oct 2026 06:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEG2odkavKek; Thu, 22 Oct 2026 06:40:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 66321607F6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792651251;
	b=lOTh8VTGqGdOfy3MJlZFVpWoNONEuQ+R7m7eoyA6ycWab8+BNr9lU/wdw57mOgclyhpi
	 v4+vFQshFNe/5oTmThJMG5Rmr0qZk+mwhAQLLl/GfK07e5nxot5XSa8LFYCb7eRexnP1Q
	 ItGVrpTnBLLTGBnHE4IG3wWL33tUKIT2hTLKPxGAroI/8ZFv9xm8HA1aFyeki/HXl5G4d
	 hM31sQeDjJet+odUbjVhCBc23lid3sSEooVRVEc8zZT1yXOYMUxXRvOyhZabs/sIrvCAP
	 NOwzMeyh3usJYXx79Q4Lsb1S4wjsywXFkHMKnUmOjhKFOMisCOW5YKp2acNT3MYkhOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792651251;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jGjWcTJ3fH8ARrzoKq4FTKGHHsZG2n1ECS1c0GJgIUs=;
	b=ndxNpgobQYQh57tNEG3xWCZAeUxbudsryYuyJpB+83bt2BGlhTvT9W8mJtKVHAy+0uzz
	 jEsrIB5uoPOErfE+p14pHpCYLf+rs+8VEj2my+NdoyQt00oJG7AxTOfJBwMzxonRt+gIY
	 Fh48bXbXAvRZrXT0Cm5dqlhPP2Hc6OHVIOxvF6vRBAvHR1bj/CBDW+ZUXENfMCYmvdkQ2
	 d7fR87s6LKsXYOEapaP48RmKdDErC/M9J4P0bfYyWG/E/WiO4PZGjGNTDGzSswyty59Ma
	 6SOIMiWM9R1esf/T3jhEu8iWjkUSWYEexnjOExVsOaX3NfZncX6Buot066kn+n3RKfw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792651251;
	bh=jGjWcTJ3fH8ARrzoKq4FTKGHHsZG2n1ECS1c0GJgIUs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=MQnuejgom51hj0MOdMwFUdNWDvewdK4pOb60aFrgMdgSsWRXgo2z6PH7QIP5e/m9R
	 EuS38iDtrpuVtMdi1i0aCLn8HY5fidqEWdWMVelM8twKOns0zyXcpiw1Xi7CTcNl3e
	 X7MDVljpiLvE4wsAX2Q3yCCAJy2erCU594KAAwtQyvHJMsEBZgtK71AKZX/5dF2wTc
	 7BTePr16BrNClLhJH+EUPpatkbWLQDyLwCQ7ekN32Jhogulo8Utevfyq/4nk2IAGlu
	 /npL4pfLI5avSAfAUOZ0un5T0dQdV2bPE/KcViO3SCh836WaLn7crbilvVY91x/faw
	 Wnl5iOSNyktIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66321607F6;
	Thu, 22 Oct 2026 06:40:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36B461AB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28A06607F6
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:40:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qxEp9njAdFxo for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 06:40:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 042D1607E4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792651249;
 b=qgl5tpUw9aTw0mg8z2/uVymchXTm2yBwRS7oXFqOu6gn/YL0kOQyAgezDuUzL3Vp6uMt
 r6nJWXv31XPWvbBj9VaYl/KIDxHN87GAZCSO00TBkGILFdpMo19kHoMa4HdoQtfRu2f2x
 ob03Hb61WJfYHT0+8yScWqYx8NVgOJUlMiKkLjmPqA6oEialwNcixjefDTDTWC/tMa+ZR
 sYQWn+tS6ktYIFoWfsnSN8+LUHgnQ+ZIMn6IZtdipWwuo1kAAHxMnY81XQzbQ3cqy2SHr
 ykHtWp5hwgsCGoNKGSefL1hY4ImfvP1qb3UI1p/dkN+bzL3VfM+Ykf4FY2jX2i+skwg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792651249;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=P4qHufOOibYM/p7xUXwGTKkUVencl0x+dJ5UXrzdtyE=;
 b=MRBaEm9KO76Tqv8s60ti4wrm//MiWLbVRhoIgKH/XYmZYukmVYG2vjCQ7SV571GYUqz0
 kt2WuLV+EHPNoXHPTukzQY99ExUzJRiw2IADfwnZtnLDHybaIgYA0Cib0ZD0yWMv2u8WZ
 R8DJq2Mck9fMaKS9WEE2nKDErIZ1NVl57VZUjf114hnkc7W5kfvbVbBkRtSQswMp7vTDs
 vlSw5VHOTJfh+ntF+QSw3kSUKhIoFHkV1lhEpulkVk64EuTRH/aec6Sk91YvzNXes69Ks
 ezbVj6XjwwMMQ1xk3u1g4pmNlMZ1uC/rTeimk+oLaF018scAPiXW3yH/JuB5iuhCJyg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=cwMSBQkf; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::635"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 042D1607E4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 06:40:48 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c40e02b2ebaso229700966b.1
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 23:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792651246; x=1793256046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=P4qHufOOibYM/p7xUXwGTKkUVencl0x+dJ5UXrzdtyE=;
 b=pPwRP0MRweA6x/HX9GbY6mg9kyoZAudlE+pxBMy1YytWzcq+oU+/DR0DUosOSuvxda
 kfo6+KUs2yDaAQz2UvtjgPnCvl5q1oC3Wkg1SKcapBQWmBFhuOASMdI7lx3Dlesc/8Gp
 jEbKj5xrjq6YLt/hi+qnx2iVRgl7KavufN/mWJHMZnmUfBDaqyCbLlMoZ5WmrlZblIjv
 TqisXxbF04iGtcoKwSA9rb7dZFBdI/5zGi6gQprybUDdSwxXKndQx7d2hOp8/O4KlgX6
 KmVuTTnIq5q9hazErgfIxGk2z6qJDLv/Jj7/9rSlqeNieix2518djFzFY+BRh+M602j2
 SpCQ==
X-Gm-Message-State: AFq9FYJIDQ/CzzQeqbMRSfrLTkzBYaVAkHzWBy/CbRTwcoKKn9SNeRhH
 6NwDpIWYx3M1aDl3aq3vK2YNsHksLnRLDlu+QXT831kOeyelZHWt45xJZSgwKw==
X-Gm-Gg: AYBFou18ZOkMMPddXuAGjKC123S5tjiKEgnGGPwYtq1zz4/mwGfI5vCllMtqMLso6KP
 nOdCfiBePQe4ZDmlmWz8B2k5WsMITOh4KnPs54IcYaURxJGxH1NaGEqb87Xg1YAjmfk7CMoOMHP
 8SvygPV6kCb1VCb6KbEpEQk6HF2NpjCwpeyaxADfy/0A/OWorBLkQHqz6vIlw1yblnYNfVRIB3d
 kRZUKxLSmWXvWWvefI5+A245eTNvDzm6ACHe82Rdm9rrNqdJ4/sg3P0hQwt0q+5qjEcJ+8VOFRo
 2ma3Fm1jr3e7hmx+sORHShAW8ot3NYCYVK0gHLfI6pXMHhCoH6I1fCHY01Lv/sd/dvX+G2C8xYo
 XfXwRpPWmnSIjnyfooCUB5YGPZLKT3DbmbcA5/jWaq5ZmxIk3/NT6I1GFF7A0QcehLz6rjT84f1
 D7ne1FFflSQlpPmU3MxPBpc+aa6ePyGbD8ICYQhWMJqo6uRio8RMvUvaOBUwBMoDDfy44rAurBA
 8zpm+ORJlE05OkHfgA5P08wcLaQQoaFdu1z/I7v4DoHE93HDR3T9ZEz2YytfMQhpzbQWsc4V2XS
 MMuYrG2gfKMWxhwUwSN55oxEARbJMf39WPc=
X-Received: by 2002:a17:907:9445:b0:c3e:e726:9548 with SMTP id
 a640c23a62f3a-c46795e503amr351733866b.14.1792651246175; 
 Wed, 21 Oct 2026 23:40:46 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c468a59b459sm70690766b.59.2026.10.21.23.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 23:40:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 08:40:45 +0200
Message-Id: <20261022064045.2186383-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libconfig: bump to version 1.8.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For change log, see:

https://github.com/hyperrealm/libconfig/releases/tag/v1.8.3

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libconfig/libconfig.hash | 2 +-
 package/libconfig/libconfig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
index 22f8473fc4..c19379ff6f 100644
--- a/package/libconfig/libconfig.hash
+++ b/package/libconfig/libconfig.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e59ffb902dd5731d5d4e4fb81d3b989697615feab72dfd7c30618167b91a42ee  libconfig-1.8.2.tar.gz
+sha256  0ed3e37db12e38b6fd7ca85775283412043069da2edcdb0c0ddcf9160a5dcc71  libconfig-1.8.3.tar.gz
 sha256  cbbad55f94feadb16061c4f782910bac254460a44f1c8abd2b91452eff085f55  COPYING.LIB
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 8bd494081c..2e3b662f04 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCONFIG_VERSION = 1.8.2
+LIBCONFIG_VERSION = 1.8.3
 LIBCONFIG_SITE = https://hyperrealm.github.io/libconfig/dist
 LIBCONFIG_LICENSE = LGPL-2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
