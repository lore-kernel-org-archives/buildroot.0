Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57A6606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 14:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y6kz4JEe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gy37Pbme
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A93B180F88;
	Thu, 29 Oct 2026 14:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QivZKBanLJ8q; Thu, 29 Oct 2026 14:44:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B1D5880F4A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793285069;
	b=OJCUlIhe0qss/VWJ7+GaOjecrIwelFYlNAizUwzPfoFQpZLBoeYPNt049j0Jpi9osJYz
	 K996E0KXBhJnCO/zr0eGsFAuvqB4n2p97GuzS/095zVobSxIz87yrLhIoIDjU7xTKdY6R
	 VvMp3xVOo/rGyrcMuuUpYH3ZfX/ZpQFylCJLNoiYIeW3UGy1aoMJdpQiEhZli4GGIADUl
	 g/Ggvh0J8FvwMDdh5jv1O8zqqkIGrhLU2L0KbbFTWiwQ/EN1ZnqvR7GmPjKu1+sk1vCKD
	 9GWKFqBae3u+d+HQU6LaCOKh2uIf85au1QhnxLBmCJ3pbxZNt0Tg5fdmPZhzWHYUXdw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793285069;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=J24F8qRUW9QF0Vw/wVrr/2PZzzQ6ykqLbO9t4afmTbU=;
	b=MaR7sTa+56eSCX1osxq4zyLHPE1vmRWAyspdTgx95coqVj3ULW41lzwV15oFCIYRlAH2
	 cG5724Rd0aVMeItopvbRi1k9sVuNXWVsjvNg6EL8nzeOxaUaUMsnvIa1D9SrzmwVLfmNw
	 EBej5whxTpjfqGk+p6lXxdZhg+bLzl/n/xmGCIvXV+aG29rfponf5+jQOxFzvXckVWt64
	 76bOIvMglnu43iRM4CaPx7Equ8ojYieDm9cMU6Q4YaFywWZIhq3TwUd6IVyLFoS0JPoK+
	 I6aNJGx/Jx+5kZOOqsjWe+wtsKHjD6zM7xomZud+SI2/0pnppSpOkSIXNpMCsKPv0YQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793285069;
	bh=J24F8qRUW9QF0Vw/wVrr/2PZzzQ6ykqLbO9t4afmTbU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y6kz4JEejrbvkT7sH6UYBh1GWWHnvbd4I8pyBewYHJua8lLiVJOpe1Ae0JkDVWu4H
	 A2nPG3AR1+5CLYhhC0TNgSVKmJdTH8dQ13zsTdwXxO5oIYvp4f+JEceAMWLPdvP/7y
	 +LP8cpAbhXvD1yMk5Uyu+24fquE0xob1Y6b8Obr9exB148AOh5DdzUssajUIzJdzgT
	 DseW16dQ/ZMZ6zHwlelH/TcS4vI0lho1Pdjn5WOOQ4ob5i6GdXlhFN+zzWRtrNZAIn
	 N78weHaEAHpSGEbWP+O4v/pEWKvgqNtX2Vhz4wRBeExAfrh9eghQECB+9jYA6bAlcY
	 y94uJS/I+QaOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D5880F4A;
	Thu, 29 Oct 2026 14:44:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 774692FE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D720606EC
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQkpih2Zsphj for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 14:44:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 49768606C6
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793285065;
 b=LRfEU2+VHzsCrmzT1cfzME4cdtZSgpsXoanwCKhQXifyHIy+GI8a1aGdn4pkBZODA6sq
 Q+4rnecpriWRS65Ks+87tLBy1HYk1UY6145pOJ87iHLnJ+jWc/S1/tWokIyNQMTzp74ej
 vqe6581ijWot48UwuB5Aml4LKd+oK2FZkYovckj1AymCIIsW9M1dT5zE2aaPKdNkg8UlT
 PaiggLdNOgtow4RUQy6128io/EKJSpzfZFRSoJqNPjh5MZbTyG7EOs5CfqmdD82ElFT4h
 RxMhudHoucG3pp5w+azNCl6otd0S9mvJ5/8PYgRC6E7g8NOjTrJIG6Qmp5eQ3hlcWlw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793285065;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=G5hw4Z2Zz6CgrxljvaF0i1FxJNopW9WXwQNr29wULUs=;
 b=bkHZm+DgSP7gA53brzCz5Tb0T7PAb18jrl1OLvZoRqRyYF6uRBjYZRQNDG5ZZegj36mW
 caxD4FiyqCzLHXUQdxhzDEwYVgM9I7J1u9IKwpOvxKXDWsE/wxNSNx3GcWoGk+4K/z87k
 3j4cFc3cYfMmnih8GmXyTO42XKyk8RtM4fxPFWA1rUN7kHQCdB5pbqT4b/51Dt2JjZOVF
 nUeBGAWlWPk6vDT6VV/JfKNfnzaPH704eIMFM0Sm9YNWUqyBhOzMQVhtFV5QgHmN7yuRV
 QJ6oQtcgbuMMn4VE3AhpdDFqfi6kX2QpQh1seF4dKzISmokwt3H21U3S1hgFCpxUtow==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=Gy37Pbme; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Gy37Pbme
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49768606C6
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:44:24 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so19968625e9.2
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 07:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793285062; x=1793889862; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G5hw4Z2Zz6CgrxljvaF0i1FxJNopW9WXwQNr29wULUs=;
 b=Gy37Pbmev7HqYBUl8G80NSMHMz9F8vpHIv9hlP0g77Iqhj0SVrafU9XmCND9OoQsLd
 GqLLnfdAXdYeBsesy1mFMsYOVM1M9KwQci8MwsRjeBYBCjAV3qNB7NVNODqdHqYPmuQ+
 pfiNWSp0F5yhpv+0dt+fzajn8nVPhZ8sTsC6AFcgn9OAlrKftF2HQXZHPbHnXszbyuIB
 6gmCVDGr1Xj5auQyt7eK9Q0jtlP9ATZ8kr9bruOsf7TJ5EI/ZEswK6j8frSAO7+HE7wz
 dKYTvUTMZ+5O1q3ErwT7XUUdCipSshgQ8GUgMBCsSJUQv2zs3z6LdtCKPSSOfZOxfiQd
 anXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793285062; x=1793889862;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=G5hw4Z2Zz6CgrxljvaF0i1FxJNopW9WXwQNr29wULUs=;
 b=wknGsCtU/RpucYKVMqufSPSV0RtFyvXzls6ZBTbEW2fMo1CiTvpROSiJ39KFx0aHDZ
 qMzIAk5RqdnhhTWpBOs7SyKbQtZIlKB4MGLhUSaT5iYlCu5FGy9bh52++3PVp/Ev68mI
 POjwWl79RL0Z1oxtSCGLPRf8urcoIlFFnFg1k+ws4OHRebHuQw/22ZhGS0Y+CIFNisPW
 3jpcjG6cJ51dmBcnLqVCvVTXRTIgcU7jqtO5kqzMsoPhI2J4oig4aO9D74lq0QNINcFD
 ch+sd0g0B+ph9sq/bu12UHtqj/aowXc+jwMN7XR1gicUA4KbBRe7K79DWDjERTZLk1de
 89pw==
