Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A84B606A335
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TDf+DqwF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 195F140800;
	Mon, 16 Nov 2026 15:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9lYUnT1WWqb; Mon, 16 Nov 2026 15:40:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 38C484082E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843627;
	b=mZ59zcGOv8GSBm+dZU0boxew7OuU7E1hit5n2Nf7COFBm1HPe9lowc5wqOkBt2fr484u
	 uptPSneOWlmw04v78+yjHVckujVJ7KJ+PjI0NOXHeU+LzdoqaSH4jsFTBMVh+FQjTuydG
	 REcmy82L7mn5gHRucJ+sXFF2kEPgAsEu6ssyeTpV61TcW/sWNIBg4H9gkh7Jg6NMHsNY1
	 VCjoiUA8848kt/wtbi70/w1v0Yb5ZSv5N7LW0QPYaCGojj4r+25gTAZryxg3Awn50drtM
	 S68WkmcJvuqtTvO/JpcMrQxEyuDnDg0JpMBfk385MVyKB4xVI9CdE2sOtByrujaDtXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843627;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DQVeK3xpGepU3FycAZPlBuVoZzzIAi/6sZY1qvtFRKs=;
	b=jC9jyqkyliS28BpN3aSdQPshT6lpQ1Zn5pEHcOTP3uRqGHbI/RbtgNhfYbOxDgSjmqSO
	 St4cTTB8Ja5Kq8tGjNRErqrDfdA5+wVNIdiDiKlXRhzBIe476FWMDJMZXhA0TkxhASv6/
	 nB/d6fLOg2zJGGqZ2sN6BSk7H4ADgT+5y0qoN/O4qblqXzA7uDpRroj5timsV4F009QWX
	 T7H14CEMaMHZYEOOl24rN3oaP1rZ/F2iPVzsW/s0FaVWH2bOQax10zyiOse/zFIqfhAJJ
	 nZUegmfAYmuB5j9wk6Qjzuz/Ot4VvpEa7TjqOKzAnAl/BpmcxC4oK8ShukLGwZ31mLg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843627;
	bh=DQVeK3xpGepU3FycAZPlBuVoZzzIAi/6sZY1qvtFRKs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TDf+DqwFhfR4G1YgGseQ23YeB6AQKbb0SRgvwH4j7rcszPEkfyvKZMEhkJrS2utXC
	 o48OyV7M29d+1BG3vlKGZCTU7BWgXm2K+duIDsrMsXdd/bdtwBSkDcIUCR5zBeu69p
	 EmGpbXm3nvbYiNFCFGLu/Q+YR8m+F/99znhnIBgg3wKP5sWjC2uczDHhzHLK0eBp39
	 MjxPlHdjqcn15yw2hfMQda1mParWlQcGPdo18NNTRSOzbGgsnQuSQpxqSvkolUK/rh
	 exd2go9UL++X7eAO5545gCkC8QOFol39uIwx1h6+2u25X4jh029Lyym5gMM/ayFHfM
	 omxsapwd36rug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38C484082E;
	Mon, 16 Nov 2026 15:40:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EBE0109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CCAB40282
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSBxs9FVxmhw for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:40:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1C7974009E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C7974009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:40:23 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so1795669f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843622; x=1795448422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=D/Fi2NHfHClVwGV5aZrqnrn1NHvMvQBO3+aJat1MTvE=;
 b=1Yk4f9t3RsnghHPnRxofWMJpqTVUCK14D85quvAIRaV5foi5sujYBXgAq8TltVuGV2
 x1cJNL8i57q/jFFc8TSLeWzKODhMPxJq9n+VW2+CpfgJGzuoaKZbKJrUTo+n61wA1PSN
 His4Yf11xJOHlMBewYW21bTQiNzuYBTcvgC9JC1Bto30PDh5WTelhGPNARaTfQxLVont
 y3UsjWeQwbPSPnrUnCCfu9U35DhKFJGaoIOPmwehlwefAtpvD3jDaUpaMaJFJvfgdK1Q
 jfJblWAA67ymb9fzNssliI+CWV1d6Ug9ilwOdBqb1yto/tgx4gA/QWWGVz0TwKbamUYN
 ky4A==
