Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD52606A31F
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fkU31oWN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 080894099B;
	Fri, 23 Oct 2026 13:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRTDynJJI73B; Fri, 23 Oct 2026 13:21:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 00A77409A4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761685;
	b=rEpcSzeKODLTEdVEM9XGHPIn6tfOTOR97NgeDjiPeS7uGZeP6U6ivpSsdSXtvxWIdGon
	 kSDXxJgYXm1a9dDEZacIoxaXhrSQDn01KRmbBlLR/d/lkrCm7J1bMLonDye2ABeI1jErK
	 RQTnO1cr+ORJPoCziTjuAlusX8mSdcKbivvkCtodOArImudEOzM8wFG+IX6TWptwpS5fL
	 BTolr0Bc7gFWxEUjxV3VLCGI6EkdG0zRiRWy2CrG06MDS99mdP9woneNUUyHjzuM+SmYG
	 efT2jj+wVozBcktYFke0Djrm3UqYN5v2Zb2Fkv1/b5qgA7GmKdDYIyn2dpTEgtB9RhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761685;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=mqNBpwDPP2nz/4tpJ/LgrDYThxH+UEcIhc2vOVD2dAM=;
	b=j0TvHVFaZNkgDjik7Te9b8mP+9iLauNUh1VHyrcpnG828u9s7D3s0GZZwM5kImS8SPrO
	 NMydKagzfHkvB5sBqfl/HKXo90viU9gbLfgUh5C2AHcovu1J1L6EfNiQ6BALtKEHekj/q
	 T1SSc6+/TDEZLVZjok6y4yZXlxam9A/yFCt6TdhSxPwNItOfTlr0KSAhgxAGT7dcWXRJQ
	 Cx4LEuFc6LnOH9PRc0BPVEWltowOm2xdwJWTdrYuGoUfidEa+/NTuPQDWCCS72c0gWL5M
	 p38MATia7U3ZF8/6O8adDfF2zicVVHJm4C/HdnrTjyelbkceAo+lYu06tgq+Y87v3mg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761685;
	bh=mqNBpwDPP2nz/4tpJ/LgrDYThxH+UEcIhc2vOVD2dAM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fkU31oWNZ2JJVUcGOraa9Aza1CdLIutAzL6xQjDdwPBwe9UinA0jJpd743HaI6ise
	 T/mC0nh/ZPtQscSreVMUOCxSmjX4d9Hq3KEKhKqcptsDQJpv5j4hyJca+1RZ8wifFi
	 ClC/mvqg34LBg1uaB1TMfFeUDpu5Wbj3svzZfdn3ycTJp8h2AabkPv53eoMJ6uHbKs
	 fTaSCUsC+5faurgxHz+A/xvmme0FcqWFE2fkuKgMrim4FewYlTdbFl3GFfUrXQowFt
	 25sitmqh0Dn8zDQ/UI9t6BTgkoSbnEQPLVBpvsg2b5873sRX2Ml7dcyH7Ay5Y19o32
	 wKPVzyVEHswEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00A77409A4;
	Fri, 23 Oct 2026 13:21:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E08383C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2329401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHB7QN8AJwem for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 94F8B400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761681;
 b=AAmZMUiRPWwisRrycsYbFyInPMeMF7xi33j45uMEfgLme5kutwOhhdbUNpm2q/jzX5QY
 DVe2U0ATcGKOv08x9LFp67V01ZlbS8V/l7/AzqjN+HxWkouCKWmkUVEodaAM4f2DorHvT
 Qo8uQJcCJLKnJYB3gmEkTWgJdPBamRnWpPrxg+pa6SkPmaOZi6PbNL2YktjXNn48EV/sH
 5yetI8VxbAv7eU4EWzikworhsdMdRy+MtiYkYDt6dXuPshPi72Oz5ejiRK6SeqhVEIjqH
 Y+iBZ5bXu1w29q7hr6xg4dPWTMfKCusNgYzctPBn6d5izJ4coOUQcmZqmGs3QltLLQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761681;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=bpOxDDrKNXta/Vov6mKrNXy6hFiGsWwoFZ69LbAX0gY=;
 b=U9oUjGUa9KxrTtfBIceRxipUV8SVd95/5hTZ1j+cWsf4oWP0eMHQqPgr6CvkkLM7MB2N
 gQwvxc7l8p9xXJ9JLfD7qOLN8DEPUdTjUQFRCpRtp/+W+955iaSMP2ahoUuAfpI6VIwti
 JDccOTcwHVO8mmvjCP3H9kdtg91DYzY1cO3yPFqjqNOHdRlsgcraEY1/Qfgafz/xTu1Zi
 m+ZAMi7BNVLt1zy4NRp21lhvEeqraiJPzUoTe/IWuphCf8L8CYNqM5yX/WrAAPdVNHb9H
 joR/7D7KK4WkgZl2bK3Ry8J9x3ZhCJAi32HYJcIJA6ryOvv7wWn7ST3YTRofsaFXGKQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OyxSqBee; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94F8B400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:20 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a1df146015so6291865e9.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761678; x=1793366478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bpOxDDrKNXta/Vov6mKrNXy6hFiGsWwoFZ69LbAX0gY=;
 b=UsCiBaMwuGnQ08a1OYlQJrZbEwR97GaJ+3uE2AmWvRQ24mhMd73EatvdNleZ5YohGZ
 T3bV+EujXOBQ+ss874PCwIWj2tYmQjtOAOmpIt7rI72r9Gj0QjgTa51Z3AGRlt3Yff5L
 PvUIt/209FvVjzHVSEoVJQDL7CoztxLJV+JrhPJYZ2FoBafLe5qbHI3vTlMYq5TgxOCc
 X/wubj2Jp3qETeynZs93gcp65ol63jr6hx6F/v1/KpIEmbrgXUHNVzX92kaPBeF5xCD7
 8JvW/tHIU6GsS8TA5rZ4+UlAcm6r7B/FLLbSEp5v/mwK2gsO88uFmUag8I36pGKtR6ya
 MN1A==
