Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C526F606A6A9
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=riVN0ta3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqQZKJR9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 998098168A;
	Fri, 20 Nov 2026 22:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CybqnZ4eouQ; Fri, 20 Nov 2026 22:13:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D6E968168B
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795212822;
	b=XWvMXdZR/l1EpJ2dSHHG9OPdKqY7IZpT1NYNdCiWViq4R+O4+ZA3H2TfeFjZbL8I0t1M
	 9nBxJJjvYPK2EB3j8P3uNccQUvavOqdGuSRUDQ8jyOlxjZmumR4XsT1d3V+Q4uXIx7d07
	 gWNTejMbNMOf9RCKCKHUr/5WNAhEUpH9eWijsPPQoLRMs/O/EHxgLPqWJj1xTFfDRuSlA
	 csT0sHIyoc6rjuzV4m0rHYkpFLBx5cYJA4B7XS/HPHp92qKBLxDg4w+BeL9gUyveOLuZ1
	 JxTsnAE9Y76BjPHkE7pI2Muk+DRLMgDfYm255eAaUQAsR5aJ63tazrikuavxXHP3huQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795212822;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=jMsN8dtLSnxizJbaGWmg22gk+STnxj2p64JVqAjkmNI=;
	b=LD8r1MF5OrqOd7synZIqZ+I3T4RUGwTbyeuEnN0cdjRMNKBWj9sQMsZoAHsOKXvT53Dq
	 zIyJHimdh2As5aIjYbSIaga9SLqWyvHn1JWkbEkFziyh4UotTYVgdTrrzL/3yTd4t/VKT
	 hVh2uFhTwTNn7FqRECzxzOswQe00DaGCAsk3fz4rZG70Osx7x7Pv08wEc7eZlLMh4861k
	 bVtcywhmDHb0uZ6QOHiOwUqpd0VZoGarPtNpj39ZHCCom7/B5zAyT+2kcavlQVRDuuhhj
	 KIzx+W5xY5uwIJaaKdBO5wi5F0vV4CR5tMtCKRQu6iiFCYxOsCt8oP0vWFhvifCxHSQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795212821;
	bh=jMsN8dtLSnxizJbaGWmg22gk+STnxj2p64JVqAjkmNI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=riVN0ta3Nrg2Vg9gSJrIrRZm+aY2kVS0NIo5qhUBbgBXG/Z4BflHe8Upn2J8kJqkF
	 LxavqRkgrBmhnKH49CZ2QruWYEcfvnrldwEZn8W8ARJMTV8Kdb6NR0PIf00HvOL5/d
	 vtk3rCEul/ghKzfV1FoMtuWfEgqcxSm3vIVsHtvP4DXoodehTUbpCMoiM2IIItk9+I
	 aJduqVi1owJtb3rZRWazcd1texlT/YhUyhlny27U900uIO3RVPKZazFk8Oq1ItNNlo
	 +22spLjtfGWf88bh6+gz1QHfRf1bJc4WQ1a2Z8SPoW7zX0aLB61D1mOOQvZ6YUHlLD
	 aKtmIas6lhO/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6E968168B;
	Fri, 20 Nov 2026 22:13:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 481D915D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A0AC40E83
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rmf5ftGbtyIW for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 22:13:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2ACA440D88
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=JqQZKJR9
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ACA440D88
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 22:13:38 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso11554645e9.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 14:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795212816; x=1795817616; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mjSH7ePoq8DBt6Vzgr9TxOzcVDAv124G/49yhqQxCkQ=;
 b=JqQZKJR9nsZEjSIE0NkfmUNW/vjVUHuQrIO0PgAKqcCnjWKb8PpcvkhEpUNCotdIBQ
 t+jSA5Ag0IxVOhddISxYsotTuSEYeOUGpbD6UH8HgDgGJSnXX/7QcH6c9hNiDnGN9SRn
 hdlJbaBvJODcpfCZBFiNTyAW3uaDJwR3TZ17QHQs5G7eq4Io7ebi6vW3kTHLD1A/VAT7
 EBN3bBuZlR/6b1VpXEc25PzGl46TS77nDJP8mmZM85PnK0nN+7NzhouMv4SCZUPFZU/L
 CNis08vPIPobLDRGK+VvmNL8b7NdyrLy7+XAVBU9ZSibTxcSdc+Nd1/FuzPGoreJREEQ
 q7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795212816; x=1795817616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mjSH7ePoq8DBt6Vzgr9TxOzcVDAv124G/49yhqQxCkQ=;
 b=TFQf0BHYMTpHdlOFAFU7nYNlX3yyt+kP+2AQhxi3YmnnnhfoW9IjPzM1mkJ8xYnpEQ
 Tlgo/Ug6RfLgRZFvkfBe/6NLIRVCDmxsmjtBsLUiNKnCEz1Pk6bQEdEZVSUFDXi87Ah3
 4XSqPPcKHsSi8VdCPUgLTKf3zGpD1+I79NSzlYDP+fB77KoZZHQP4tjPuwrfRYmGAjHI
 R0Tb8NBaPEZkM2Aa57AIqo9M/SIedCO0duKtBl1GWp83aq6Er8UxPZ1DKoV4Q4thjLwf
 I1fEGyyPGOTQUJHjdzc3cGnfpA8+2oyvp/CsYpfi2zkJwKfo6uYDiHd18umogxHAmQJI
 MDdg==
