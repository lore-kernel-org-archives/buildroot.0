Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C81606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Zc/7A68I
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 403DC60668;
	Fri, 23 Oct 2026 13:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pto_RFx9Raba; Fri, 23 Oct 2026 13:19:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B38E6070E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761594;
	b=m2+uTEsP2eh4wkXUOtsw4O0ABN9fOGjfcesmabXnBZEIDlUvfMpTmYSdPtMM3mfMV6/f
	 SWUfweEmVSSggi0LGp4xMIWhJNxLqM08Vhrz5sFKSdiQ98tOTd0Jm3q44ENlD4wry9PLI
	 AIrhm9K/WJq+aF2+D2mhzuteGn7VSv1KapNC3FV22imV78CEfCvxlF6hupVcloUl4NujI
	 TW4TJb3HwaVw00el3U1YcyQpSQrxjVIxz8CHQyUeO1xqBpJjOXrLm1ZG6cz7LD2dJI0iA
	 tIbeRVv8bEdqyrgXQpGd/qhptbDhywPbi90rC0rP1bWQk254ztz2JthWX3sOm2ughOg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761594;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8Mx6k4c1spABvcjeoY4p5r/2ssCqWEGmRUarrZKIPQQ=;
	b=Yhe4h9hXZyVQKpTNTYcvfVw8EsLkv8/OnUV3wfZqGs+7X/SDawyogx5hPXpWq0ySQNMO
	 MfHjxtdydiTyLVuKb4QewEiRcQr/B77gD0C84JwNNfXxlYlywt33reuin/upZPeLhI3iU
	 rDKmwPXjsthzml4ahYgDrWzQYZFubqGgtRu6JR9BTUXo84GV1h4LHmapG6qwAiO+Zmcr4
	 VQm+ypgEakz3iLDadFOTO/Cy/wFy8TF/ugaVb4gKgGuiTmdHwfFKzpCP3ruji7K2H+iXJ
	 2gIBqZIaHqh8FsDC8VylarIs+npRscnvkbK4Z1JFSJw/hU68rJBhdoC1GvkZEApBwrw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761594;
	bh=8Mx6k4c1spABvcjeoY4p5r/2ssCqWEGmRUarrZKIPQQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zc/7A68IxoV1iWjsylTkBZdl7t5iI9sCJMROwLI/Kwt55ri6QI4AgEs46E7gT6Oc0
	 eXJDo15H8uFxhRse6ESjjS+Q5FfSknpYp8YjafZqo3vuskPYvvqqlLmEJhu/ceYZAM
	 bsSxTrGzCuhPuGYWP4n3CY+poFUc/0aJJ+J86tWzgpUKOqJu0L0gQVsCKLOiYDuy0Q
	 s9XHmxjEF7P2RLn9x5ipWBJhMPtBrlwj6Uy8YUmNaraV3dmHdJNLewf8FIY6fE31Aw
	 4uDwHABqK353UCuSirqqpK/dXvD8X4C8zC3RMRLYpD0iEEUbyyv6+KOTmxXJYblh1y
	 3N+81y4H5qyzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B38E6070E;
	Fri, 23 Oct 2026 13:19:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BBBE356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 815D6408EE
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WUPpT9vrfumh for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:19:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 38204408EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761587;
 b=DmyFk7lk4Yv/ACv0Vdnt2sj7CNGTWDaJDM13njwio1TvFmuSUVn5eEzs/F4EpgSxmflm
 Rlpk1Qqu23z4Iw2/LOHfVTQubVSU0ErEFKThrtBfUrCCxeSq++9MpkH+17sLCgDmBeVMs
 6CAcWAihzMzCjfpaoCsnx2acN/l/RIM/bh/q3i8ioGTY0uV9vwc3l/3z2XAocMa5Wlwda
 14piiF6D8IpyPYFpV0noMJcpEgDTyrc0Fbt7W2jFj04qCdVZWBFhGynHMBjg4YK/YnW1o
 OtvV8QuOH4ccbftdve9U0d6ulOv/mY6ZBN7SOHjXP1bG0E3/C8SloUK5IPxjzCWbuNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761587;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=yVaK8U+DbigQ94VwCHQOYbRmqwSrjiCuPGAnkVJOd6k=;
 b=oE/p6LaBdbWNBbAggQlnp6+hjnlizoq0UpIHl0y5LRDxrS57iwbK4gUkmF1l9aEOM6l8
 JYF0qZTSVdmT1s/Xp5bwdpcXqWzTC0fzBMB4OSGJqRnvKu6o/B6+M/K2KpVrJ95TMg5nK
 BV0i4dwlehC8B3ahr7VUMtLiw2oa9cKVDI9MCSheMzvuJ+mFkMQ1+LtDsmTjrZYnHT6vV
 MoFqXjlz7LfyyzJRzJl0SE2ID56N+eeYuNAMRmZSkwDwB20hg6oWmUQBFfqXaVhIXUEoy
 Yijp0cXzXBFty5M3eKZlKNyafnIgNDw/vkQNbsv5PiE8QJb/Q2Z2CH/HwNVfdP9swMA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fsvipKBB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38204408EA
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:46 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a20b122af8so7650305e9.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761585; x=1793366385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yVaK8U+DbigQ94VwCHQOYbRmqwSrjiCuPGAnkVJOd6k=;
 b=iwnminFI3nbjaQh0GWaUIDt+c/ioojGxfXToYoPuGwW4IaXbZDb87M7/fpEV3Mww7v
 EsNweqDP2HMDg1od6QL+NAxgdCgIVpFwHYjDsoHPhoqhJvuTrY9qlJrXzl6D2G1NyMGZ
 8UTXLvndXsENixP0KDSVkcI3cTgXzZMQQYPo6lLwNFSEoUbHBnJXBbT+GIQ1L4TcahC1
 xxkESO+Xmta3DC0/Xo1axqHMr+aQ0IzrcGP1SRc5oLN74q9mCFBg1EWFqkUdXGSYCmsm
 wbCVodkysr+O+aEGKSm09zxwLF60CfJkJNzZYi2pAYowgqIP4Hf2MxvisKvLZv6ByZYr
 FPLQ==
