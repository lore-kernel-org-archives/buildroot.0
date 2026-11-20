Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DFD606A325
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=saBEzsMv
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D73638167B;
	Fri, 20 Nov 2026 09:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I6w3xbJ2Y168; Fri, 20 Nov 2026 09:58:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 660AC81660
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168698;
	b=lEqiz8X51dUWVXHoBF6PgTGLMFNqHVkLLuwvIEmFTOLZDVUrdrN8pST1KlQIxTNEGEQD
	 yJ287SUWh2LAk5bRfq1ImjZ18ig2lfytRU7SfjmPlY61wTzjgfbhBNFRGg9U3X6tY+ACV
	 6xXu4Ry1BxQkcop9JXIYhgpF74RahXOoBvxPFrvzdaLLqwutRsq+Ma6TDmksXUUZB8zVa
	 IhcJMpWYyaBWy9ofzTmUyRSpuB3yJx5nZ9cWxbJv52xaJoPKfzR+9PPXpFSK8t+Jkq/H4
	 ey350vpWBMsdAcQSjhSl3eP9NJDSleT16p4OqA/Dsw6JEKFU4HxNzat/T0jPC7nt/Jg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168698;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6i+AMTd6CqAsa2Y2MtKirACOWxxAZ4cktmuZJp8wI8k=;
	b=BMNKE63+8jt3md7/BvcfC2J07OjKYm9jlUd/gfp5ucVmoRPawIhGoXpqBXSU0GfK/3ag
	 Q/rhQpTlNTYFCZ3F/wqWVRC3u0U8+wxzZucP6I3XbSR1P+HmoXpk85qXqOIza5puk3E7D
	 5bImRSO/t8yYZ1Kxj45yYPhswzyfIuy4zuOkS0tLIVp+jddEeVxY4AX1G6TOtFMsxbuvu
	 2VOLaf5GG62rcolbpR4CGOoM3d9iB5KIkWHyiIkJcxq6BWHpZ8TKT7tTEMllX01aXW25U
	 etJaXt27mnPFB2Gy54fkNo5cSPcswg5Ry95SEfCiBF4+FLzIfXhDC+PtcA7dhYPR2Lw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168698;
	bh=6i+AMTd6CqAsa2Y2MtKirACOWxxAZ4cktmuZJp8wI8k=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=saBEzsMvGuqn9a8jku7tzVRhwYAINw4AiEGQzBcG3CGCEkaYWDKzukIvLiUd0xCM5
	 xWu8g2GEcH/BBSu2vCmuOlS2jCq6MUS6fdUpjdHgdmd/E0sEH3KYovSleFvesHncV9
	 9Iplz/zC8oI7tYWgkigJitxCvCmAWaSviS8uym8UdpfmKEip+hRUGzo5sfmgCpUsN5
	 DOPuo5+ZrfMWYDshVkPk2r4GmLlmKIjfb9GUsmONPIHNe8LQCfvu0PFvaW+Nl1Cz2H
	 HzZ/yfIUUZQwHcqTTRgPjzNqLA72ZnhuD0TqDL+i52Z3jKv42Y7bL7E0niGQxvrgbC
	 lDZMVzfea7NCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 660AC81660;
	Fri, 20 Nov 2026 09:58:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 558B4169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 462F84020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQUynBQqoLG6 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:58:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B458340A37
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B458340A37
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:15 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-490d59c3edaso429474f8f.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:58:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168693; x=1795773493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pFS3ykBkLTwJbYyUv/PvMIGNuDOO+6Fhip56wsvJNcY=;
 b=W5XVmiDxELBsdRbZFXrw+WmrJcG4ewBeU+ai1990X95on1EtXvMjkCpMpRoc6D44GV
 DmE3KtqpdDnCugxr9a34TPtG7n41TQ1RiniSatO9HL+C3VL1lM+z1MEo6SEiPn0vsIl6
 gYE+pCWxpUyEPVTy5ktARma84FgL9RErlSBfJsfvQJDNhtRN2iS8ZeFnmZ1Jy1ZQWIy3
 ROVuiDFqkFPAlvR7GS5fE+4EtXwVN2W3a85OFLKSxWGTLCW6wkckJOWsMJ8XCr6e3FUz
 UNbgCXsrrX/rYV22yA7v5Wi07ya+m6y9QGdikwjo0x0qas1LRvqF7P3oZYxRcNMWH0Iv
 lE+g==
