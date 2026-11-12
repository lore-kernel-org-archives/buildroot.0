Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E5F606A893
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 10:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ifLIhwh5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+7MzJjq
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EDBF810BA;
	Thu, 12 Nov 2026 10:22:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHrPszaAF2bA; Thu, 12 Nov 2026 10:22:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5A11C810C2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794478960;
	b=AD/x04GrzBZtn8+bxGgEZvIiys5z8goxZ6bXsI4QTlmpGRnr1g2YL6c+sK+gbCYTiE3v
	 xYt25e6nuhWSMgp6dP09O+JyzE1HBt1EYqL/3SYTz6R5cWawko9FXugj4Q+lmfgtbzvsA
	 xlOsJDMItw9B10Oy442jHB5kKNmQZ8gVrFDWwL92w3GTwXo3Be6gPg6/1lYmc3LgZnHiH
	 aAnyz7r2r2pD4Q0QSd+0Oa/hZwx/lFkQTDM/fBd1GLI/vdt4u0TsqJpkcHoQoCpMi7mLg
	 X1yr5/GJ5972L4Y3y4HuHWL+NJEu43qUI+fhNEK7vtwWalj/xVU/Bm0HrcAemIYeG0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794478960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YWtmRRxvPKqJkQNL+7b9xe2ntI1/TY0BNh+RXY7NdUk=;
	b=SJ5g+iaw2cXzojbtpjc+NpTihR0+Djj8wnAOu9u3hIHOnHABBXHd9sUIrQbkuz1C8TSb
	 MZGPUTxvESbI1VyIqzJJoj+tP7CNV6jOVqVlFX2MFeYYKzegrCmwfhX1Xs10uK9MUXc0q
	 6ix2tH+uKWUWQPRULLUZXW/A+YsjRtVSemWj3u7YTIfWgvs33C8g0tlRcIKw3cH/ejAsD
	 IEqtFyffu5PSRCM3pmmreGA1Cm+DvSTZCkT/HRF3biTjxXZixRETwa6/HowuCWKYbb8aC
	 vrJ0QYZob/cv32WlRWfTJXkstEoO+HxMmF8f6kMNcl57gaWuDKIeL9onrPLyYKWiz7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794478960;
	bh=YWtmRRxvPKqJkQNL+7b9xe2ntI1/TY0BNh+RXY7NdUk=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ifLIhwh5A147jrAgmBlQDJtUBpP32g354Ep+wB3to/WU/lANwzhZpICCb7G0xm91x
	 hlv5M+9Jrcm9i0FI5WAN1I/4H7E6g9P/mkVVOdOxVUpGOdQwvZd+zCb+P64xFnT2Ya
	 dwVjD5rlmN9A57ueDYwwFBNtKkkgL24R+c/maA/LYTKZhTTMLFALdvMm7Evp5OM5Yf
	 5PyxsdvD0C7/djcHT+zcC5L66Pm5/jBIUahIAfQOzdED2axEtdrJBQC34IMGdth0tX
	 JoX4JBf5XNz/ibnrqy07pni00dnQtdZb/tGY9uCNw9xG5RTVvNBHATApP//pWF+QO9
	 qrBX1AOae8FFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A11C810C2;
	Thu, 12 Nov 2026 10:22:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8344A335
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 10:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 691E9400D2
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 10:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XeG_N4vPVff for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 10:22:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 98B1840086
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=e+7MzJjq
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98B1840086
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 10:22:37 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a5036bbac7so25985995e9.3
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 02:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794478955; x=1795083755; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=3kGaR9eVPA7l2dt+StzYx2oTg1ayfmj5Wv/n724dSC8=;
 b=e+7MzJjq9ez54flVBHW+Lh0E+8S3vIaq2ShBgUXTP+wS+4j7PIh1imRPy/bwjADQKy
 dwpEsp646jVbHpTeHi2ziW5Fhxcxfm3KulIGorpf0rR9aPn4UIrQDlouV3iQjr/9rZ+K
 AbVyfARsaxQ0qXEF3r0HEKuO7zl2vrMVuM1HY4+HllVX3S+i4v8mf6aPXW2g34m2xleO
 L4mjIqbuHXwkPWltsidfIrbZej/LbkaLQbgYZKa7A4C5vCdPLbM7TZF7s2ZYdGLTK2NA
 GPYiB3gl/IocBpBR3A9gIXup7pOMwlDml9VAgDuVTaFCGYd0f9CCQFOwezhOYwJBReSw
 tXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794478955; x=1795083755;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=3kGaR9eVPA7l2dt+StzYx2oTg1ayfmj5Wv/n724dSC8=;
 b=kTHhmwXEtVDDKpiXrD+XiL8qqLkXx/LoXqV6pSjbq54OA7nAuk6q5eCA/0uoPFKtAZ
 8S90wgaLd0CL/9bXWK7BPFzTw17Ix465ZT4H5w4W5e5d+VKvhykFnxC3ZT2Jt3TOQBle
 LxckTDJQEBQQPXZfgD3vlDF73pzp7y7+diUQf+Zg1tDEz5JIrdIIlNCBNDJoEJylGuE2
 AzALK6jce4WhrmiGk6j/sv0ymc0KjAc7AixWVRNnfLXCIvZpRvFRW/H4d6fDt68fUXY7
 Qoe3WFoY1ZQArIeYogl/KHxelj2HWgCoNBVeplgtKn4tdGSDC/UjfgtOxSXK1hPHiwQg
 FVoA==
