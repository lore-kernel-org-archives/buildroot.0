Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB66606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P9FiPxIC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A474760AC7;
	Fri,  6 Nov 2026 16:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S83H1q4BfcbV; Fri,  6 Nov 2026 16:11:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C545260ABE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981471;
	b=L2o59RfwQgaqHXdZZPmGinh8brBI4CgEa8mMcDXObSWaypTU4xDGWE/bo+BYp/BvWIBI
	 N49tjB9qR83fHzPndhDK22/MNb5FHo8ILGPlBTB+H3XM/Xxip0Me56xlJDt5pnd/MdSiK
	 7t5Utio6Ve1pOTFfWPIH6U+wuhVSi9m0PsSjsH4ZJnP1D9qN/3ed9yF1XP27ZniIf8dYx
	 jxynxNQtKHRBAXFZqLdq24JtTrcOfny5vAereuWMSE7c1XgZIg9jH1jz34oCFSJvokUEm
	 RO3er6LnKQAmovHXDt1Ez/pUTWj5NgLD+jdczmjncztGIQS+AT+kPBQD8GLpNep/atQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981471;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wlOsf8gfVm18PtUjl46Vx1Q4qzIO1+o3rZzsifL6Dx4=;
	b=g0TiIlQ1I/+hWS0AJcwcVSWnhmmd7SN+UYNJL2I+jpN7rwVRvPc84nRjbCD+VonuZGdW
	 fcCBgZukYeF+1/va3apWCXHeSdJaajqofioIiaazj83PArMeahpNdi31cwz1PzLVLRzHu
	 r2oGm/BQpPup/sSRQfHbNP60LExyj3c6D4HC5dQN2XTEMKsooysPjY8YpyftZqcuitlrT
	 VNSULEB5dkuaerq6fq924IO6ZQgOK0xYAuoKIGfxWt1BQtcRDzmRcCqOZ75U6AyO9iZb3
	 4t4AVZ6NAShhA0C4EA/1b2+D3m62JMgUahNil1Ey8TjfiNcszXsTTDFH9EpTCFhkP7w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981471;
	bh=wlOsf8gfVm18PtUjl46Vx1Q4qzIO1+o3rZzsifL6Dx4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P9FiPxICfWneqVgR7N26n9R2d8KCmzPJatUNC+aAm8i2pSAO0jx20e8FVlY/ivXTT
	 DRMRRWPXux3AiiXKlMSW0h1/d2heKMn/O+clHwnek/bTjHjNIKkvKliz1pJ1oqkFeZ
	 z7NLfbyzgK3SPcW95CQywROnNgDuMq5Kk1jICVOkOUD+8WSDw9QAucsPBcdDDoUNt/
	 ODOHsDm5FpFrVk+f4KaScYtDgVpgzFegvT0vVBoyCq0lZVR2+nX/w5ubLU//CJEQsL
	 pLMvdaYPZIWys3KWqmAtC9DBestuyvQC3J8oLygTLCuQ4TucveOogGdLp59ZS3fLLh
	 wTe6gXBie4q2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C545260ABE;
	Fri,  6 Nov 2026 16:11:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B8174B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D596403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjMnPTFr8nLE for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6B740400AF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B740400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:08 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a59100fa83so7187555e9.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981467; x=1794586267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JS82cF64v6pzdoZKjZ2W4UiDUcbdbtpK76oBOHsmhK4=;
 b=fXQYzW6NX/72tPbCv5YP0n7Xzm+GvLqIuLj5+yf6nJnY/aWMpWzZgEGnurph7ToZe9
 e+dk/8YcgVOwyMJzu72vcaIFrHziYr9OZQO8IpzY62UX8iQo1YvLUE8NCLQSn6oHSnMy
 uFDS4cBg+yVVhPYRRYyTKON7EZNSl0nP6cSMuxaWiev5bKE0eN9vwVueux+ZHPMn2ajO
 aRYMBLL7fdTkl+Y251HxG7eM0KZGGg3KZw98/XdBhaYPYdU6ydOHnw6rXHM3dmmrnQxN
 uy6oyR4L0vxTrQvgfDKpdWhytVTXGorMKuPOtDzFu96VZBL6MvYIxYrBJIpgNCLtJF8z
 s9ow==
