Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C43606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 11:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N6Z7XPl1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92B63606B0;
	Fri, 30 Oct 2026 11:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZsUg_jfdv_D; Fri, 30 Oct 2026 11:50:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A349D6061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793361025;
	b=RcnZt0Zdb5B44kXUNn53YJoupHvpGEfqOp7gaMfxf/dBf5YgFENUk1O/FArEQS6RMXh5
	 oWJZpFwcKeX9WHN8DdrTz7YxKEoCFltib2M23X8UP77YIcPGwGXtIXuSTGfHzpNvt4+4d
	 ynVBptxECb7O2Z4vuauLxFAXRyjbUF3PaNmfDHa4z6DATHFYFfY+DdMCpcne7jx6Cf2O/
	 IT5mM4GMYRKgqYKE/yIAlXtS/Ej6SrAk74fhCNl1lSr17FsvG/rkhqyTwbuxc7YRcJ2gT
	 Lx7omc2sw6JQFaWq7feQhJBMLd0b4EjhXusgAr4yqD6GjMio3dBwKPNK88Z+a5VyA5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793361025;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w9m3HjXtlM1q0HkD1RcU2ysRtUaIHv4BouJYL747cVc=;
	b=ZRpI0JcQM+Sn8a+qHsqffv+IGqTCge5Bk/OFeL0JTtaEBhg4QXsH+5qub+mPAvYRVoCL
	 Rh8C7Ql6YUXpVbjfymEDejvl5GYXtN7XtBF2E6G3y5ZBgpA3qeDkjx40x4RfgqYlMUty+
	 8pB7UeBtkioDzHcdacc1npD9qjICCnMOwi/6wWxlhxCG5aI9A0eUIwWQwy46AfjGPz3D0
	 izJNYH1LYcg8I9tzuLoxodtKtpHmDTPQb4CVb9d3cJONTclH+3aW3ZwgObWNoaLzgLmiJ
	 9KlZhckS0YvXKwbangh99VC+hNJ0fvfSw/tlppjnNByLBnz2knAbRjQt15F0mY6tgxg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793361025;
	bh=w9m3HjXtlM1q0HkD1RcU2ysRtUaIHv4BouJYL747cVc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N6Z7XPl1ST6Z7KDMkQRXc2hU7jAgRnNAAIdxpQZ+Us+Wuu/tM3kC2FUCUyNNzuLfR
	 1DrUgZvqB4s3aqmLHm+N+TjmUFkP1hmwyTAIsBG3tYbLREhfCQLwOs1saMZcPRozG/
	 s6CN/TqaJ+GbSmlPkoKvMAZ6jFIYIm0GCzNzWue5gK6O76ehw0OmbutVefRhk3Fj2n
	 Dyu9kUWN9Gj9AxrhZny7yxAgepkdVThetBS3wNNx8BT3MiXehB7C1QxGdymQPmPOla
	 wFnSU5wbwNwam0L+chM/roHFGLI7Gy2smmIYIegnNwsKgzX1Pdq390zqiPyhOGqZE1
	 SZNMjB5y9N47Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A349D6061C;
	Fri, 30 Oct 2026 11:50:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B5E74BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 614A8605F1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6skYXGDBxRN for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 11:50:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 550136061C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793361023;
 b=o8lVgT4oly23rPQp6RnPeCL/fLqGhh0oCovZoPdeb5hM6bOHgvqcjWFlWKp27+LB6fvh
 foe1EcJ1NDaNjAok2rYuJFccyprAeD5P2pJeTqyIijMcsYsJujp6kacxJAVthC8SGN1CB
 sCh2AHU9MN31BylSFS1wwMriiMc+6jUR2dxJ1uMfxdpVTN5cYHj0QsaIREcM/D1KNJEy7
 lEGTK2MHcvW/KEHGaCZdrf0cuXfnY68LtNYCXqaEHzpvvFbfgU87L+UNythtSVK4ZTjk5
 9BoSacf+Z1PB9jUgEzv/6VjPqFdBFa7YFaGcZRBy8ey/Ad3TyLr2sIefz7BJZ0FY15g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793361023;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=g/At0r+msLVmdAmpnDU1zknk/ANSxPfsZmvjffXtw8s=;
 b=KoK8s0CCOdftth9OQJ+FL6GE46//1TgEaDXn/SK7w9r0NKGW5RUxOAtmfHGLJMGANZi5
 ATdI0GKDckOiDTbODGxopB5Qp8OU1zjtRwiAQ3MQGF8hOeIWpHDZ5DbbMO8XTAcLeLSnY
 NsQY6gK3b+78B3L+0gK/RU7rMmT+mwe49cIeAFqhit6zuGNHITNqJkxUkm3pTJ9QbhKWS
 cS+7wGklyjKll7yzSOYsPWlIBAjc+/LEvcykJSKTkV2LGUnQTGpA2AYgsui6x7ErynE1+
 aSJXAAmGcQjVRXhASsK91eVBAk10K9ylwwI4YdWshMDsDQRZsNPESY8pdJpWSjpf7Pg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=dlvShhN3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::533"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 550136061C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 11:50:20 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6b1ec41d8e9so627899a12.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 04:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793361018; x=1793965818;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g/At0r+msLVmdAmpnDU1zknk/ANSxPfsZmvjffXtw8s=;
 b=e2axckt2XcSokheQl5oAXGI+UV8Chabxiib2IFaB+Sm/WYESTEm9a2QAEDqggvQDps
 z213Up9W8FbYgc559Jm2/GlUsOnTJbFv+iny9wXuzsqggWVAqRSP0oZ1Tt2ppMY0CbNs
 YisgvzrJ4coT6JoDJCCUYiWvGFCfPGgPYbLQRDoE8L998PfC7GxPFNU6xXChDTskok19
 96MB6Egq9ETuZkr6BuR/8vfSvmf3lkU0/SDQ+gFvYE4t5JrMWlQxOHKs6l5Wb2Ir7UA2
 KoTOVwyUHga9r5CV1Fn8ZyZsStUXQh7yRL/9Ulxw7uDqQ4HqcHrF06FSxS/1t8aw5KLS
 C3qQ==
