Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760F1606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T8qQnsJV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bwu92D4L
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F9A98204C;
	Wed, 21 Oct 2026 20:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4v21lAkbe9Ma; Wed, 21 Oct 2026 20:34:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 30FD682042
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792614877;
	b=T8qyfnqHF2YBcY0IxTkImbXzHXK/Wyj8oAYbSjyDS3cUBF7EDHWQkIeW14Fh2RsaHsWz
	 cmPERekdgrkgK5LADpaqm47MQX+8r/S4+5UcmSRaHxzLV3GmiPp8MLN6AQtax//I672z4
	 DrdwFftqaetADPXmT38bwbZhGDZY//y/mzsiQIhOApY8mGEOIT86E/9WVUThZamYubfZs
	 H9N8vllE7hGVkDsPM4c6e065IR/75nPrUVxCyIALxJkRTMmEMWExY5b3bxBvGXaUS2OaR
	 w04AC3G96UDrY82u41Pq9nP+DrmZM2jszdAZmXOPm+4UkX/YB6KSRr863EzYtDQ5/7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792614877;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=V7xcq9iK6/8s1JYf29vFItUaZhXKeisc/83HW++vD8k=;
	b=fUdpT4tdgf5rJKSpRjkWOt+Tv2MajVDcPPhP3z1gwfNIUCSamZWIaH+cRMkRvtekHl3g
	 9/bQKvfyaZRpdgyLECyuyyMFyT7y0/8gbC5CjpVHAbo49QZVRXWUrYMMDEssXDw+l8T74
	 n9BcsOvmrqvPTBUEd/j9XpLpUOKRN5dBoB4xBmRdZaJBH493trs0ME1b9C5ne/U4vSvbR
	 l5/ppBSQ34eK528KSGTTJh5Q7JIY8a0mDw8v2urcF+Grq/RTYJlL5vTmcziB1ssotMJ/f
	 0Akdt9JUMtHdDp+7mg8ZrUMUt9zu+5YtXO9rH6Atxl4GAn3fgEwdl8VjtsNV50DAt7g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792614877;
	bh=V7xcq9iK6/8s1JYf29vFItUaZhXKeisc/83HW++vD8k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T8qQnsJVUxjdLsGzII9E06PRV/H9QtjmzzlnslI1ZluMX3zM1GqZGuljPm50fLhdI
	 I3K9UIU05gENEUUoWofW3wXYgIPjR+xm9ftvnNLBRxMoT7KQRLQdOUXmlI/pALdM4x
	 9Mq7s99wqiKd33IFoRmOqHoC9rsEKizvk5gUiXu9sUTwI1RD8TVqRv5+AfuuJ1JOfo
	 CJ+VpchYkoKYIW2fGSdHcVszPFlvUfFZAIokPUN6x4CTFfKYBRlaaiCHNk+ykyitMP
	 babyP4Yj0LZTMDyS/ZblLR/koeneNZ/AeWYdV9fd8uDIfSKabQmS+M+JkECYn4tAQm
	 v2hFB6yXB2/EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30FD682042;
	Wed, 21 Oct 2026 20:34:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9FFF769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC25F4018E
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOLbu6d_Z_2q for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:34:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 32B6C40042
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792614865;
 b=bjgjeeDdbNVwZ5CG/UkaMrHx8WmdKbL12+2YQVaiAWRalwpRCv7CEm7GOvilu1JzR9t+
 HfeM9L5VtfWh0I+U+VVSVIGuUYqSsGMxbjWC7fbrQeisjz+AYrtc60/hR3/rUPpTRAVL+
 a3vtCT0/+uGI3fYIyIA3bNYNVKo33PPEHe8bEjYTjQMNHBgB59F8rQ/TU2k3GdWO1pgs7
 90+OgPe3J7GJpbOpAQ8PvOTY3fwOJfA4O8QX0+ykUqxfFEQJiDrdSyykPGA47WWyxBu3J
 KDFrSSSZCklZTQ8G6atkl2udnX74zBblGgVy8hqJandclBW8u1dAi+ME43d1eudV4fA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792614865;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=o94Ob7yednq4HUhYGeoAx2+87AqCdZlCSkTOnvXg31w=;
 b=YKHhpBp4murVD92q8UUgh0zas84csREI5xRK5Nq5iccrsLBCOWdZMWme9kb8JxItTHCT
 JVFT+tRMAGi0AADlkUyhVu79hZED7tRJqslSS2ZEM9A49iCSONDXEpXnCwbpG0bWw1NT+
 Guxky6+nG8kgopT34buy1QQvGSYaG115uNC7cPiuxsxIeD7vvBG7z2R0vF8zJ32qbYqWf
 EI4cn0qKHc13Yq9wtFv2b2Zy0ZHCFSuBJnafO6LccI7WHcWKtjFXcJGXNYZrwNPhlMmxU
 49qEMYSKIrSmQJe1cn4HhHUuvY9qJhN4ffWUbqyXqQJNZ7sTdt0BtKT6mBmm/HLcVwA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Bwu92D4L; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Bwu92D4L
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32B6C40042
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:34:24 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7fccba9c675so260259a34.0
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 13:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792614864; x=1793219664; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=o94Ob7yednq4HUhYGeoAx2+87AqCdZlCSkTOnvXg31w=;
 b=Bwu92D4L9d7smx8SWWPWlnmvv4ZRzJth0FqkIfI8XxFf2Cu22yusBYUspnFIgp9Ps2
 n39hXSiH5dJwb/1HYzFhNHv+K7GUCWVRG9GAhJ5I+Ro95JDH8gPfGvpo03zkQzF8G8Xw
 Ck7U1UzfTZGNewAS/sOZnCEpk9NgNYzgB2s0A6itIhKQUEK0kcPjlkVIZPD8Tp/7NwRS
 s3gQtHk22kidnE0wvrPVc1b4oPS6vOl35KQZxnuS6inl/PzLLgyTgy1u75Yv+kEmoUqi
 Mq4IcJ+wYii1MvwJU70B9nYbtSDhdocEefg3dBUFe5DK5MypjXAG6EH3zy9LonkITJO+
 GjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792614864; x=1793219664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=o94Ob7yednq4HUhYGeoAx2+87AqCdZlCSkTOnvXg31w=;
 b=J/gUhXj34pCn16mkZi3R+z5VTf0yFmkAZoOPFQd3qQZvkw9ckv5B8jVK6kdnWy+DT/
 hFK0GrcRAyMqNeDc+Ujf5Zb8FaKpq8blFKXc702c7adLUvdS9qAprNQHNcPM1w0g/Fpe
 i2rIzIBF2TIZBMGGs1T3oaFA5ZyEP2H41VbugUVAZYgrYRYILVw6KA2yi2iB6sg+2EsO
 a5eimQF06zJ/ryXMuHlBrW4heJ2hHPyWhTlBEWlce0ABXpsdYwgOLxdruf2x6y3+EC4Q
 XqH69vR5in/zM/FX27E6nA1nK+ezHwKuUa6zMAM1tOKNv8xeqsiI3BRS6T66Qv2heDsE
 zaLQ==
