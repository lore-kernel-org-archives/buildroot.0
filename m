Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DC6606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 18:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=leDlqIDE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gQSjxIQL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC9180EDC;
	Sat, 31 Oct 2026 18:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfDKMMqhmlj2; Sat, 31 Oct 2026 18:06:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 322C180E01
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793469997;
	b=DMBe4S2gS46ToJQR/E3cQNMmvNAIGIxNoWqe46+PlSqxFQcDYj0GC4RXWEVwfKp4JIzq
	 rfIPDsBCEZiJJRR+lzXzDMpmShsc1334sMPmI6ol+4V21w5LuRlW2yrptH77YgTvOMkjI
	 /X1S+WpbQB7VArDZpY3LuiiDcNCvHAUsGI7815YSl4S0QLZ6nAXhkzrzlWyapMzaLJBbN
	 IO6h4+WgAoWrcSTQM36VxwsVhXHluypWfCSgTRrSDbZE/cOb2INpLS5EG0tnFJl1+0nMB
	 AileLw0Uqi9Vx1BwdiL8ZJGek1IxEh2OvrNUCdpQE2sVHMjhyv4uuOXsJV6Gzd6WV9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793469997;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=swcAc2gq9uvnvedrxpJSKLnLhrvY660TbPUJuQxc9PU=;
	b=sizlpKV2YX9+whSqWKubhQ9sEsoBC8lereBvhf+8ORvihbsgioKAgfajK649hHme7WV4
	 PqKcZ+m7zON1uXktrs+Tl5gjx8QYj8QB2Pn6XMz49HI2TdAxrbfmpTvmUZZi/x0NfyqXw
	 87x4BB13w16oz3nTjgPyv9KWEDux2PNie9Lr7ksBr4KIGMdkZFzYMSCr9QvILFt7S9Qtf
	 dFNWmt5ojRzqgxNhPQBRItXvsFn7GUw5zvqDE0YdUxojk+8np4ncXna6VxWpi90B8hPhs
	 taMGfOmwTAA03zAar64SP8aUA0RJVcZW0ZFYHdXKdMQ8jGxxLhB7Ycj/JfOh4TOGYrw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793469997;
	bh=swcAc2gq9uvnvedrxpJSKLnLhrvY660TbPUJuQxc9PU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=leDlqIDE1e8RN5LngU1oBbzzE2zGxAfkGl7gSKFjh7GgC3Dr6joDQ6FHK6TxQBweM
	 R6Rmgavic2E4I6LRMScikFfnmdEJxQxImHqFKRJAr5j8ohZ9O/OtJPYrcGZj8VKooY
	 OpN3F1nLweII3sq8GP84/qtWkA855Gxi2u6uiToFOe8fM13N05co4qD7ApiQ/ZOI9g
	 Opsf6Nk5EZpOgBGly9YD+9yLvtG+oMCnOyjwWpwft/ZMJdx9uf/DAnnvn84CMvPfE5
	 vCyEJ8+SOTSJnNv0n8uJfKMD576OdP5fZ/iGu4GYaLhuDr7QXfmnAFechQ0M5TT9z6
	 TXMszNMq4w/KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 322C180E01;
	Sat, 31 Oct 2026 18:06:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B42B7156
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9381160640
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xst3TOVzGwDM for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 18:06:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 996A06061B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793469992;
 b=Qj2SNs/vv2scK+xXZyrIz8HqKv9GCA2VyWWIQZslns8Hlt2RCgaOrVqACFpu7u0ArV90
 w91jyqylx1MzFAHO+VonCO9ceCtQ8XOwu/nPR3oOOgBd8oMSFsehEjVIePzQ//ziFNc3p
 ibTmGuOWzz4LHHL2iWOZmNHdaxW4LGG0ZT0whXR+fxUMzmHZCcA3O1UuF/7983Z4IKWqp
 JO9pRKn+lWsL3a4CM73Hlu6fww8foio1yJvFLKEHyEa187TNss9NMpSJzeahW+0yWxqnL
 fexflkkoNIaQNgw/KxDoAiTNZOKAn15tj/483DbWDR9kkWSJppJiMr7LdvevfdXGKAw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793469992;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=YlUxFzRYVxGMuSTYQpvn+CMZ6adMoDPUCJZvNHB0Ylw=;
 b=kn56ipRwwGyUlA+zxgjIu9MPLPn2nA3kSOYT200HG91ZRWZJLWWX0flseWCuXmoj5JV9
 R3Jp2UsslCBFpiziV10vOKsTqXMT0xlipl+YomQxVQQZEmqshZdEODg6iLIRXpBecEvtw
 2sGiNEKuWj/Rp0fqixdohKqPn75QlMJ/IP6bZQFvHH28eVK7t+QxZC78Jku1fB5q2g78e
 WtdbqigtEZ2FtKidN6nfWg5Bio6es+kiSKD3xUI3Mn+y2wdQwRrBejZdrFDa2p6AQrrM1
 gpalEVr4Cl512O2FiV1MXgSa+5d5/yZHWPsjMKd+ZmNxU3s9XGrozJqrnEaHiH3oWbA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=gQSjxIQL; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=gQSjxIQL
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 996A06061B
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 18:06:32 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-8256106635eso788839a34.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 11:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793469991; x=1794074791; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YlUxFzRYVxGMuSTYQpvn+CMZ6adMoDPUCJZvNHB0Ylw=;
 b=gQSjxIQLY8bVtDqDv6YlObrR3mYy18Rdx57e7gzlcixRr4FLByGDZjSdaKtQ8hiJJT
 vI8HBn/DQpnUNZTKBCWg6ltP34Z7Ol7gqU50rRrrfVqe7jzm05ooigssoF12UdYsBhHL
 e6UIVqxIQMiLidzAYr42uQRHjc5CCL3o8GjvzkcpRMKhzABErWzyC2UZUx63EH0tGLOz
 y/Qr8OIZdTuqnWNnjdxakeTF8x/UpMsTKGZCwskBiw9g1G7+6tSzDjt896Qqxfn3qMJ3
 JdTZvHT4/z4x41oSB5MZ2xa2dVLQLKKBZs3YTpNUT5qQiDHyjpvlEoBpBkm+L39fkWu0
 K8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793469991; x=1794074791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YlUxFzRYVxGMuSTYQpvn+CMZ6adMoDPUCJZvNHB0Ylw=;
 b=otx5nx6roZjB4ZtkVRdR7Vfg4wubMoXu8P14Do6ATDwtioVlSz2AzCyc1cGKLTyWa6
 lwA+jk4QIYeQpynvw3WerqwYpfOVl1Li0PZN3r8OTy8HPhWTo3TkjAIlB7I27EJ13Xmn
 2cWZ2rtRPFrfCX63ogy3oFAj+TshK4k/Q4YJWIrUhAxJdQDz3jgj5sP43OxyM+aHz+If
 zFpQ87t/SSGv0+87jIfVFjSeD+SqAOT5XVPYgdwL7RFv/+z/uqKerEONIE+uCD6r6SFK
 yxrRpI/2xY+IxveVecDZulSp0ehsjFmb9TbnzOe6Z7hlVzFG45xk5826KHVYNr0iveh7
 vJ9A==