X-Gm-Message-State: AFq9FYKo7B4+IGtkQzFzTa5sFCISXvR68V5KoQA4uN7SABZWG+H6U4KH
 HDDAWhvtlHGJqO57RotfNXoy0BJ3iGt4xoJVTFz04OO8j1sdZz1Gw6ng/v9r0w==
X-Gm-Gg: AYBFou1pDqSNUmyEVuiuS0pg3MWjAtf2jQnamX/XA/3yQsgvMyAuWfotfBrXIqwNGrS
 YcvIg7WwkYd3nDryMZex6Ptco2dBHr+wslxTcx7Q/BVsz3qxdOa0vA8xWIzfwnDthzkeMZlJHup
 hNcL11ThK4F8liZNOLjLH6sNh9DuEpPgLz4tA5SjZU9H8/NIO7W8QLk0OE80mZgpDHs4pyTTjpW
 mO5b9VEWOfEgD2i0fX/+eqb588PLQvM0gJ6d3mLFkippK0ALjdoQsgbSMIGLysi7o785Ggd+1PI
 HfWwRt7x1k5+l2/mEiuAnnfV7fOqEbAJO8bYOsvL86rG6CaiOSwSgE70qJ6DcgSZkBZAh6iybzM
 zH0a7r6iVpDi/R4PRlPCKH8ZZ4B+5I/brS6JxOyr91/wHVofe71ofERj+tyFeKujRP59Awrpc8s
 0kPd0cb8er0JiFIQSQDv8CwPHBuCnedTXUwiPxdOahZldz528Y8s4gSRsNNnbBWLcDptWknF6GU
 xPgq2oIbKY+GQ8o9iP+jFb9lEHR7DVUxrcCEqn1EtkksmFnqzhWQGkRfAiitT80IPD4BEpguP9M
 fKZMd4LHt0AAWy5hyxKwqPEsWPVkBfhkMtxFfbdgo7b4ZiSa0yDwCQ==
X-Received: by 2002:a05:600c:1913:b0:4a2:150f:1607 with SMTP id
 5b1f17b1804b1-4a966586d7fmr121478855e9.13.1793285062006; 
 Thu, 29 Oct 2026 07:44:22 -0700 (PDT)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3eb8f387sm34699011f8f.4.2026.10.29.07.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 07:44:21 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 29 Oct 2026 15:43:56 +0100
Message-Id: <20261029144400.2972217-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
References: <20261029144400.2972217-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/9] website: bump jQuery to version 4.0.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jQuery 3.1.1 is affected by several known vulnerabilities, bump it to
the latest version.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 docs/website/footer.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/footer.html b/docs/website/footer.html
index 44ef5db17e..d9f4f75196 100644
--- a/docs/website/footer.html
+++ b/docs/website/footer.html
@@ -1,4 +1,4 @@
-	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
+	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/4.0.0/jquery.min.js" integrity="sha512-8LENNbXmzI/Gbj+OwXmqR6V4QaUAw0/porPzy1+dQoJqC0JPHedWoe0DDOTL2uHA5XXJyIsPtiMHH86pVlay6A==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.8/js/bootstrap.bundle.min.js" integrity="sha512-HvOjJrdwNpDbkGJIG2ZNqDlVqMo77qbs4Me4cah0HoDrfhrbA+8SBlZn1KrvAQw7cILLPFJvdwIgphzQmMm+Pw==" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js" integrity="sha256-Daf8GuI2eLKHJlOWLRR/zRy9Clqcj4TUSumbxYH9kGI=" crossorigin="anonymous"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js" integrity="sha256-RbFvov4fXA9DW/RzOAcIC0ZHIDmghGdsoug5slJHMMI=" crossorigin="anonymous"></script>
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
