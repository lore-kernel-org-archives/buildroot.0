Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E84A606A329
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CXFkxZXC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12AE240779;
	Mon, 16 Nov 2026 15:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-02LiPgkQQM; Mon, 16 Nov 2026 15:39:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3AA974054A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843588;
	b=fe+LIEf1uXX0nx5LNM8WVdiW2UzRt+fL9qYZevK8fh6ZDbKvqSvduXJ/MVj/4eKHHDV+
	 U+NUf5twQ3A5B1ybJveTBiKwXUtZH1RvOO/wvuaNDXoxar4YVxfWjMG/3XoHX2Vxu2gDG
	 c8KJYl0b2t2rs011BP/C2JGDh2UtylFMlik6JnurD6pccqh6LBMTD88uogwaYyrgnc8or
	 tDRhv0CqzH+m/m6IBb7KKCYjF5SiAixLLeRAuuBJ+ir6/UkUzmw7xZV15AmSGlAve7syN
	 XmdqNxH4Ls2vhIUW+cqSK7Dp90FhgWp6aTx26X2TZtKyIWg0cGNxthYkEUFZoPpMsVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843588;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qfz4NfhAP9hnzomisX8i6mt4+JtnXWHX2nwf4Zudj1g=;
	b=LI0lF+BfcCvWd2uLeHmbF67WWzstO+8u9ZdBzS0/8ykRJ9KCo4tgreebvk+vyh0WHveZ
	 EWOCKyVZ5ZvR47pYEo28MRGowXQNvPLzAC0tveo0DtTcD2inkdsnsJVXlgCIoY+a4bW6W
	 COQ1A71ksnmSXy+Ji53T4V5yOGitvazgDBn6RveGufx3guhoX0Cs/Lrih4dHCvk6Qjuv2
	 ypdW0bBWJ5SRlAVUzTtF5E0UP5IC1yB5R/mx4PBdKneU1q+nPTgDRcXpAnp8KUZ8VZMDu
	 y4bF2+jhZqN/Ma4qBzumVVj98DuwXI3X1/RBtpcIzibD5G6bH2lLkb1pSe2jd9TBcVQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843588;
	bh=qfz4NfhAP9hnzomisX8i6mt4+JtnXWHX2nwf4Zudj1g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CXFkxZXCOQpAn+E0wSBTRKMQGF3i9dGCPonmB+Dy4ibhJthFE9Vrcn2l1zPLe532g
	 o0TxJcnwfr24syDVddXXBrt5cTiGq2/5lif4YOAkLV3WraAqx3LtWC+3C/FRwEwzNa
	 hvCt9YA/euoh5hASBem29gZN6WG1j2jfOjkJzyJZd3BQ1DwH4iImksxc4358qXT1oC
	 h3ra3lhnOFPNkPGwToExQAz6ZdYSa3NFMFkqqyjmXzhMH5RZJl42II31pBv2XGHqge
	 EsQI9rd4BUF5Zk/yeQu2fQhw+Nr71u9JCOPcs030qXrqRaY3vrZeWfX5uAlNJDE4nb
	 R8FfYQojOxpIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AA974054A;
	Mon, 16 Nov 2026 15:39:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A4DB109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 846E140740
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-LZZzgvrJtZ for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1821B40705
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1821B40705
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:44 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-491846221ffso3305435f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843583; x=1795448383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w3tAi5DVybwLhxyIZFPCatBF4PciyZGaXix0OzXPHSk=;
 b=U97gFyYdgKTu6vcegUdhbej30gTKXUCXWTKssJsa6y5yv6YIKkLdt1wKSldtTCgLRO
 vohQHVVfQipOLNPhlArxRsviL9vhUDb482FRm2Xwbpg4I25S9KPvhIdjsjGOFzhwBj94
 1UbhFOy0mzTY+UgiGevu2zbgdt/idvs4DMl85AQk54a/YXst5MbsDn3xS8oa42jpV17J
 nV/paZbPbuxtS8R7o9fuBMKv2XcJcBbsPCCP5PaZ8qIwkOEjHWXrteXFLxllGWviJrz/
 hQMUuB6q9Iaargadq6zZBGeKEcSimlZT/zDn/KoWj2VnhdFAZlgrD5nZjWIkxuEmsoNK
 CCVA==
