Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A4B606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pNdEW3q4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SHDUdOat
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6298581948;
	Wed, 21 Oct 2026 20:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WeHIiSQOsPaf; Wed, 21 Oct 2026 20:34:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4092E81C40
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614862;
	b=C2QmaDsBS6BdF+lP+MtqEb86ZFFbVMfh6XP5CQd7r78OtaTis+bhaMMpB6ClbqdCSXoU
	 ihmFzN6/4lcJFW/As5SA3G90oIBlszTz1HdEPRmbMFyIUinZuRDRZAQJU79ToaoV+mBDw
	 JkqduTPXGMjQ7vHxMoQiEjGBMZ4khxyHGW7J9y/ruvRpgkYcXTmYfkUX2s+OYhAznqdFd
	 mxreC3TV05IijgKRri3w6BZ/THYXwB+SFplDlpbM23UnZAVYCoc34OGS2ymCh/DN3LKT1
	 XED0Sc9PBNrKFyOc3oN17VVDWKiEbiuPl29DkRyHESYvP7plRR96ssQ4p6BTC1ki+rw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614862;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=X9bcTU1IL4LE5QggN7oDz6DGNqC2J1yB56PjwUQLPKI=;
	b=MVzRz+ijlTxUQvnSeZZQ/OT+Mxy9QuQYYW588H+fBC8jWwRfzaUsxNvhhuV6UgXZ1hG6
	 AaBpUxh9EzZMVy/qevdVxSNCIEvdmKAjRLT2s2GTmy4/LJcBsR7YpdM1DdfKHVP1b15Ml
	 3JpV1fw2SBE+vgNl1eustERo4Ep+deu0Liu3+jf8GqAQvFcNsZpdl96dYnkSvk6Rr0QgJ
	 fF2DbLyvnxncMiOUE3O0WaK8gO1yybC7v1BwdZQo69xuY1MTxWYiBY6TaOKYHJZTMXc17
	 XtGM2rfeWlMC7rBw2jhR8o7G4g9NPL3wAKkpavbCMo+5TWYfUjRNb6Cd6ukKNKXNaVg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SHDUdOat;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614862;
	bh=X9bcTU1IL4LE5QggN7oDz6DGNqC2J1yB56PjwUQLPKI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pNdEW3q4xG+wUuZezk/90sn4VhvBinzrPdvmNT3yEKshaqMPbWRq5+kVGCgSSy8Vb
	 awQXejgkVQfK72On5qDwRYLkbByEcZHQ65FmjMLZXhQViAj85i+qjHMerYDt5pvGL+
	 m13VHVIvjCXWVk4G6Mos2fytXzABjyANhNvbuelgkuwDc4e0ZOh9FrkO4ymx0PQxln
	 Om5kAO8i21wD30yG259nyefzwFmttQKnC++v9i5hRgBj3M06FnyI4EYjUYLJHgLbtL
	 aruYR22UXNJDd6vJI1d2IGboyAFpUnsC9CcsjDOYdu9KXTRctMps+CfgP5tVNrMZjv
	 dsUm7/w74TuBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4092E81C40;
	Wed, 21 Oct 2026 20:34:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D32B73A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7421816FA
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRYhwOaqFEga for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F007981772
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::230"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614857;
 b=UnAf0+lloLy8g1Tsn2sxkpbP5g80SkdC+MjDFb1ZIR6xCPf96+xMeE+fbpalRJ/KIUSd
 hGG6eVJx9eB4tcUtaRUdEsUuT/AAPdyawk1q42frhjIC+fVa3HVO115ImLa+TUZfW/ZUq
 57pdrCgVAfcW/xj2I45G2VYMFaHa31VTe6ed8ZuEQBtTmPuZE4NhZh07OJKtegExm6+su
 siKNr9cTOWdKL2jBAbDMneTg0n72FsHzgnLn7pd5DI7p9HwxjOuaOF5oQySyBzq7jwNwA
 MZOce9R0QU5s0VvoFsnV6VqzoqqVOHxQIoIyA2xX0sLJXLHM7Euvw64QNiF0WFjeL7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614857;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Pm1dv8j7BG3XLjkmz2zXkhEwtV+uW0GjaCOzxEuER04=;
 b=jgBiIrPuj7FPtvwl367/OVQhEgiGU9ECZKcA3YMJpMAljtIjwdPtC8pNf7WYUt8xbIm/
 4thKn/jktHnW/oRepv1U5DQmxWKp4LZxQQXc84bmkVB5bpWyvvpzjwxO/RoyHuPYoiPMm
 wlKX/xZkkbXrjNQaO0Sq7lt563VdtoZB+UkjhRi/zUDhIoopFGPlnjX9UyG80g3RucO6j
 jey9WdGx5Yd3Dz2/M2xMf51f+Mt0fvLW7id3Dy1R7Qoi6V9EWGZJr0G3NDNoEeBXR0pMk
 dK2gR+n7YSIgBBgfMlRNCi2Q55e1+A6RsIYupMemqYnrJ8jbCQhS1Vw01Y0T5jo8jvA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=SHDUdOat; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::230"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SHDUdOat
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F007981772
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:16 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-4af81963f35so729839b6e.0
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614856; x=1793219656; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Pm1dv8j7BG3XLjkmz2zXkhEwtV+uW0GjaCOzxEuER04=;
 b=SHDUdOatoiyGU0fWlINW7ukpam/FajLhw3b+G7+C2jS+WNAFJQpbmm0Avbs8J1ufcI
 5JeuPiNTAMExHrDsp83DgjKqFiGhq88cMqy5PCXnBN0mW7KaoJsvVLZLeXmeBkCACJD+
 9ZiCjEnd7hPHPBsa0NS/jgqhqnNXHS+km6Dj2/n+pZwP0RvtPdNpe25DxlZ+OcH+0wNM
 qpR8VrjomRWzKDrKiJLdWAaIidVIcoFMCb3WP1YXRtAdmUHDI3oWIDGLYQmfXgCqsN6L
 pb97Uj7u2yQtnpXQLmGKeIc/pg/V1bANxf40kkP38sPtv1u58tcz6GT/mEyuv8NPtMgR
 WTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614856; x=1793219656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Pm1dv8j7BG3XLjkmz2zXkhEwtV+uW0GjaCOzxEuER04=;
 b=NqNg3MQab7J5gncETsIqTHo+ZFhNgCT3qn67cI7U7U0lXzvX7wr3VL62IqHnZyD5te
 Peun335JGAmeQwfHCkLWdPXjFcJaPRmNSzL7UakjavbNN+7JT6r7v98OAe/4BZ+xKDCB
 grTi9/c2Q8VSaQKj85ok8qKkunANZP+37e9yfldWI5v1DKCLxzfP1IytG26tr1BUogoB
 rq0uv6VIIwLfqzGpRZ5K38AXCkt0rT46X38l+vx8b0sotBJwJE3gY6Lo3P0IyYcZB4hr
 J5WuMwUl7UvvTqTC2GxLG+A10mTVjqIVCIqG+uI9ovjcqWpcU2jdQDCdPz4iUGWdIUWX
 m42Q==
