Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B89606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=K3RAzeW6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 991A060E55;
	Fri, 20 Nov 2026 09:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e670U_jb-iGp; Fri, 20 Nov 2026 09:58:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B393760E3E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168728;
	b=IVBiClVvPNPBog4um29FzNaQaM4gGKg8dbzNIHFeek3KMIIbtyM2PlWmOU2+dJqT+AsO
	 wzePV66eUmoJUxPQR46mUw6OF0Av2aa2s/7FwunCIsH2BR+L2CSNY0YTVVHAesBHgKMlK
	 HeIv0i7DzCuYp0Llrhy26YWOjbnLXCJEiYUZvrAAV+xscno1N6aiggif+4R16Tzj6OWec
	 ToysAVLF6y1lqR4rOSiMK37C1xJX+3uyr54uSCQnm/dnQY6nxOy16rq/Sum4bNG17kqKB
	 fzpx59pcm54xeMuDbCeVW8inb7AOxA4k0ixwdM3Gb353dEcQNcJVcrlY72kRkSaceuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168728;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=A6ZBAaZFS/nuGkvAbEKColn5SyRi0cv3Kb62Ixdm1+M=;
	b=RyPNHVO6yUJ9pD+76V1JN9PQaY+GAN2YahCmc5raOjFsjmPtVyH2VgC047Y9FPFaLK3p
	 Net7Qmfmoa+ePdZek6rA1tmznaaQVcrvcbnl8EBI9FJHvLFqEDNP3RbGZZoztK6qkInTu
	 D5wkCswao3UQOudj3jRoWfhPZEGod/w8Z3yDGmc9RoJAvEsnbm+vM/Y+E8KOFlywvd99V
	 nHByzen1Muohs6dOFkNu+BiASVL2E42O5b79+5j8a7RaOAabwp+MjsfekWOOd9i86mjNq
	 pdxJvPXyOMu2Wg6y5sg5ngVyLKedqFfbGW5ExT8Vmmi8RiJomfrdhJTDDkho7W3qfbA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168728;
	bh=A6ZBAaZFS/nuGkvAbEKColn5SyRi0cv3Kb62Ixdm1+M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K3RAzeW6CI2J5H+VIqk0d8AAc4tuAHCYDY0ickcuevRk+VMja6kAyXSJZRUDZCsIt
	 MF02PzNBvI2Wfe5SH3gk2kX4e73fD+Vc//5KjsQiNlHph9zWWZo947RwP7G2hUdn7V
	 klwWqj95N6yTU3WErhSdr8bvTVLfMUS+JSAGt0EPaDm1c27gh80kI3St3tNKhCbTOZ
	 IULiujAlPiRLdRf97IefGYI35tb1NicECfzuRTwMph7at2ruKIqZSaqFIMzZsSZSsE
	 1arONjkDG4zFu2FxdTa9PtJ4obP3rECO0WdIew7/V94lKe8lwd9bxBMejd6zLm7Q9N
	 S81QfbMXe8V5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B393760E3E;
	Fri, 20 Nov 2026 09:58:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB094E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD17D4020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqkQZJeTLxBX for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:58:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B64064016D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B64064016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:58:46 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48e46e449e8so428590f8f.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:58:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168724; x=1795773524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=51eOxZ2FNyiM4V5b/9ecX8WKkFGU0KrunYbixdCRTlI=;
 b=JV+EmmKQl1pN/hMJPTRcgbjLYuKMdOtOHqPb5IXur0zHIPRLHHeqgxjkd1GArz1b5B
 9fcRjmmrVZZa5sOql1CAhAUJxxEIkKx9ywWmQFka18/155FYZmazKru/9WQkW+H0xeBo
 742zOuRzViQi31x8hHGJ8eKY9RSLbYf7usBEuGsKS0r/IfnCCWVAe/w4AB64DTNP9rVl
 XOpTg63H68ntPLEFHH2qstiYsFtHMJ5hNgCimosSmv0iM72b5Vzya6xzd4Ov+adxEpFt
 L5N1feOBqhL+/PLJvijFSAItfKYsew1dFSYXXrb7ihCiBYfFV+iUaXbQeaG3goqyuECP
 RavQ==
X-Gm-Message-State: APuU4Z/OCKv6ivZnJW5XJvpC/qzntBDB1SfAjauYrXczIFwGerO4hVE9
 1SDb0ycjJpP8uNnkBPB29Bb+cczsoqgoJdfLA7DoZb0uuNnDXPYwts4js+UFoafEnKGwKdZArYy
 YxZNey0pTfg==
X-Gm-Gg: AZFdTZc3i4WfS4yJnf1sFRTI2Eys3wAcH9uarN55ak8uMCHUJX6P7n3pnc85MEpQE13
 6kfJrFUbrPUYIpVcTzQ8NFuW7Pa4Xu8gbjyA76+JoynkhZa7P24mCWRU94BAZdpTdmpSX4UqF07
 Nvz8ksbQS9HEhqSYi8HbeupO02OosDFbv/OngjcIeOpPkyfvFXChcAcJC5H2cK8zGNvwLGRsDQb
 kS3NW3Ro7S5b9bYdtg5kPtFbe8uzYgWH84xN3E229bl8lzafWHiraPelvGmIRWgAA5hJq5HHfA0
 K2XeozZ3WZioe4z38FrJu98lF/KfwaQPhaCMDuArX+INHAAP/ZcgHxeS6BQP5wVY5Ife5HvACH/
 jRoWkl+E1aElNm9K1zOrccYuWEQDm/yoFcyqVwR5TZm4tHS4H5s8NPCx8WXSSzNqwPbCfqkOEle
 p/4kol5XwGEy7WbdioF9jBWKo2D6fZX7cHB9MV4TxyATsnzn1PQusMjrS6WJtUvV89pbmG9SKCV
 h/cnZEdPfH1gIYyJNM5bw5YH2Csv2MH7cYV+CGeVms9qa378JaF98xBvhLFrRQoyRwNzo1bv+Sj
 L3HhZzX4qBnWfT4TZMlxTrAN5in+rdbyV/daDfTtMd/f
X-Received: by 2002:a05:6000:4541:b0:48e:6264:c373 with SMTP id
 ffacd0b85a97d-4abb400bd81mr2916107f8f.14.1795168724660; 
 Fri, 20 Nov 2026 01:58:44 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b10b5f6sm4250675f8f.34.2026.11.20.01.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:58:44 -0800 (PST)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:58:38 +0100
Message-ID: <20261120095843.538087-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109183317.1852200-1-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/zstd: disable optional
 compression libraries for host build
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
> host-zstd auto-detects system zlib, liblzma and liblz4. Updating the
> build host's LZ4 to 1.11.0 breaks compilation due to the removed
> contentChecksum_t alias, even with an unchanged Buildroot tree.
> 
> Disable these unused codecs to avoid undeclared host dependencies.
> 
> https://github.com/meta/zstd/issues/4897
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/zstd/zstd.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index c5a19c76f3..b0fbf3a1a5 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -114,7 +114,12 @@ define ZSTD_INSTALL_TARGET_CMDS
>  	$(ZSTD_INSTALL_PZSTD)
>  endef
>  
> -HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
> +# Disable auto-detection of optional compression libraries.
> +HOST_ZSTD_OPTS += \
> +	PREFIX=$(HOST_DIR) \
> +	HAVE_ZLIB=0 \
> +	HAVE_LZMA=0 \
> +	HAVE_LZ4=0
>  HOST_ZSTD_ENV = $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS)
>  
>  # We are a ccache dependency, so we can't use ccache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