X-Gm-Message-State: AFq9FYIkHoMmcPAG5gra4p8UtMJ0lyItNtFTTDZvyms/3TWcfitI85VO
 iY8pm+FR3miAVud+1mJADfJKcRstT5FPolNZyHHdsfBW7KKTOlVLY4+JDDzRog==
X-Gm-Gg: AYBFou0WI0u5T/kfV14gAzK7mazLsUBM/VNo5sQeA1n5Dyt0DRdJuAB/0fRSLp3EqkC
 4BU4UvrT9uUxVlqDFEyx7ujsV+0FeTrCobL3/UgZaFEPLoNXjcRvM5AoR2QQ96MB5k2cYC9opfj
 nvLiY1Ic8PpIfXP0hg+UBGqjdAUodPOWdFFy63LXatdUKNWQTM+ACJhiH7OTrZveOpKOHeBcTtW
 27eJXLmEblcjlZfTk15x1NmOAatkIiI+oFGVX2thcMONUqdR/vrloEjphk5Oe80AhlxduwTsP+4
 LuL2j/RlIvK52mcHu6FRgPB+ekAslDspWN2e+WqiBZLdHRlT+oJyFhPkF6EMuIHN1ndJyuF1pMR
 BuPkCxPprY/4keliGxA6rTToOX3g++1Wh0B2BbdgxkZtAHdOBYsJvpJ0PeZJLKRr2qxIknfSozF
 1j7LZbPv8xFbWracODw4LpCKklxYNz8EOzZ51TxOnkayjbFx9I4MLanlY+BN8l2slhKCZDBJpiD
 wRN5IFpml2kJlIBnevxfeSN9P8xyIWFE7ny/C0ZbaxE87cGQ/Z/g3pcd0GMMX5ZIv8vE5Gb1GrD
 01+0xaqkp6FVhRXm7/4fl6LwASqoIeA060t7VjL+e8ZOer85JYm6wFMRewftsMHooSTOwWonhh6
 M1w/G9/PtFLcu83WXKjwTCGqD0Np4Aj7+ujt2CB5+gZz+WfzeOOuvAZ0iGpg7FjxEfPLIjzPo9U
 Nnj1B+DhoF/1xCQIpTUj9lOJEFL619p4HvytuiRJlPicyK4bGNTk/k1f9/mgrB1jhfWd/htNGzJ
 9bfQO6NkxD5ZQQHLdQoJw==
X-Received: by 2002:a05:6808:23d0:b0:4d6:90d4:6bc with SMTP id
 5614622812f47-5640ddae7b2mr4214236b6e.46.1793469991180; 
 Sat, 31 Oct 2026 11:06:31 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5640fdd2fb7sm4407759b6e.10.2026.10.31.11.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 11:06:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 12:06:25 -0600
Message-ID: <20261031180625.2738332-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261031180625.2738332-1-james.hilliard1@gmail.com>
References: <20261031180625.2738332-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-boto3: bump to version
 1.43.123
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 61960a619f..6c79ec9e4b 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  d4ef8a8162f55f930817bd9496801491  boto3-1.43.118.tar.gz
-sha256  c0620f799e0f0c222ba42c337b65cdbcd3da38a3121187f634d8926cbbb28a9c  boto3-1.43.118.tar.gz
+md5  7d86080792fe50286be0312f32c26305  boto3-1.43.123.tar.gz
+sha256  055fabb990c5d2f31fce4ca569255bd640cdd11a3ca68c9ecad35f4f8a5b83b5  boto3-1.43.123.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 36ba647d2a..f4ff81d9e2 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.43.118
+PYTHON_BOTO3_VERSION = 1.43.123
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/96/8b/5694c8433b5202f34a82def4edee274f7df1eba2919c66d9d389d2202ec8
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/fc/8a/64b46f075149f9160da44aa7e1052dd18431b9ad4435beb0cfb02cc48624
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