X-Gm-Message-State: APuU4Z+T77iahwIaU+G4JQewRWb841hbgZrrFFOPVB2Eodtsi3aAX/iZ
 xGwvgbWXuEz+VoJQH9BPvnzUKV3ao5q30VfQZx8/z2q2VYLGs6AeZuGixVTot5F5EwC/tXtM9hz
 L2+TUSO8=
X-Gm-Gg: AZFdTZcYfTFIaMZkpthacrmAEL8yNWrz+dHQX2PlTbobdRJ0N00N+PKwZhx2OgNONpj
 dgwRCtmpS71GITaybfxDJndayEZ7UJpFBuMsFmIqtC68gofzZcxbQmZjsWJ7V/XgAUYfvTMaLI6
 /2ZiGOkw7z1nnEufMBEuVAEB67MWO8/ikRA+wTa+IfK2Aj2TA2ZtjzVxgxoNrzi9FPW2XQDZ4gm
 sBK6j2xAuuxIFv4VpyLz9FOw7PZwft11+PHFv1exCOhi4+swXZdI+oCKExEn/6u+u8YR/R305JJ
 RAdtUoO6jXielOt0mSAMDjbqZvglJTokP4m5fQEfij0qys2aC1eXM9vBZOSCnzjlKbXLXpivave
 E8TZCVEhi0E0/BnEvudWLvFC7c8MiMK9xmFNWfmVWlCoftdRsjbTXzXU8CWOWHz4YqE5ZyCEyfz
 lkySZN1fKR91olTSKeqp255bG0Z5FLsWdd7bCeR56kQlfrqEAlPMn0jvxD7mlHP5g0wYPc2tU+U
 eYu8Ow00VHifD1WEEw4FYbWQlDqgZyifMh5RlErNxtf1XnpvXhGu6ptqduC0FJJpQPBLkx8otEY
 t9pDddy9KzVjf+BZv+FZYl/QYMyPDrg=
X-Received: by 2002:a5d:6f18:0:b0:48e:669b:76e9 with SMTP id
 ffacd0b85a97d-49c72ab1190mr20510538f8f.47.1794843583008; 
 Mon, 16 Nov 2026 07:39:43 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f5972a7sm21809148f8f.21.2026.11.16.07.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:42 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:40 +0100
Message-ID: <20261116153941.725541-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102201237.11307-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/liburiparser: security bump
 version to 1.0.3
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
> https://github.com/uriparser/uriparser/blob/uriparser-1.0.3/ChangeLog
> 
> Fixes CVE-2026-48841.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/ae3ea29b57a932ff3a6a5e11d4751ef6f94a0956
> 
>  package/liburiparser/liburiparser.hash | 4 ++--
>  package/liburiparser/liburiparser.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/liburiparser/liburiparser.hash b/package/liburiparser/liburiparser.hash
> index ad5bf40d47..185476922b 100644
> --- a/package/liburiparser/liburiparser.hash
> +++ b/package/liburiparser/liburiparser.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.2
> -sha256  7b2496f9622b4b201186a3d159d278605f1fb7262402a10cc1c0824889798b00  uriparser-1.0.2.tar.xz
> +# From https://github.com/uriparser/uriparser/releases/tag/uriparser-1.0.3
> +sha256  a327e438e238d6c9093f1845acc44dec20d4264639a3de1f3caf0927bd852e3b  uriparser-1.0.3.tar.xz
>  # Locally calculated
>  sha256  287f09e6546a9610f949f89e8fb937cacfeabd7bfaa8c8a0c18312193bf04ad3  COPYING.BSD-3-Clause
> diff --git a/package/liburiparser/liburiparser.mk b/package/liburiparser/liburiparser.mk
> index 9d1b9a1aac..eeb4e5da1a 100644
> --- a/package/liburiparser/liburiparser.mk
> +++ b/package/liburiparser/liburiparser.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBURIPARSER_VERSION = 1.0.2
> +LIBURIPARSER_VERSION = 1.0.3
>  LIBURIPARSER_SOURCE = uriparser-$(LIBURIPARSER_VERSION).tar.xz
>  LIBURIPARSER_SITE = https://github.com/uriparser/uriparser/releases/download/uriparser-$(LIBURIPARSER_VERSION)
>  LIBURIPARSER_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