X-Gm-Message-State: AFq9FYKQzyVTRv4lIc2NVDigFysOzJsMP2mpeeYypfNcDa4lg3NWqsn8
 UiI9vVTVJ7UFQnDMltQ4zxFjjfy2sFqxysGFeElMB4HvAIOt/VqGaXN429lR/XGeSej67DmQuY2
 +bhq5iic=
X-Gm-Gg: AYBFou2THzzi7UkuVpHIPwMZAWuj8j2KVnCv8VQ55OeR07RbDkk0kwxzP8OgBelPT3g
 CQRWGwUa3rDm5LBg4/BXSwrplsbYU7I2M+HaooJnFx3CFXeS0hpCv7CN1b1DAhTqbBWLbw9QQMZ
 4Br2RaQaQboxpueHRHN9+tfePTAR0rvU0szX5Ng1THs3inRFpnVa5yQdyE6pxUVNBfe8ibKjV/B
 AaKuR+3NyW2Yu3OMqLtHyJSRgRnUYNSoPdefkbO5RoopqSMich6itPUdzzhw4k8j+Cy1CyreLa1
 pvnc7FWEOQ0mD8BGeZcUSe/F3E4+VGQ7e52ur49mGed+2gFnQ4C3yfZ74mV4KtN0q3rKC0TxmxR
 lIXHgr64dv4cmolos2F0SxW/FhHxtNIYzm55sdzzW+2xG+gOcWgwdTrNl35i/dn4ePiTG1gMlVJ
 UzLaKK9p6XastZyGbhMNfbbXoLL58bujGb+nW7lH6USbGyaFMkc2qFaNTXenb1FM0rGZY+t24cV
 mAkEFPhCv1+ATCwYCrik2qbAVMD11y312MkuUQFYV9gRx3ijxalSnTdeQ==
X-Received: by 2002:a05:600c:e556:20b0:4a1:faa1:3813 with SMTP id
 5b1f17b1804b1-4a211cd5cf8mr24251135e9.27.1792761678034; 
 Fri, 23 Oct 2026 06:21:18 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e38060522sm5293469f8f.51.2026.10.23.06.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:17 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:21:14 +0200
Message-ID: <20261023132116.1607775-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020064409.179420-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/3] package/python-scipy: fix
 build with cython >=3.1.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Since Cython version 3.1.0 [1] and buildroot commit [2] python-scipy
> failed to build. This has been fixed upstream with [3].
> 
> This commit backports it to fix the build with the cython present in
> 2025.02.x.
> 
> [1] https://github.com/cython/cython/commit/ed7e95912b6ed7d20e190fbf1aecb9f2a997d479
> [2] b536caaec0 package/python-cython: bump to version 3.1.2
> [3] https://github.com/scipy/scipy/commit/217748476403a1e5726a921cedb674e7ffbc952e
> 
> Fixes: b536caaec0 package/python-cython: bump to version 3.1.2
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...e-int-instead-of-long-in-cython-code.patch | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/python-scipy/0002-use-int-instead-of-long-in-cython-code.patch
> 
> diff --git a/package/python-scipy/0002-use-int-instead-of-long-in-cython-code.patch b/package/python-scipy/0002-use-int-instead-of-long-in-cython-code.patch
> new file mode 100644
> index 0000000000..6763c8cc5e
> --- /dev/null
> +++ b/package/python-scipy/0002-use-int-instead-of-long-in-cython-code.patch
> @@ -0,0 +1,37 @@
> +From 217748476403a1e5726a921cedb674e7ffbc952e Mon Sep 17 00:00:00 2001
> +From: Thomas A Caswell <tcaswell@gmail.com>
> +Date: Thu, 21 Dec 2023 14:20:52 -0500
> +Subject: [PATCH] MNT: use int instead of long in cython code (#19725)
> +
> +https://github.com/cython/cython/pull/5830 /
> +d7e95912b6ed7d20e190fbf1aecb9f2a997d479 in cython removed
> +long as a valid type in favor of int.
> +
> +Upstream: https://github.com/scipy/scipy/commit/217748476403a1e5726a921cedb674e7ffbc952e
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + scipy/_lib/_ccallback_c.pyx | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/scipy/_lib/_ccallback_c.pyx b/scipy/_lib/_ccallback_c.pyx
> +index 59ba74369267..6c493dac7c9c 100644
> +--- a/scipy/_lib/_ccallback_c.pyx
> ++++ b/scipy/_lib/_ccallback_c.pyx
> +@@ -58,7 +58,7 @@ def get_raw_capsule(func_obj, name_obj, context_obj):
> +     elif context_obj is None:
> +         context = NULL
> +     else:
> +-        context = PyLong_AsVoidPtr(long(context_obj))
> ++        context = PyLong_AsVoidPtr(int(context_obj))
> + 
> +     if PyCapsule_CheckExact(func_obj):
> +         capsule_name = PyCapsule_GetName(func_obj)
> +@@ -70,7 +70,7 @@ def get_raw_capsule(func_obj, name_obj, context_obj):
> +         if name == NULL:
> +             name = capsule_name
> +     else:
> +-        func = PyLong_AsVoidPtr(long(func_obj))
> ++        func = PyLong_AsVoidPtr(int(func_obj))
> + 
> +     if name == NULL:
> +         name_copy = name
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