X-Gm-Message-State: AFq9FYLtBzScALZ7OX18sd52LsKxrOzc3L9Fd3+XAHZ7w/+HTFkaw3pA
 3ji8OAGjdm8EkEPqwlluIUdeLdGIl1XQry//a5iSdXiK1ADdVRxmolrne2jn/A==
X-Gm-Gg: AYBFou2bBfAsa3ei5E0hcLPrSEs4Ko0Uvbpf/bLq7qvfWIZokNM50QN9HcAZTUyHmkZ
 v3F/TpEgF3pibrCW1Bmy1vKIt994jSj8+tmBAzn0J8LvYqACPxGYAgiFmJXEcyaJeUlaZQcyVcI
 oKRMJMcX84S8AuwY5Sr/iQwQwG3tNpkG4dVXgxsMHa1XnHCtUuKVPbDAKgU4vtr1C0e12zm7Osw
 d5L96J2kjw2XcC7e/3MMRYjRuMxgRJK8O5xhdBmqo0dSxtSEl0bitr+L0gL9APJaAEWa4xDDygF
 XyB+z2t8BYGHIUxAc7n15GzJGllcU4hJN5Iq9GKIhY+nYGAVggIohGTYybxrVp63sH5Smn6gtHx
 acqlnH3Q7l8sJqsM5YOAR6/0Ro+JsAiodlc5iyjbXXUWIeewPXCnOgUA3stt6aL4fidWYziI7KK
 yPYNtZ3Ow5mMCWe4dbvjShG9Gz8Cu0CbmuKU5SBwAQ+QvJsg3/F7bARnI1i+ncjnGvB2lfnRW68
 +AVy78J5w/zErVIyNK2lxNGTPYkzeLjuHFAuPJI8zOWO4U8dVdXLzVn5sH40BXS18xOgxdg2RNe
 q+vRNBOBWXP21/GiWtnwT5sFVabJKiovnllPsj3VJrrRJHbJw0Ir5RP2EkrtDLmzwPMgiv2kmMv
 3O3hBVYScSGaqXXodrBwA+mohhCxFuSMFlGNDe6Q15C+wjsYr6TEiFZAPbu5kRzHEOhOhgl38Pd
 I+BCm8oBI2XrmSc6MQOrUSsAI=
X-Received: by 2002:a05:6808:4f0e:b0:521:561a:8e8c with SMTP id
 5614622812f47-557ed823508mr370785b6e.33.1792614863950; 
 Wed, 21 Oct 2026 13:34:23 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-552ac8e9463sm2647696b6e.2.2026.10.21.13.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 13:34:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 14:34:07 -0600
Message-ID: <20261021203410.3114473-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021203410.3114473-1-james.hilliard1@gmail.com>
References: <20261021203410.3114473-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 13/16] package/python-jaraco-text: add host
 variant
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable a host variant for the standalone pkg_resources package.
Include its runtime dependencies as well as coherent-licensed and
setuptools-scm, which are needed to build the package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes v2 -> v3:
  - Add host-python-coherent-licensed and replace host-python-autocommand
    with host-python-typer-slim to match jaraco.text 4.3.0 dependencies.
---
 package/python-jaraco-text/python-jaraco-text.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/python-jaraco-text/python-jaraco-text.mk b/package/python-jaraco-text/python-jaraco-text.mk
index e0868bc575..eaca4703f8 100644
--- a/package/python-jaraco-text/python-jaraco-text.mk
+++ b/package/python-jaraco-text/python-jaraco-text.mk
@@ -11,5 +11,13 @@ PYTHON_JARACO_TEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_TEXT_LICENSE = MIT
 PYTHON_JARACO_TEXT_LICENSE_FILES = LICENSE
 PYTHON_JARACO_TEXT_DEPENDENCIES = host-python-coherent-licensed host-python-setuptools-scm
+HOST_PYTHON_JARACO_TEXT_DEPENDENCIES = \
+	host-python-coherent-licensed \
+	host-python-jaraco-context \
+	host-python-jaraco-functools \
+	host-python-more-itertools \
+	host-python-setuptools-scm \
+	host-python-typer-slim
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