X-Gm-Message-State: AFq9FYL1so1UhX3Ow7rJuT1KIceJFETh+HUgL4TrE47+YNmHx+lBnCWl
 iQ9tkrB/xIXbnP7dlWd4eD07LPYp+5Xy9ZOZC0GnkXGFczVRyBjVnpJQCfaR69+KecekPwQUQMc
 kHHc6LBk=
X-Gm-Gg: AYBFou0bG/4U1hP4Mk24XEqjiEOZIAG1lvBDO+Pcj5nuH9F/Cz/NoOLaPi73JAlXAX+
 wQAWsNwnLT0OzgmYkEl7i+EE8BD89iKl98QYA4fnscCaR2zGdyUqLVBlpbSkSxAhrJdo85GTQp/
 ShKnYQOLUxiRlfC4e/zG4oe+NUL2PIskcYJKAedOPzIZPlBneWL9e2njBNtwDXfeQwhMrepIWz1
 aow32DLkm8R1al+qP1XWcKg+KXOiTKETK0HgjPMNXHXpwFFmR4rrwl3Lq9GdMK/qdWebtA3j7RI
 7nCChhGjr2YLABlSLi85p7PNWCHTjR1gnFTUvngHbHmnFgfTW0hqESjyY4uGWVOZDzV3mGoGvUi
 zv9H7rdNOohi92bHTv1yBpFLWUIipxpboxmoagaH6+N7h9RKrNa9v1Q7Z3fcOTK4sYYZGWvSNaV
 wPhoegmqBtIVin1vQU6JEDY/nERzxGSKnwarrLUowmBaEqDJ8o+xnzuYSFp6VSVaBwQN06pDyEU
 OO6YSoqXK+Uyt+CwhUgthYGE1CejD3Jq4gphdxUseFHZ+yFDO7pCQ9m6g==
X-Received: by 2002:a05:600c:1d0f:b0:4a2:e0c:2b0e with SMTP id
 5b1f17b1804b1-4a211f03f55mr39837145e9.22.1792761584939; 
 Fri, 23 Oct 2026 06:19:44 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2b065eba0sm3811185e9.14.2026.10.23.06.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:19:44 -0700 (PDT)
To: buildroot@buildroot.org,
	James Hilliard <james.hilliard1@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:19:41 +0200
Message-ID: <20261023131943.1606387-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003013304.400979-5-james.hilliard1@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2026.7.22
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
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/python-certifi/python-certifi.hash | 4 ++--
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
> index 5f4706fd37..a0c24e66f3 100644
> --- a/package/python-certifi/python-certifi.hash
> +++ b/package/python-certifi/python-certifi.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/certifi/json
> -md5  238385f505d22767cd1860661f1c5743  certifi-2026.4.22.tar.gz
> -sha256  8d455352a37b71bf76a79caa83a3d6c25afee4a385d632127b6afb3963f1c580  certifi-2026.4.22.tar.gz
> +md5  926857e560a3ae443ee35c2de270d75b  certifi-2026.7.22.tar.gz
> +sha256  741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55  certifi-2026.7.22.tar.gz
>  # Locally computed sha256 checksums
>  sha256  e93716da6b9c0d5a4a1df60fe695b370f0695603d21f6f83f053e42cfc10caf7  LICENSE
> diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
> index 474b147873..17c6925ae7 100644
> --- a/package/python-certifi/python-certifi.mk
> +++ b/package/python-certifi/python-certifi.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CERTIFI_VERSION = 2026.4.22
> +PYTHON_CERTIFI_VERSION = 2026.7.22
>  PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
> -PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/25/ee/6caf7a40c36a1220410afe15a1cc64993a1f864871f698c0f93acb72842a
> +PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/a3/c2/24167ea9858356b47a87a50d39908bfdb72ceeefe0041586e704e5376b3a
>  PYTHON_CERTIFI_SETUP_TYPE = setuptools
>  PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
>  PYTHON_CERTIFI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
