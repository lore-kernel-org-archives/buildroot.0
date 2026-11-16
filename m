Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2CE606A32A
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ph3vvONr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B956840761;
	Mon, 16 Nov 2026 15:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYGvyZRLlTso; Mon, 16 Nov 2026 15:40:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 07F7C406FA
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843607;
	b=icm1JKxYZeC+TyPjWCY/T88ox7z9OxsZrjybImeE5TS/UL6nHeR8r8iDcfSLD5ek08FM
	 xNPiW7HDTnNDjox5FSGtRgVijBo+fyhhtkm1JMecM+3TNO6vLn+G0ATIDHUXfc9IHPdiR
	 +trNTrRgjMg2R9OjczbMmAJTeVTz3HU7GwP7Pa9wN+mAKCgvo6nGJnTK5dQMNop8hx7ZC
	 h5lQZwYy4nt9V9M3iMUqDTUaGLpG1bLFWYx6KffaNHBNzd50hS6YySGMmewGh/YQjRiUv
	 Tux0FmmIBr+YrjuyJNo8++W5RTE+KGDWlDXKm//QHiffxScEN+JHzC1kcZVilij7vZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843607;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gV/96wvkEZOXWMw1K1xYimMF41cb/R28YA347s3pWJ0=;
	b=TJ5pLt4nxnVjIWUrUL0B17abDqQCuUTmaT0sgB5VpFh3hFfc8KG7hO9D3ZgfBkNiZmyY
	 pew0pE1FDilNYerdvp1x+Q6I0jp5/H3xA4v68dUmRrYrU19MO3qMXOARfFmLv6JigdXd0
	 +1GLeFKVsF5OAF+cvR6aV92S3TeB+I8iPPk50FkQjAg/dfo5TNmAt3+8/YWh3pqP+lEUY
	 86Adnmqa85W4jVgpH1ThzN7RUI2ctUqYAScXhkV8TmOC05qz49tlo9LFyETYZTaZ94qcg
	 ogJdDdOqfWHzBIGc7SW6uRt8GBczG2Vw1EGdJPOEIssNKvXIIX9Hy0TxyX1/0aKP72g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843607;
	bh=gV/96wvkEZOXWMw1K1xYimMF41cb/R28YA347s3pWJ0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ph3vvONrgG6MPAA3pvMi+msXpWfLTzZjWUqvdszujfdzkhz7CmNyurvzB9luWAXzx
	 y24dQ9nFKAQnKnAslnSG1uPwy/4mSjj53B7FicgyXo2ftvyj4qe/sEh2d/VA0pWZyo
	 2vrLW94sSJJnBLaVUcoUHG0MFjm9wMZ/JbD5ub420BLaMCNd72CktZnagc92iH0F3E
	 QFm+cPewvHab3IGNejdSO8ydBkRGCNzN6rPiLbiXDgOhzbqF/BBWgrTk90YVkFG+dT
	 N7147qskIlFfjwYBRDL3mnYgxxK/T6ilZpEnBfpAg7bMoKpKrzRTj8lPur0PMHvfGJ
	 kfPJjJXOyzwcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07F7C406FA;
	Mon, 16 Nov 2026 15:40:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B4AA109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28C6640282
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OWK-d39czW-i for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 30E154009E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 30E154009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:03 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4b79502c27aso29234085e9.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843602; x=1795448402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yyoYW9ybcMdNqW4Az9f3uZU6j5IJhp1mFuy+wHOXKos=;
 b=txiGnQOFiDlC7aQ6LuhkndADwSRrC8AJYKGmx9F7oCrlmZsCPRZ8mmXC53KDOhnWvJ
 VE5ej0AI9CxR6kq8WsBMqPhwZMtZ/HQV5EQJfAVVX6XqiUWUdUmQNOBs1bjQs/jxTkps
 NH2frdCD+Lf7jdEw0WEe3/DgVJXUcX2wDcmVbPxsQc0VZBeck8Tv8oX77HIRZeyk2VaL
 dH648e6wt5SjFXP39UmF48OL3MuKMzzTiJ7QxUOT4JA6y4QG6ekA+Hhs2ZrUX2ZXqrnB
 BiwA3ShtIho4dN5DQIeja+Uo5teuwSTbAT8dA1MvbwC8gNE8Dm8PGuMz7YK1REWAcMvE
 bYUA==
X-Gm-Message-State: APuU4Z8GcHT+Euk3EOC3Ns9svhVveFb7yOQTMTXSBsPLiqn60ulMl9lN
 LAt1iN6848h8qWtFEWoKxSTH23VxrYvLRYAUys8Yeu63GmDwVSCh+TckPDKPel4PmbhT+vTIxB8
 qTWDj/Wo=
X-Gm-Gg: AYBFou0HnZ0Vyqaa0FG0dnfZYYQWUbNW3yevl5cezF5CntD95ioeFfwtROQGLtMEmE/
 zuCFtMdhbl0j+q+Ao4seeQpDM47mEkFkBSL1ITkOJzOLUeg5q4VpHoY/yebeAJLbAVGEyoZEex2
 RPiBgzjFY93dlET9X2HEMXscn6Bhab0w7op5Iu3ZdBdwrm3PPEiUzsAnvMpt2X4uQxlYe28mJST
 m58tlWmOLGTIOqllEhPWHiUKUwK8+E2CQI4hfxkzEfUwBVubwq50E3U0SScQRfG6HjV6ZUqS70U
 ADhMptTDhX1jO5OyObo1mSW3voUduHi6w46Jc8RY8TyVx6I+eVob+P7sa991iF3NaagBRnWDgq0
 2RnHd1CSHh2gmX6vkGhjHBLLXOcEM40qmbmPst6S8m1GFY8fjDfoPdOgSa2aX0pqK1qe6TBG/kj
 qRU9qCVBDbBHl2dtzI0vqCkUYom3Z/0QVz/rGJIWc8yZCijhEuAyQxEUcQTILsfzz6mShXPp9pB
 kE1PD1oH+HBPB+5IrCLVcrHHOn+K7n7FgY54nZ807cI4my9hKsRbQfPzMv1NBXzKrZx3POww2Wh
 /yM0u0UcUJvWWrsWq+PY+nYOOlYOERA=
X-Received: by 2002:a05:600c:484:b0:4ba:493b:3401 with SMTP id
 5b1f17b1804b1-4bb55a5d628mr166098515e9.9.1794843601925; 
 Mon, 16 Nov 2026 07:40:01 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb56f97257sm192811665e9.4.2026.11.16.07.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:01 -0800 (PST)
To: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:58 +0100
Message-ID: <20261116154000.725710-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103141717.385038-2-giulio.benetti@benettiengineering.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/2] support/testing: swugenerator: new
 runtime test
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> V1->V2:
> * no changes
> V2->V3:
> * no changes
> ---
>  support/testing/tests/package/test_swugenerator.py | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 support/testing/tests/package/test_swugenerator.py
> 
> diff --git a/support/testing/tests/package/test_swugenerator.py b/support/testing/tests/package/test_swugenerator.py
> new file mode 100644
> index 0000000000..2bfa1e7efb
> --- /dev/null
> +++ b/support/testing/tests/package/test_swugenerator.py
> @@ -0,0 +1,13 @@
> +import infra.basetest
> +
> +
> +class TestHostSwugenerator(infra.basetest.BRHostPkgTest):
> +    hostpkgs = ["host-swugenerator"]
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_HOST_SWUGENERATOR=y
> +        """
> +
> +    def test_run(self):
> +        cmd = ["host/bin/swugenerator", "--help"]
> +        infra.run_cmd_on_host(self.builddir, cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
