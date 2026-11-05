Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC220606A328
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iyncA8j6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+aEJQNi
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C493940743;
	Thu,  5 Nov 2026 21:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZxwY6hfIOIo; Thu,  5 Nov 2026 21:57:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DD418406AE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793915874;
	b=Me9LPMw7o2AFEXfRB+QevErj6gUx8P3Diz774zgi8RzoLZpg9GXjqql6QOtaz0p8f2cf
	 TasFpYGDj2y1496P+T3mzgqbJHxa77TqO1PHpWj0vgYkkkPZ6JfmtOr0Q/eJhCsOjblkh
	 RydOu8dhhhBixxf73JWEs1OQ0hBnyGVW1PQhvbnB3HGPZXZ4DeQc0frBWblI+ncTs0PCB
	 +CL/Jrx5lNjasAnATuz8VACEaIP4vd1hVo5NA140M4tcTbD+OOzUViLP58xpgnb5voFIp
	 fHd4gsZ7B3O9qx5Q3b/HtDKCX9wBF9ouALQFUhgtE+HbmqCwBc1H9JDnOZ+okspsurg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793915874;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=DAcaFV/sZEjCbjLIBC7xU0E/9gf8YaRkkIzyS1NrtGE=;
	b=gGJAhwvPBXx/NeMKQrOMP55nwcJ05yzYa3tVqdYGhYGi6eS+aws0k7UZ5a4GMtB+ovE9
	 EshC1QLlBkbxc0HDXcK3iuRQl0PXAVTlUkNV5Vja9aVv3ndfol6ZMenldzJeC+0vRJcHD
	 cFrEsMy2wxAs6WypRtrGhbpTyqgPAZoLMye/omRZoEqAvdIAqihnvSsOi2icg9GYabKTo
	 5pBXkrDGqBEdaF9BvNdSj/C+pY17/aixsP9l5XcJzutpHlsCcYpgH6sqKGUrYY9Cd+Mlk
	 9ELQjfuXSE3y690KkktKWbYUp4AUJYELLqT8LHHwBnEMs/H+l5ycCdJxASdgSehTxwg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793915874;
	bh=DAcaFV/sZEjCbjLIBC7xU0E/9gf8YaRkkIzyS1NrtGE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iyncA8j64heE4CV7z6e4N0h6xes6yetyM++621W+Y8tPhaQRdL3ywcGtokjgNFtXJ
	 lMYRGfmezyts3Baenc8KrTtwQoit5tN8OztfgbWR915MTFPwJ3PU7vhxaf2xQVcbtN
	 JAPKl33sMlz9HkV4KMS2Qzo3MBQnXbmsr7cHbsUzaZl1JPx4PJPqhfx/PJnVe5/HjZ
	 QO6aIMUs5fJl10XL15ITpP+cpWy7yTxceqon1HWvnSZRZQpJAEXQJvQhNrBuHXy8k/
	 nPuOyYn1UGT1RIMiEnhA+u6ZuibGDrzKywRdVyBnP2YUhHAPtzKxz4jBeDqX28t5QS
	 dRmBcz5guBRfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD418406AE;
	Thu,  5 Nov 2026 21:57:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A88CB00
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BAD040363
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id At5leEc6plmZ for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 21:57:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 46A914010C
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=O+aEJQNi
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46A914010C
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:57:49 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4910b863b84so834128f8f.0
 for <buildroot@buildroot.org>; Thu, 05 Nov 2026 13:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793915868; x=1794520668; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=sfANfc5VxmWgI6IDY1gdyH9PCIM9F6vsQIehnABFWxE=;
 b=O+aEJQNi6/4tIIg8qEw7bYmA1PYXi+drT0NidI7ymlThvWM9ZRGEAOUN7J7QcdB559
 Af6qP2R2STGEsVhCoo1h7N4BPp0vplpHiOWaqIpSMV4N6sTzYAARw1TMdrslkhNIJyED
 FI8uN9676mpYOAPcBmbiXFzm821qLI3Z1y9yaNv/mjXwUMHugILt1d3U2i8UCWsSUUEf
 WFjm+o+zAXNQw8QflC5qyViJuQ1lMW7dMoGgSU0cF+3FukeNjNx8GXU1ebeDC5LJyfDN
 kt9VjhxwMofs98252dMtwMr06mmcsTAULSE2i/5zx7BLrwjNIMda671g1J1jbWQmcPFw
 7YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793915868; x=1794520668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=sfANfc5VxmWgI6IDY1gdyH9PCIM9F6vsQIehnABFWxE=;
 b=TQi6gj0SotXf384RfK4ta8aFKWjob2702SMn1R5bgeFycfEOdwGXABuhA2h7m1Q3oU
 /TvVei5L1Psi3ICb4PLLD4i33oaphShhiW/GJI2weWJMcrD70/Voa9CSObz4CqHJklpL
 RuYWwyQdAANi96N9WonfoUaIt2SzfJsNjWzULO8uQgMdeZXDicoWI8R8DSd65oYx11aD
 2tasDIvA83pQGUef1R7JhTJPe7L7ZCPKXzoN1wHPvksLTl2jqkflnIn8jA4JmEBhfP6/
 mcL5z4NH38aibU45iiQrk4NyBHl0RZViaeJ5JdCPCXaim+ldeqx/Ce/3QC9GlxK69nUs
 kvfg==