X-Gm-Message-State: APuU4Z/gV2PRD6KwWNlWcOLivSTuyTW569xnHKy6q6vHG2A8EuKres+Y
 BjXo3IVYVoFTy3R0NbNa0i+XHpxd7B1eUMdAGq40Z8VJ1VRPH6I5fb7fOLj6BQ==
X-Gm-Gg: AYBFou16DK/0bggnnjyhqPIE6duChm6HJBm9zyTuvsgzdm3gPunY6RTZf9S7Hg1XtCh
 7JKAVSdhw1Pfkl43OGmJQwThKOr3itknrPZB5eTCPdOWu0L9Vpf8NKzPcN8jNB/V1kJ+J3vzaTT
 C6SYV3fq/ng1NxIXtkrZ1HSU/2/Ogxh7Cph+K22AGbjnhnJW+Tn49d+csMZrChd8Oyx/y0arzVI
 NzDjx8pu5J1SWNLPtaxMZTrJ7LaW2MIbrPpIeV48jbXYZKLo/YKNjeZxpTM0POkSndlnMhGC3A/
 Cbaj/ZIU5UN02lHZhkilIPzDluoSd0uHdX1oCcou+rjW9aH95giLcqduE+HFr/b2rvXfjLT2pT0
 4Uf6ElDuDWHpw15FRefpaOmxHWCStXRTaQr8nNXNWP3Ez61dOOQ9N25zLq053m71eCzoMKGpXpI
 PP+ki1pyKd72zHHi+dXvPV/QqXqKl+43+TP12M17JzejlhbkcPPUX5bE9ePbTkVI7kTuSv2Y+Rh
 JaGAKp3B6dotvEX8ssYJD+ijt2OBVWaDcatK+GOZ2l2JC0a9BuEpLm6KOOVDUJZI3rU/2z+mpm7
 UJjZNZnf3CwJKvVPLR5vcmq81NHGekHljWZkmyvGHjzejzd65pc=
X-Received: by 2002:a05:600c:1d09:b0:4bb:73d5:ab33 with SMTP id
 5b1f17b1804b1-4bb88816acemr108207985e9.22.1795212816407; 
 Fri, 20 Nov 2026 14:13:36 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2d55sm7771489f8f.5.2026.11.20.14.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 14:13:35 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Charles Hardin <ckhardin@gmail.com>,
 Christian Stewart <christian@aperture.us>
Date: Fri, 20 Nov 2026 23:13:34 +0100
Message-ID: <20261120221334.639761-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20230707185106.98208-1-ckhardin@gmail.com>
References: <20230707185106.98208-1-ckhardin@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [1/1] package/go-native: add a new download only
 package for go compilers
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Charles,

On 07/07/23 20:51, Charles Hardin wrote:
> The go-native is mainly for the aarch64 support since that was
> added after the go-bootstrap written in C was dropped. So, to
> get a cross compiler for go a host/native compiler needs to be
> available to generate the setup for the needed target.

I think this patch can be dropped: Buildroot now does the same thing.

Since commit 7b2a164b7460 ("package/go/go-bin: new host-go provider"),
"host go (pre-built)" downloads the official Go binaries from go.dev,
arm64 included.

On an aarch64 build machine, the Go bootstrap from source is not
available (stage 1 only supports x86, x86_64 and arm), so Buildroot
selects the pre-built compiler by itself.

Not Applicable: https://patchwork.buildroot.org/project/buildroot/patch/20230707185106.98208-1-ckhardin@gmail.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
