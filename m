Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000EB606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qOC3txCB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D01DE60A5B;
	Fri, 23 Oct 2026 13:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dx3TpKzIpkvn; Fri, 23 Oct 2026 13:21:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 923056070E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761701;
	b=rOa8iydzyRzxRjrZQ7VvFMkWlqCsWkkti0lZ8tHqVUKh1OoRzxMkCqO/s5sRyNX9Ia8+
	 +T7IVLKb3hvbNu/YwXeUbF3B5S0UnEnxfSKX/flMn2FPi4IYS8tFebSZHPhoin/V/WGRw
	 mF9WYoUHlXkQfOmMo1seiZS55lUydOjIZqc0xHf4EPp0QwO/2M9HjU2GxNN+ExSVENX1L
	 HRhzCVg0xnQbMPxMVjsBo8tf89IIzkxSjOQaxb57JOTRB8X5+EIlfdmsLiTiIVtScwwKc
	 itmKB5PiqdXE3r5+ms6vFDzRrAO+IWm7KU5UXCikLbw85EKBVKlP7iQA8gj/AzizH7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761701;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=EewzErflzBn8GU39uzK1j4klUlTN9tw4sagnEo8GiKk=;
	b=i4+UOAtt5W0CaEF6UYJows9njrlFfeuoTVC9xlp5gvrDYf/P1TBvK83jA1iOd+oHeaSG
	 viTUKxYooviiIsquXgeSCOWUZ7pruZ6pVQ5QRAU+AnnnovbUpztHSUdpzp7938fVKNbq6
	 AW82ToQp2TtqYE3aodib9MxS+6k7qbGzvfxdhqHIvdOpL283/okLDfTbrgKpm9SaJchci
	 bnio23o+cDghMuL939RK2zV/wdwrTn7nBDzXcHvQynzmnv/FERJHxEbZHU0QnBQGDpIIb
	 4+YsXQzfwD6dFAlrzf6Mj2lmV0RRoyJZxAfJAURZ0J7ZK9mMxj1dPoVZh5Pzad7+fuw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761701;
	bh=EewzErflzBn8GU39uzK1j4klUlTN9tw4sagnEo8GiKk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qOC3txCBu6K2L5OgPAm73yogiOUYsNJqWCiAtlfflHILv+qdZH7r68cFKWEvW8idx
	 ZPKjKiPKl5Kxu4r+VjzBT4hHwtBc+Bfw3DWTK6/qTjqQuHfR34sTvMlRUXn0lrXvmX
	 XbA3s+1EX1jCGUfxeG/CCLWsqGA5eibY+YeDIzoLr3bceV+3bUs6l6u7x9Km1T6wjR
	 WLTJL9/z7D2R0Z+IVVHUOPb5uDR32cjgmKUulTwWWCX3ClR6qptTexK/B2zwnvAj/Q
	 /zKVfjpICIXy0aIHqSror74XnTBkrbXrN1Pl60LxbKlnSJE2HyWcnc/oSnFLaQZ03d
	 cUQqIASkLWwrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 923056070E;
	Fri, 23 Oct 2026 13:21:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61ADE356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4724B8148F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDh83tovADX3 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 203E981499
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761698;
 b=ka1xQzYZuBPDn/O9KisKND0ne+xCfPPxuay/JBiATm0c+b+1XQ5OSvS6C7z7WhaZWXZ9
 Jdnnpc+yvsU4MvxkkkIzwfVpktgytPgabL9bNdEHR9wEtSLrmL81Ffhhho9EQCbDXkWGf
 hCbR14yhy3jI/AiuyAyg4dbtUE8AN6Biw7cgnqiAOpXaV/hmvzaKxuV7uHtN/l6gAJx7Z
 gOzTQerJ5Bu50JfX+k4K/388E2enFbFEhqdrvxLB4VpDLmT72Pm/JQ2Iib20xOFOh8qXB
 SUXDHr6u3/BskujPb0ohO/nWcpgZnlx2oE8MwBozGYQ3Z656jR4NPEHSsOErhG1NaRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761698;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=kddovs3io2BuGomXrVu5zpOwCmeUFe+WEv2CgJ14t0E=;
 b=Eu9iusoYbSlV3oNuZfuF/PcYKxIAq7a3xLsmRY0ymj0Ve+nV5NwX7OS1dz6MCjOUVJ8C
 aXAOJrRdzduxSXsgegu11UnCpWe2q1KWER1XVWq9ZUkZZKCIX0is1ZWQvuXNZSHxAeCO3
 zqkue2O78mnRrrmlidGCTBMI0A/2AYNHwEEBT25IpuACXj7i52n0j3lGvtPmB0UQZ47+n
 8vl5lWgTV9rNH3cxkFLNradQnYZf3oOGtPTtpdW4rZciXOelK8TDXCeSeR7Dp+6UyRj6c
 rGr6gHTIVQI9uWPsFAXpb+ehNyuiC0yZMbGUaUE4yCqHBnMlVjjtyScOBg2ZUZeIo9g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XogFhmUX; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 203E981499
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso192295e9.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761696; x=1793366496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kddovs3io2BuGomXrVu5zpOwCmeUFe+WEv2CgJ14t0E=;
 b=bIRdehJarQHyPg+e/Gk0HN5cK+jcG/oBn1c55R7BY0UqlBsSeLi5X7GI7aSDMUvL7W
 M4WF22Db8S55rAiiIShxp3J8AWko/KgPTpNlKGV/v0rzL1Cp0UMchpsnDSqAwAOS+WNq
 T+H6/qRcO4GvFPKb4Y/o7YPai5DdwdpUK2dEPV/vwUqxh5294Qtl36/euD7pFTwIy7GK
 uRCrUTyuez6+OWQ6+MtTECN6c7CQLLCUt6YoTno/Oo24o5BDCo9wMNDSQgIUDWrKrnvB
 iQgXruzKpTllwo3eEDDQYq0YBDaVK7acDKdDq93I2+3qx7osDER7dsbj/bgx5Puf7mce
 MuBQ==