X-Gm-Message-State: APuU4Z+20BCK6Vkhz8+Ufa+fJ9dDnB2D8fFhDtgN1qOLatGyKZXl1avz
 1Hbgj/lCNcn1MDcbrFrPMIEL7SogcOlIydhacky0i2rsmPuZVQQZBVPyhYQwpg==
X-Gm-Gg: AYBFou2KPwURPdPKE09Zq5vW6r35qiqJuxkTYdE9Dzysk3q9iHmDwNPY+52RBMbNBeN
 6pOFqSwS3YozdSvdnIyK0Z+R3ihVVKPYkm9wowh99XKfXN3gf/yTt0A8D9NjyZnmsHEYDdV2nJp
 +zhNYZ2qYyOsdcKA3hJg/0AL/8T/l8mEguiIDCkWDAe3ZxiAjAFo0/dhHkD7wIaCQhg4YEvMK7G
 1B+U2uzbHfYcQGy6XFapCjFh/AmMkwpQCrTfbFggIliwNfV9SsOJj/knDs0x54DjPqrkOKLNYHU
 bDavN8zXoyVc03H3TTE2EzfkO5J442t5Ae8PNeoBfco2ZeBT959uByWF1uGHnYFhPg0FUtTz9Fa
 OzCsEfpWCDKuc66feuyD4R+OTXzOT2wpYXcoEch2NcOWz0cHD1FZRWmpwfjOb0WJEYW71KNLKhh
 u5na9kk0NYnsYcrmK+0a/boYNE+MneC5CP2qyyWkxiYX8YFvxBKs20lMavfyASuiIMGogZInUUp
 KngVld8Npwz8GgJhAUup+8I3qV8nk/uQV+j7qNZJhQTUqtDRzZx8uYanzAdqvzSMrT0AHSitBVm
 CYYIrsbKxM190LkakXg5YQdG1VQy4d+DCzqidmrsYdl+djhDRkCTldMJOOPV348GSuHrIdFW0/G
 3Z1q8ZCtIXtVlYe2GNHKQSnE8Iilih3rSVxxRzbAIShQ=
X-Received: by 2002:a05:600c:8b31:b0:4a3:59c9:a743 with SMTP id
 5b1f17b1804b1-4ba0937bd0amr83979035e9.27.1794478955068; 
 Thu, 12 Nov 2026 02:22:35 -0800 (PST)
Received: from leo-ThinkPad-P16s-Gen-4-AMD (free-mobile.vlq16.iliad.fr.
 [213.36.7.11]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba09509c74sm69642405e9.2.2026.11.12.02.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 02:22:34 -0800 (PST)
Date: Thu, 12 Nov 2026 11:22:33 +0100
From: Leo Denieul <leo.denieul.yoshino@gmail.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <avWTaRs-qksqpNTh@leo-ThinkPad-P16s-Gen-4-AMD>
References: <cover.1794475724.git.leo.denieul.yoshino@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1794475724.git.leo.denieul.yoshino@gmail.com>
Subject: Re: [Buildroot] [PATCH 0/2] NXP Layerscape secure boot support for
 TF-A
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Correction on the test description of the cover letter: with wrong
SRK keys, the BootROM reports the SRK hash mismatch (SNVS Non-Secure,
error code in SCRATCHRW3) and the boot continues as ITS is not blown.
Separately, tampered BL31/BL33 X.509 certificates are rejected by BL2.

Leo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
