Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576E6606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qFz6zWmb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DF1160B22;
	Fri, 30 Oct 2026 15:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9k2AL8k4_Vxb; Fri, 30 Oct 2026 15:27:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6075A60B0F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374071;
	b=EMSDRAedPAmgkOzv5Pn/bjqvT9Cw+daCmqCEihMURo9Y6xgdHzLRQp/9dmm9eCsLsft6
	 rcQuq+3mxRrHSApjYxIEPce286VMD5FK13QNwGl5v8AuKN7vq/ahyq/ICwl+7rEmoizJO
	 K0GZFODfbyvCv6SsTelt/JUOswKsjN3To7XlsEhEOT47o5G0gYW8to1fJnKR1L96hyN6S
	 YgbAJvBUHEhqYyIsAFOb8Zew/isCIsa9DvvulznNrHhIYahs5DCJDuCrkHsuUs0Yt6GIS
	 uo/Df5RkIK5r7vRtAD1WrPLFVMwK0m2x6H5Y0GN2E2nHOIGEv4bR+vAlOo+JUpjqNKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374071;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eDxrUcKOQl2C/M0S041rNY41Y/0yYJDX5zfLMNvq7NY=;
	b=q/k/Wci+bk13BNB1uLsDIZW828QtRswO+pokHc2NaEIc17wdy8x7GQHd4Cw8OcXO5N4J
	 Vm6vz3SfHTndq25/ha67c7dj4VzgrbFe7qFIG9oX/vs2mSSkC/8XiNej4eaSfEHRD8ASK
	 vBE070oh7GHCTfaY+HbrIpNc4KcPnsrAUuIAdNOYzVF7I1jzFeBfPHlTMgNuiwgNFOlXs
	 EbKlXIT1ek9dgvdb1JLOLVq3BQb34UhGr6Ff+6sIXCJbccgzrK89Rm1QfnUyWw88Qjwkx
	 nylv2IuXPEQ9WjpA6YUP87fqwnd72Df42ucDaWRev0cPWsArMNsaMgSOj35cTXK1kcw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374071;
	bh=eDxrUcKOQl2C/M0S041rNY41Y/0yYJDX5zfLMNvq7NY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qFz6zWmbcICjkE/bD+7wPMRkKdpbTUvlP4+yP242Y5BTsE54UJ4QJ9QjOUhrb7/O4
	 aKUsO77lbvkGD79wPJiQErnLKDLYSQLV+f2KUKud/qDj292W3dlVKZT3i9smFYLvoN
	 1S/I0NeqbsDInqYv/rM1dHC5ZAI7Vf+NtaNgMAbLMI3U0kughYOnd8sgD/GvOsDB7e
	 9yDefGV2vWPKK+M9SWByPD5XJFcHU6MA8Pn5AxB7ZNFxOe3JOjD9QluUceNrspws2a
	 ArKK8/Lh5NRsPAKxEaW29CyHDLbSIIkzx8I1JsAxU04j866+dJj90Msx5N89l053Rz
	 RYrCDsf3B+otw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6075A60B0F;
	Fri, 30 Oct 2026 15:27:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0F49235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E202340530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cs29jkMXu-tG for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 17AB940211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374037;
 b=VRsgLnzOuuDJnfnkhaPE02Uoi8Vwuu6VsXMuLnF6/SEdy/7ayJsPH4B2fDTeExYP6EMJ
 E4bfTBr42w1n1jSyLwSg4qiCYKgT0XaGO0VOoxC8FC0CH/tKqW3osN9fe5mFX6Rous2AO
 go/DmPn8nLwdu5PmGXw9shWpATjfO5+EyogpH9DV0TwJdHXihwmPVOS3sgsQ9FDXlzkQQ
 mBpz8V5UNUVsVZRKJrsYTnfjoOkxwh4vV2yKStQiK7tEtEkUpO7jQZ53taJw4Qk/eLWzz
 EwfqBXKQueGR9I776PvaILiCF30QCjgzMDY582QciAODkpK9WXLslzbDn3Hl6FDJb2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374037;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=H+wUj6Q2ZbnY3zdXNhcg1dQnZnkg7sOMSV6wMODH/zA=;
 b=hNfNBi1iBZpzblZ2nrotwoICNuJZancQvy2HIfs8nuUcOsqcblsq3lf2o0FL99gNlwAL
 ipIt8M8Z/h1qj+VZbpcK3yUvkci45MDEn+O6dCkuwe6+Ig3F4ws4Vw3hdSJi7p3uHQPuA
 Ocf5gXP8f1OJ0hSKC0zTJ+nXrgFe3iCl9ZJC3MdmySAiGFmAUfbzHuefe38ELHCaDabNk
 mB7nkO79/eiy1PQCKfIzG730xwet83tuAREnWdWOt/LPXyPnK/9u8VNabycBUEGxVxums
 uLnoSSI2WRxSr4VUFEoQXy6qXR+7VyeNYzGAYEKLwONLYDtI+ieptH8z5M0OKFZdw8w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TXu+UFHG; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17AB940211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:16 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48af4d4e61fso485875f8f.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374035; x=1793978835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=H+wUj6Q2ZbnY3zdXNhcg1dQnZnkg7sOMSV6wMODH/zA=;
 b=1Xqp1aD5x9D+2bubCkfEeC3xobd86BXBpLuogGsnEo58a+PggjkuhOCy24lxlVUm4i
 Mpl42U+nC884fILHcPh4kFZQRfB5p5h0WFamJTXqOBRscWq0M79wfmFBZfPoMdFtKhDY
 bkAJCIYVGkGmQ5CtdEZg8+Cz+RAyrRi2IhpTh9KP0PeXCxmdMz4fVHGfpjE41RT4Lcrl
 GwY0l4a6kJl5bZR7BG4De4Ucd0t6s87v0c5wsy589spXufFHXmH9i9yjaiIRovRywkML
 B1pOTDHQzBA9vzqkxSO94f/TSQCaVrAGW0lpvlyqq8r3ONEpSbfv4XpytVlJAN91WKf5
 HU8g==