X-Gm-Message-State: APuU4Z/CuGsGxU9pcTgxvdcRluOjG9aoo0qLgcgJ8pMnpADwAMusdRa1
 KCocbDjRbIEOsaXoxTNakPuehm52qq3VMcTWbUuvU+jCUZeHtY6aV0aogmJg/w==
X-Gm-Gg: AYBFou1yOkKZ44u8/P55X9wSRTy5utnwBSGWg3jRXqiJ7urTLysfezlvqjb0yXzx7TD
 jojcprT3Gw7+50shGfZkHh7BfhSd0d31O/uc8xmGyw/WneqIdomjnhx2b9ouJe752OnQjhxl2Yn
 SeDGkJBoOKWcr1Un7f/2k6EDqbxCmwQvIEObFN+KCo0if1Xyl8Yuof15Bmfyh3vE7NHu6ElKcXL
 9NvoHj4mkSADN+99xb+XtXV0N7q3HKz9YZfU4SCrRu8DU9GOABfKmtpPZNKvohe2hljeem+NIh0
 wRTC2SFkCYGF+S8IQz7ZjhI6vuDwQ8gdR4Qbpd3xqNMqkXv0g9ElXbh8aU1MTXcsWzJ1l/iuu7Q
 g952fjyYGTq1D4IJmXSIYUWyl/tr9z/k1GaiRNq78t/iRqWdDsngbpMdvf3enLmBx4kej3HHKwo
 MVgX0cc20LSU7jGFicYiNsSDWqR6N3FJYnAraZB/8FRY1mpTQGXU89LNyQ1VTgauTs8FuRBRsuX
 6h9D27L3XrxoZlNwCD0YUW5xghQVHyOHut5t/XJwsgNYeFAPp4RYh4xcHBWQ7kKg+VQz5EvodU4
 49gffPu6PtIqYMkjpOURf0jO39CtJM79FIZf2h0MQ4h2bDyRAuFr8w==
X-Received: by 2002:a05:600c:1c13:b0:49e:65f2:db64 with SMTP id
 5b1f17b1804b1-4b6dea694b7mr7261295e9.5.1793915867797; 
 Thu, 05 Nov 2026 13:57:47 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b57317cb8esm93675165e9.13.2026.11.05.13.57.46
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 13:57:47 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 22:57:44 +0100
Message-Id: <20261105215744.3511081-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105215744.3511081-1-angelo.compagnucci@gmail.com>
References: <20261105215744.3511081-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add Angelo Compagnucci for
 imagemagick
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f86c777c3..febf03773c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -236,6 +236,7 @@ F:	package/grep/
 F:	package/gtkiostream/
 F:	package/httpdate/
 F:	package/i2c-tools/
+F:	package/imagemagick/
 F:	package/jq/
 F:	package/libapparmor/
 F:	package/libb64/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