X-Gm-Message-State: APuU4Z8q7b4F8FYVCxNAr+7kpH2UKGK3onNxZIzLk9OOKPPRPsc3uam4
 uaMwhI0TRkg7EhGV8hfPWrqiwV7k4VYewxtW+ULHAa53Z8AclPo3hhiiyHf2qc9C+7dDvVaYYBL
 PeH20wkY=
X-Gm-Gg: AZFdTZclOV7R9olW8SQC1mM2Jms09z/edQMTNoocz/AUvQTCg89BSZHl8KhsdIG0Ax0
 FmwPzUSGcu7SWeDNfbxci0U6tcY0E9/w00roXlarlCfXycY84SdixPO8yJNgaD+RKj4aWzpqHJ3
 D0k4Sug6tO60TZJeAZj6sRy4EnqiozpdUZPc4suKEvHit8KZS6jBrSFGB+XAmHVu8mprWOdSpmW
 ilLYAC5vgd1BzTmsOKlwR7sdm3fUMPBEpvkxMO96XHMf4/+EsNn0SN1U8czCA0s+qLeycbcNHTB
 Zf5BXPlCi78S6VW4C/tKZuSG3x1eVCB8EzJN6JYe5nDyP+zFCXlp/OcKyXATqA04BMNojrJPFjF
 pza1mxyPNJdMQV9COwRFwEqrvZVha38/pVMDrChAI9dkESYaqIkrtoKbg75/UMVdL/2ViM2VN3A
 LKyUpLyPj6i6ZnfQD4+RcC2QyfMjWvRUVZe51hgVCQVIrLNVgY9ql1ypy4BsdDWpDst35BzUAQj
 BhvupRon9bSCpJpAwGbwG15xG4jYQbswoyXzTwl04i5lg//GVXrIdP0cEGRse0EYkS1HzbTU7hr
 M4RZJHF5l4YKWINQEP1dYPMqXzmcy4I=
X-Received: by 2002:a5d:5849:0:b0:49e:da28:4d40 with SMTP id
 ffacd0b85a97d-49eda284d6bmr13384037f8f.19.1794843621848; 
 Mon, 16 Nov 2026 07:40:21 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c60da0a03sm18433406f8f.53.2026.11.16.07.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:40:21 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:40:19 +0100
Message-ID: <20261116154020.725896-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105201253.1384280-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: security bump to version
 3.5.2
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
> https://download.samba.org/pub/rsync/NEWS#3.5.2
> 
> Fixes CVE-2026-119741.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/d5959de51611367a3fb0cc5e8178ebd7cd0e69dd
> 
>  package/rsync/rsync.hash | 4 ++--
>  package/rsync/rsync.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
> index 3fc2603049..183ffe1af4 100644
> --- a/package/rsync/rsync.hash
> +++ b/package/rsync/rsync.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/RsyncProject/rsync/releases/tag/v3.5.1
> -sha256  c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef  rsync-3.5.1.tar.gz
> +# From https://github.com/RsyncProject/rsync/releases/tag/v3.5.2
> +sha256  a10d591825251e070f74c98df3daad195def4ed81b4a2de16169026aea33f6c8  rsync-3.5.2.tar.gz
>  # Locally calculated
>  sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
> diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
> index af18dbf608..29250e928f 100644
> --- a/package/rsync/rsync.mk
> +++ b/package/rsync/rsync.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RSYNC_VERSION = 3.5.1
> +RSYNC_VERSION = 3.5.2
>  RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
>  RSYNC_LICENSE = GPL-3.0+ with exceptions
>  RSYNC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