X-Gm-Message-State: AFq9FYLAVjmkbB1mubjgZbRFoQGkedA4SMedlmwkkUrJewV0Qo6Sphq6
 zRfs7Gwk2S16ZcselNL8sL9hY75CizxclDrvYDTX3aRwDPOwkdMRb95cdcOi0HjWgQ6+p/59Pds
 c1XNxPTU=
X-Gm-Gg: AYBFou0atbaHnrCr7QbiS2SJoYu9SWpMGtK3DlTswCC6nwtIBdvPB7ES+uWbeMG9kJn
 kQxaco+jdWzpSXc6nQcFF2MA7o/VHCDnCqG2zw0zblwZhkdBjNDRpVDM5gDIporkWdTEhFCb7nb
 Mli1HZIWvZ5ac8+1LudiWtgy3OTSH0H6HER+q2QlWcs2ECJtBTIDA1aUlBvp4q3Gahs0bRJ+oq5
 RoELee0PoHY2cbDZnBTRErwcD/QKhKOZJAZ+ZBWeRxVMFKYyWsRzdgNjCu/doGuywg79l0ejIjz
 fK6DIZ0MSuSk9tnbzs+v2dHGw9FEAiTHNRyUsgu8ShTa7OphkBHHKCNmUjarwpE3ke5DQpdGdDo
 thzjWFDucTSJ2ksLXwJeGlyXSRcjMXvOCv/LdS6xVRaRYXdHTCObFU/4t4W6S6N6EHazlXZPOa4
 VkKHMYfWWrkjHwb/GzHda7q/YtXfGA6itK5YAFL7sEVK2ILXw4uwUXMIcSBlhzveMwqq3QT5eKT
 cIPLPxV3vR0S8XMPlXMxZv3VbMB7w/k5D75ESu5wh58TNwbprCVZ5Ny7vxklxUEJzkDp3r5R9KX
 SddTQHMgPj4t8D7DhSM3Fx8Rf7n6Q79zWE4I5cb/1R1DH0pkvKwO/qhtWyXvhS1akU6SIJ4l
X-Received: by 2002:a05:6000:1aca:b0:48c:7037:aee9 with SMTP id
 ffacd0b85a97d-48e6e4fcfacmr6360166f8f.50.1793374035015; 
 Fri, 30 Oct 2026 08:27:15 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b80ecbsm3902759f8f.35.2026.10.30.08.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:14 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:12 +0100
Message-ID: <20261030152714.1906623-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020140929.1632016-2-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/network-manager: rework
 jansson handling
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
> jansson is needed for BR2_PACKAGE_NETWORK_MANAGER_OVS (which selects
> BR2_PACKAGE_JANSSON), but practicaly speaking, network-manager's
> meson.build detects jansson regardless of ovs=true. So we make this
> jansson optional dependency explicit.
> 
> This commit doesn't fix anything, it only makes the dependency more
> explicit.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Changes v1->v2:
> - Change the correct variable: DEPENDENCIES, and not CONF_OPTS
> ---
>  package/network-manager/network-manager.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 5071546c27..2a562db726 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -107,9 +107,13 @@ else
>  NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_JANSSON),y)
> +# No option available to explicitly enable/disable
> +NETWORK_MANAGER_DEPENDENCIES += jansson
> +endif
> +
>  ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
>  NETWORK_MANAGER_CONF_OPTS += -Dovs=true
> -NETWORK_MANAGER_DEPENDENCIES += jansson
>  else
>  NETWORK_MANAGER_CONF_OPTS += -Dovs=false
>  endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
