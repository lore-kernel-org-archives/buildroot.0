Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DFD606A334
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Vk9Oxv9W
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EBF281471;
	Fri,  6 Nov 2026 16:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEg1GXHjDQ-J; Fri,  6 Nov 2026 16:09:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5E9CA814A9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981386;
	b=G8UokWYOnmUgbdTY04HwDiGbzZl6+XuUwGCRsRWFMU/4ySK+2HNlErqxvcgDl2O2qqqb
	 BNqiVpunWRpg8D3EA4eo1rEfkttNyE1A0hEbSYbT1XXu0M9sl5jlV+uvmHizc3zMkDsVz
	 5/c78fLEyN2IfKGDY1+RjXAg6V2FjL7Y0zvJkZYkNRY/yehArgIUO8N1iaI1FcLsmMJ9g
	 Jm5aAhpPY1IV36+uYo1jldUVw7jw7KXKwL2xE0Jcc3PoApPYTaB1Qcy3/OYmCBlKQQ9KD
	 74LAQ9mTVWsQr2z8NWrRyGCK+1EmnqN0jeafWG9oAcaperWW7Ku5ipkN9tfsRQgQxvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981386;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rasz7HjTbHBdjqqfe9vrjc5JTv21K/1B2YvX12Iq7V8=;
	b=VjZ8Lggk0RET03SDHQW0HkFUpFHFrrcdZPF3IDCI6F64Qmm/4mXZyT+tmDjYX+c3LRN2
	 W00RLHIfnubyEfT1WPqDObHTwF0eYvpGD+K0bSJqIwSnenR7T3+VFUXgIxlwCrJZPq85Q
	 EzNZn5xbcWVJ5Mx5B9Ws9ZaA2KZKdwE2tH5cP8wV2cv1tgAOLHcmLghAm1nZ1o4qNWVjr
	 Lxs3znZiegVTXn7dsGYhwGSJW71LwnoQwLFwm58d2GcPCAR1WraCyED3QEL8c9+EvHKnN
	 r29rolCUhfvl+Ehz2kUEuDl+KS4CE9zACpwAIACI5oZp5j3/rTbYrs0XZS+OsUavfsg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981386;
	bh=rasz7HjTbHBdjqqfe9vrjc5JTv21K/1B2YvX12Iq7V8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vk9Oxv9Wxr95AW0QuSPfhxu9ebYMb3AaGncO2C4MFgsHGowtkP897JDqIPMerEjxo
	 jf/Syhy2JPz6RCx3Bm6wxlgsSOwZdoZSFm8rMDAbgpye58aum/2+6h3jvK5hZOEshF
	 Ji0sxDajduEkt6NMNQ+MucSMvGGkIqvt9aLghz6oT5C2TUXM38DgLtLkJ+GoMfwcTW
	 Yk/j3spTcvXDEMyaIzwPE122YIhkpnbQ/iKWv3O2F1EWhLspuWkApJ+cs7Pa+FLMIQ
	 FNCes5zq49T+BVCaQYNAtbBTH0e7SsX1RlZpgBhMqogJHDUZr2xh4yVH7n/g5Bza7p
	 hQjX449I68Pyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E9CA814A9;
	Fri,  6 Nov 2026 16:09:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D3A12E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C36581750
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wl63UQlUa9Tr for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 04B4281700
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04B4281700
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:15 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48e47347279so496007f8f.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981353; x=1794586153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gNuFCJNlTaN0S+7NBYYD8/hhuP2/ztYP9DZEiOpjLL4=;
 b=m2zWF50A9Z6TMeRb6b9mt1G4huSCRlydRDjr0PItXrh86piVUENI7KaoQ+Zt4oszH4
 D01HkZ3lURXIV/0gohT8N7kOoYJ1ku5Y3Li3MtQRkuc3J8eRH3iyKwdQXWAMZR7Rti+A
 bHeVbqchCbtYdxqqXqZNOFLXTwyivpyLz6mId1ARzgBhtHiZQKFcsCm+wxFEcJmn2rHL
 X53B/aS64chmBj0POxB6aVN2kXhQQ8YJ1ftnMcQORDfj49NV1GWNM/R5zaV+mo8TST9A
 EYwNPaqC5mZ6U6XeVy0PKog/EtxVcX10yw2al5QA7v2wfk4+CfVFs+Mmvg1VvYPdJUmV
 i8Kg==
X-Gm-Message-State: APuU4Z+aQpSZIBJ7wXBpqQlxNEIce3Iyh4pKupgCxezmyX/UT4X1gg/I
 Qdhx2QPXBRisUtq2iG+161siaiNefL3+047goDvDzgcr5GfeX9bmxR5Pb2O4y29mdvcvu7kN5U8
 uJ7rS8Oo=
X-Gm-Gg: AYBFou2O1FEs8gHpTXoUHEuJChjJHdL4La2qi/WyAgbLRRcFQMkKsNjQKCxnigXxRsy
 vrsnIjE7g8dGO0pLrvLsusUb0vwyR3twwo6K2Cdzj+IWXa+Q4r0FRKYr8bs/nwOO/j6b6qPeCvB
 L1oaWEZnnyshXg0nbeHF2hw4imxkGO9IRfisWsvX1ht8TH5W22UbPf9R+fTEmaF2yLzpzHzAMk6
 pPLIbRJ+fAU4MM2jO8zCMUHV5geTZ/6pdk5T+DXWLzbf3JRRZwut43xKNjKwNdMGoVNXM+589Ae
 HdmoFXWK4LKxbqiEfo2nQH4KTarBLr8U50ua395aYUjD2/g9yRgM4R3MDNbXbNeYo6s3yOe+lh5
 KYdmZHDcPBEccBNGyQ3ULkfy0OkmnZUQMKkKZtYq6AiXn9+GYfiX0UWAdrLdHFLZVXapuU+wxNb
 kWCb6AlKAF53EWslbRJYLfT516S5Du66CGDQ7ikH8Cu7jl6CMwdDJrkKgAlZ1JocOxMc9L9BjbS
 e2H+Xvz4Cmdl5xn9SCrCKDhH79Jf7MxfbOwxIYNoWlibEgNV6m5CTItA3R9TCHlBu+TyTfJRrh+
 rC6tSjtMk13c5Ab2l9Wlsy4+v3I3b54=
X-Received: by 2002:a05:600c:1910:b0:4a1:7e76:d02f with SMTP id
 5b1f17b1804b1-4b6de4a6b88mr51215475e9.14.1793981353626; 
 Fri, 06 Nov 2026 08:09:13 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b56e58fcc6sm267081535e9.2.2026.11.06.08.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:12 -0800 (PST)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:10 +0100
Message-ID: <20261106160911.607044-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021203410.3114473-14-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 14/16] package/python-platformdirs: add
 host variant
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
> Enable a host variant for the standalone pkg_resources package and
> include the hatch-vcs build dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/python-platformdirs/python-platformdirs.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
> index 55aae1e1af..0aebffb6a9 100644
> --- a/package/python-platformdirs/python-platformdirs.mk
> +++ b/package/python-platformdirs/python-platformdirs.mk
> @@ -11,5 +11,7 @@ PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
>  PYTHON_PLATFORMDIRS_LICENSE = MIT
>  PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
>  PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
> +HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
>  
>  $(eval $(python-package))
> +$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