X-Gm-Message-State: APuU4Z/XYbbzTw8+XbUhRelcWsevvia6Y/m1ocKiOD4e1AO2TiYF1jKu
 FLPcFijocLn8EhEaM0qBmDKcJ0CmkXmUBGTMjbuFRhwQLjMLq5QD/++SVrdhJ2tvi3eE8vZellY
 O3gbQpAoa4w==
X-Gm-Gg: AZFdTZc36tm574T29nKowNySvxBFfvlB0eS+D7+74kxtbOvgjXJ6bhO85ULsrh/lKEj
 bSs9Ii1IkMHmT+0oH6lvWmgxaMwC4TFxtdqSGsIiRqkETPs676R7gppU0eTxxj/ox9XNPK0G5R1
 sUr9hkmwWR3GI8+qxwkwwgVSH9uhb69b2FJLW0xzTdxGFKCLXlojjM7YX6ObFZWKkua8LLGQL9r
 2EAq2o9mMY1oOtYkeLAUaL7Ft7jT+G3P2GJ83dAu1CEzpvbTZGWigV83brg+554vimqDOB/Ky95
 pT8HY7Qa2tp+8uHQS3XFElBLJXh4v1bBD9vPuVcn9WquPqv7PL6qlRrY+cH1Bse0GQ7bOkm5C/d
 Ja6EtTFAuLYlqbnZKTiAEy+peOCNrmez6WzgAmDjKi9w1iIsobx6Hvq3pthTdYCa5pfOrxEEtB5
 UCoVguDZejIWudEBx2Mf/E8aeTc+VDQl+2U3HAkPYHQQgLA25t1qcpFcwsCdH3XcBu9bIkpEigX
 RvWOjpkOBXeUHOSNagoga0Uv8ipacsezpYQvulBEBIk5Y8X9wdF6Y5OLX4q7buLzdpuAvfr42rZ
 2/2orUpYw0i+E5pEyerKor3aafCqnHfvKggOAAOhO70t
X-Received: by 2002:a05:6000:26ca:b0:4a9:faef:7aae with SMTP id
 ffacd0b85a97d-4abafd02fdcmr4974429f8f.5.1795168693306; 
 Fri, 20 Nov 2026 01:58:13 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf61ddsm4228333f8f.12.2026.11.20.01.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:58:12 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:58:08 +0100
Message-ID: <20261120095812.537239-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107082106.27343-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: bump version to 2.4.70
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://downloads.apache.org/httpd/CHANGES_2.4.70
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/apache/apache.hash | 6 +++---
>  package/apache/apache.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/apache/apache.hash b/package/apache/apache.hash
> index 453a22b965..1de97a5873 100644
> --- a/package/apache/apache.hash
> +++ b/package/apache/apache.hash
> @@ -1,5 +1,5 @@
> -# From https://archive.apache.org/dist/httpd/httpd-2.4.69.tar.bz2.{sha256,sha512}
> -sha256  c5e6ebc66e349b87d7fc6916ae7cc2a808ed348003de134cf9e9d89d3e2cc73d  httpd-2.4.69.tar.bz2
> -sha512  ca9c5808eef7a0d8d88148b0d2d6045b5a0151823f09afc786b283cef9990036a9c7bc53d043e2f67b6ec06db05f655aa961cb875fa7ad0911fa04fdd295bd93  httpd-2.4.69.tar.bz2
> +# From https://archive.apache.org/dist/httpd/httpd-2.4.70.tar.bz2.{sha256,sha512}
> +sha256  1eefd7dc95836c5872894ce8e6a37f773d5a6764f0766869d39b8bcf0b1bafc3  httpd-2.4.70.tar.bz2
> +sha512  bcbbda8fba5a3e59d6a8b88551d401ff62f2df6bfbb5f6cfac9479ac1aa14a433d490a09e21ad164502a30bd747b43e67c7e43df4412f5dc40e1723a35e3398d  httpd-2.4.70.tar.bz2
>  # Locally computed
>  sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 04400d5e4a..cee02f8d08 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -APACHE_VERSION = 2.4.69
> +APACHE_VERSION = 2.4.70
>  APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
>  APACHE_SITE = https://archive.apache.org/dist/httpd
>  APACHE_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