X-Gm-Message-State: AFq9FYJMaK0NGBGcI4nQOeD+qz/B7Fluz6f4wew63PHhcXevH53HIdEK
 x/iWee3dvCF0R6vRejg7MZ/YdVz8SwhM/Dq7EPMwy7MTlL+7UnWtBVBrhfIYa0TE2qPJHFkQd+b
 7x+EmN3I=
X-Gm-Gg: AYBFou0SbzBG92yQVXBxaR2HK7gKY0xhOxZ/Jw1zgyrdX2GdD+HQb/tmoxIaxEq2LA/
 5fHPlDgbi6PmlDL5V8OVpW2AwORbJmjs36NacYGpWCNZU+icpDg1sytEf1NJ0lls6szYrKppsVC
 74pdBIVmd+fF0cpyBJGSxjKN5h/k6bjbxZAhibc0XSsXEOcskYOQYRatQwM1qbM1vYtlMgYEDe2
 t9JIO1fu5IBU5qc+tJhNKI+WvwvZLbKJVlh8SimBa96In2gbE/NW0jeCxMBIkNlPF4TpXw7a4zd
 3aXrPmq1Y2kSL9f4wDHFdyTETPPucefhsggYu7budlwkzWietTeYSWdQmsA8m9njynTCvDBz8Sr
 D8QLFMzbkJPhKkiNKAzKgQxeOH3o2Nu3NTMayEggx90HresYXjF1YA/NH8vUePKE4Fpm+UjYOGc
 Lr8ZtvoXir+FL/LWA20c44BrAm+1qvrRZd6McqNecmyMeJOjs84X5lusne1N/4xAj/0VUefvLwz
 lWnNRS+amFUKgTHbChEvobJusdQwuEMj4lmuNg8Yr1O7v7vEX/Uem3RhA==
X-Received: by 2002:a05:600c:34c7:b0:4a1:f99e:f22d with SMTP id
 5b1f17b1804b1-4a211c9de3bmr40153835e9.6.1792761695823; 
 Fri, 23 Oct 2026 06:21:35 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a21555d543sm25767425e9.4.2026.10.23.06.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:35 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:21:32 +0200
Message-ID: <20261023132134.1608040-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261021143606.428870-2-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/php: security bump to v8.5.12
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
> This release include fixes for critical remote code execution
> vulnerabilities:
> 
> - https://www.php.net/archive/2026.php#2026-10-21-5
> 
> See the release notes: https://www.php.net/ChangeLog-8.php#8.5.12
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2026-109618: https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w
> - CVE-2026-109619: https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2026.08.x. Thanks

> ---
>  package/php/php.hash | 2 +-
>  package/php/php.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/php/php.hash b/package/php/php.hash
> index 0f2b6785bf..e1e92781ea 100644
> --- a/package/php/php.hash
> +++ b/package/php/php.hash
> @@ -1,5 +1,5 @@
>  # From https://www.php.net/downloads.php?source=Y
> -sha256  d9be75c08e8c316f4c8f4194d8fbe1750a15f6a6d9d4e3fe72082abeeb800360  php-8.5.11.tar.xz
> +sha256  08bc2eba2a588654ade1357174aa646b761556c862dda0678345ee29ed481209  php-8.5.12.tar.xz
>  
>  # License file
>  sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
> diff --git a/package/php/php.mk b/package/php/php.mk
> index cd1270be57..1bb25d0863 100644
> --- a/package/php/php.mk
> +++ b/package/php/php.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PHP_VERSION = 8.5.11
> +PHP_VERSION = 8.5.12
>  PHP_SITE = https://www.php.net/distributions
>  PHP_SOURCE = php-$(PHP_VERSION).tar.xz
>  PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