X-Gm-Message-State: AFq9FYJgQVpQxdclawajVN7TD4wxL2ZojpGSmX2HEYz5DJhxeth6or2K
 exp6sF/zVAFhhgED5pvqSahGfzSgTWtQgQhlMRIdb80RL8bfrtYNWJk+tKcqFg==
X-Gm-Gg: AYBFou2z002+y9iBmmP75vj19IWDwNn+MFGp6Mg5IBGdl3cZm7tie03B94XIifIIhqq
 6SirX+cf970yKbzc5mOy7Z80lHsDkj2kQc8O0bQsDL25VWW32MOJwGSL1m8myLPSFjIztPebD3J
 dnMf6j6K9uOED6SuG8ZZI5uEHOcnZutiLAip8pvE5JAa+JA7ALvmb9oxlSimxiUp4GKoUsNCS6B
 twtCfw0Htnlfa4gu5hEpjO6M7x41ISJ/tnl1lyx6eJhlwwYCLSXU0jrb20rb2sFYFLUH5hmDpih
 /LNdXEQgryWxEG8yOLDSvSJS8spru5MFkiFw5d0VdZVFxXkI73eDEweGv9IbOEvW9to/W8zcNoW
 YiE3wPRoiuIcZ0X9BA8Jo3fZkUDX+vy2GV/5PGi9jy0Nv6YtJlcxvt9ZJQcHC+8jzHA8PZOrrKg
 BiXdX6Pg0023BYVjmXs+9nz6yxgU8y6fQSvPO8PxUs8ZigVjXnQ7+MQdDF3osCd1lPjC8l47v5R
 C/0QjpCMRQ3i5PGhK/2pIbafdNK3xU+eFS5MIX4gKs2xU0uhnDzHXBDpHvHzFfcX4m+hhYtx3Ud
 +dm3sTZ080RCk8HJ28bAT0QPW+oGujk3ZYSZKYl/mJlK+fooh5LLZkTJAY4ISul6Z1cwoamvlmz
 NI8BQp8gV
X-Received: by 2002:a17:907:3ccb:b0:c41:cf68:bbcf with SMTP id
 a640c23a62f3a-c4ca7ab31f4mr175573166b.32.1793361018294; 
 Fri, 30 Oct 2026 04:50:18 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cabe4aa27sm57346566b.56.2026.10.30.04.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 04:50:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 30 Oct 2026 12:50:16 +0100
Message-Id: <20261030115016.1094292-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/18xx-ti-utils: fetch from the
 BeagleBoard GitHub mirror
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

git.ti.com no longer serves git clones through its cgit web path, so
the download fails:

  fatal: unable to access 'https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils/': The requested URL returned error: 403

The https://git.ti.com/git/wilink8-wlan/18xx-ti-utils.git URL accepts
requests, but fetching all references, as the Buildroot git download
helper does, fails for this repository with its ~1000 refs:

  error: RPC failed; HTTP 501 curl 22 The requested URL returned error: 501
  fatal: error reading section header 'shallow-info'

The cgit snapshot tarballs, used before switching to git, now return
HTTP 400.

Fetch the sources from the BeagleBoard.org GitHub mirror instead. Its
R8.8 tag is identical to the one on git.ti.com (tag object
6e8dcab3a39a, commit b23772347318), and the generated tarball matches
the existing hash.

This issue has been present since commit d8b15b078aeb
("package/18xx-ti-utils: switch to git repo"), which introduced the
cgit URL; it worked at the time, until git.ti.com stopped serving git
over it. It therefore affects 2025.11 and later, and 2025.02.x since
2025.02.9.

Fixes:
https://autobuild.buildroot.org/results/500ab1e5fc96b226bc6dd9bd7c738e7bc9b9cd9f

Fixes: d8b15b078aeb9b9f3b42b9bdea91f2adff02fd09 ("package/18xx-ti-utils: switch to git repo")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/18xx-ti-utils/18xx-ti-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
index 3e6f715730..6c04b60723 100644
--- a/package/18xx-ti-utils/18xx-ti-utils.mk
+++ b/package/18xx-ti-utils/18xx-ti-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 18XX_TI_UTILS_VERSION = R8.8
-18XX_TI_UTILS_SITE = https://git.ti.com/cgit/wilink8-wlan/18xx-ti-utils
+18XX_TI_UTILS_SITE = https://github.com/beagleboard/18xx-ti-utils.git
 18XX_TI_UTILS_SITE_METHOD = git
 18XX_TI_UTILS_DEPENDENCIES = libnl
 18XX_TI_UTILS_LICENSE = BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