X-Gm-Message-State: AFq9FYI1bYOcbRjdUUNUomgu1aArBfy2s9PpY86a0WFPopyAD4Dm0sac
 JzjeDCmyy33Pwvoo0I4e/wnnWdIZz+bT5tfTG/r7wBbqh6d5Ncbz8E4km6YQBA==
X-Gm-Gg: AYBFou0Yw0zC8B1vsjUm8hoxLqOPOJ0ovKy5jHydUmD8HJ+PJD3D1wBTGMBJyOeQI6m
 grrKc7kO52DIIfEOSJjWpKHUX5j00uw2aRSLblMMJQL9xcX18p9V2VG0wEqDV7scBJ9v1ymO3ng
 q27AF4xNCJ+8I/2j4GNxWtx/NJKkeZ1hJcyWVn64dk5HFiXEUuwEEyRjX9FJCqLj5E5RFS4of2D
 CTG+YFga1ZhLFdng2ayRoCBVH4OH90XOENCIhttWWfpFf9w81RC1USMArpEuq/sQ3Om5jR+hrRQ
 s5x6CdGb+rGe7Fgn9lIuIGjBgydF/f+TthQN88baijdLa8uHE0iiSbh5AD6zEIPlhvLtTjQhEav
 UZzqgv/O/ZklvIga2M5iAYESwJMPIQlZFj9WDHQG477uosKcUyMJaY4xVSk9cLSe69T0fbF5Iip
 ECwhIzd9eazvTPNHQWlp/Stm7xNx7G4Wksa7kzW9Rc83TWDkGTVqjT4shDkET/3/XvtD7tZIPo2
 jhLGSDWOfvjvYZB6Htt/FkIbrfC+awriq1GAp+wRHyYsR6ra3TSAR3Mkfh9Pid0Ss80BvUeHVy3
 1LmQ6YPYsbxqofxRbIxKGS51xvSekfFJMksV6bIwEk8HJtzYObe+hTAAj18wtWAwGli0kO+ILMe
 E0lFtrcy0MP0HEvcTyQ/MbQttAAJ/qBO9rdtZZ5RtSkQT7aMur5Ail3Bt+FmIKYNH9/Z5pjM/0l
 ufXz1DnRnNzBh8xjqrDYIetjK2
X-Received: by 2002:a05:6808:4f1f:b0:4f6:4b04:4b3c with SMTP id
 5614622812f47-5535d4dbcb1mr2416377b6e.40.1792614855731; 
 Wed, 21 Oct 2026 13:34:15 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:33:58 -0600
Message-ID: <20261021203410.3114473-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 04/16] package/python-jaraco-functools: add
 host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable a host variant for host-python-jaraco-text. Include more-itertools
as a runtime dependency in addition to the build dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-jaraco-functools/python-jaraco-functools.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index 2e144f0191..62f9e1945e 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -13,5 +13,10 @@ PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
 PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = \
 	host-python-coherent-licensed \
 	host-python-setuptools-scm
+HOST_PYTHON_JARACO_FUNCTOOLS_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-more-itertools \
+	host-python-setuptools-scm
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