X-Gm-Message-State: APuU4Z/nlzebfPfUcD3Xl+UXPj/NuknNf/05Ux/H/9QQaQAcxidB3aRQ
 8s5RyWxywNjIfVqadroc1AxBY1ub09Sm9Is1XmuvdbMj/FOVaHpvaDJSEW/gw4g5AsRZHxqupka
 fd4YQrcA=
X-Gm-Gg: AYBFou0rBEQetBZrnYjYNptRQU9+HrdgJrV6AHNOYzeeNInKRsJ2i/lpgy6eY0uUhYA
 qOF7lqwFuli6IAz7eem2TwVRaW8ychiSJSKiudW7L8zrj/bXATSbsu/cRh/R13W3zChPjITr2LF
 B5WdfAIg5qOTJWwUECUCSLuHBia3+YhtgY3/nUhBUtNJp1aQBlBrb0AFqkXizKQkEfJmtnENb0f
 iOViTue0J+I+PsOHVqrGTHVfK3pOhCWWLOClvC4lkx+hSFJ7rGsguTS0GyILAifV64K1ZlkkGdX
 O/+zi6kO/Z1d5kgm79ZjDn5p0aiHFtWFI+FqsDQSlC3MOgUpHI5STIVbxFVj0ZGTfHRFi9S3nhE
 yalA5kqFa+adDsJRP85mFzjgm/P9sRykmG1etqfxu4kYw1H57UyFDeQlWUt2IK7cDsJ0nsSg2G6
 ypnoAKVYzH/tYt1uN8/09awe6AOIQrM2V4QiDn22lOfZ5yJrMt1MvIwk8nSwYxSWNDzh/0btxzV
 0bJ4bjC51yXozNO2vhEbfkfuPyvy/GHCelOTDEdmMQSbmbGzgHTOEvI43dxgJrLgs7HY/a+YH5X
 R23ugU18GsOIMw42iV6YULrkMJ1BlKWHnqGg6vjeL+xdk7ASCIUf+w==
X-Received: by 2002:a05:600c:630c:b0:4af:83ad:8f70 with SMTP id
 5b1f17b1804b1-4b6e0b08fb3mr47427235e9.35.1793981466834; 
 Fri, 06 Nov 2026 08:11:06 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-493070bde9bsm4198635f8f.36.2026.11.06.08.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:11:06 -0800 (PST)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:11:03 +0100
Message-ID: <20261106161105.607935-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031172019.2683287-22-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/python-twisted: security bump to
 version 26.10.0
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes CVE-2026-83813, CVE-2023-44487, CVE-2026-115778,
> CVE-2026-115775, CVE-2026-115877, CVE-2026-115774 and
> CVE-2026-115776.
> 
> https://github.com/twisted/twisted/releases/tag/twisted-26.10.0
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/python-twisted/python-twisted.hash | 4 ++--
>  package/python-twisted/python-twisted.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
> index beb1c7f3b5..f65e733411 100644
> --- a/package/python-twisted/python-twisted.hash
> +++ b/package/python-twisted/python-twisted.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/twisted/json
> -md5  931ac3e39a52c490f85d36bcb4c77369  twisted-26.4.0.tar.gz
> -sha256  dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9  twisted-26.4.0.tar.gz
> +md5  02a15261bc2c23036399954941d951f4  twisted-26.10.0.tar.gz
> +sha256  5f0355403e507fc23ceea85e9dbb4bc59335aabde41dd324e8b8cea180dd38de  twisted-26.10.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  d7a2f74fe5c2b3f610052b75b5a131728c49823b28088893dacacf8d58849a4d  LICENSE
> diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
> index 09198d2afc..d45d2fef0f 100644
> --- a/package/python-twisted/python-twisted.mk
> +++ b/package/python-twisted/python-twisted.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_TWISTED_VERSION = 26.4.0
> +PYTHON_TWISTED_VERSION = 26.10.0
>  PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
> -PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/db/97/6e9beb1e78247ae6dc34114f27d538cf2cb183c4afcd3609dfdf2b0439c8
> +PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/fe/31/a5f99ae7f1550914b0702b8f78118d95a79da20525d26fbc1b2ab42bc8ae
>  PYTHON_TWISTED_SETUP_TYPE = hatch
>  PYTHON_TWISTED_LICENSE = MIT
>  PYTHON_TWISTED_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
