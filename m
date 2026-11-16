Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CBB606A323
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=blDfzgNl
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11ED60818;
	Mon, 16 Nov 2026 15:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ft7_zT1J4p6; Mon, 16 Nov 2026 15:39:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 798E86081C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843571;
	b=KLlm9yzj+YsF5yz2belYbjxL8l2zW6CG2+naRITgMhHplX2Du7GlwJOy/zTo8gzgRTu3
	 m0VSO6xcRo1AuJj1g3vqxD8sD8axGyd+LXqveU1pdg7T3MGvcVsiKec4xf23xGO0NQ+qX
	 hokX9iGGBFl5nvO6DfHfs8wxBpN1yVQ6JBIlBE9oZtlcY0VJr1Vm01iUajsuvBL3EmoY/
	 GW2jDlkrBzyd2JNnowgbd7K1TlPvV3H5V6tmakCQcbe1GE0x9tIyjtydAVaAipMNYwjTw
	 TA1K+7dfusy2oj23t3MbuTSiBIXqjeeneNWApWMHjy5hth3ED14QlCGAhGW835CZkCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843571;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MwovCbB1sFevhj5mZ/L/b7/WDwVyvdbsvOlwrPW5a1Q=;
	b=EYLw59xRNjymb5JrHldUXLaVuCsOhgPPMpJsY2WK8AIdSYDNSmAgO2dF3xCDiM8hla2h
	 OzjDSUL8IQPkYwwZTC9KBC3oCU0yhtpkcP86Mm4gyIFZ9O6+jd7mtcMo52fRJ6r/3gKSS
	 T5sgAihgxrAufadE0BLJgCq0th6y/I76bd/M2DPJLCJwug93L2wK7152kBPue/cFfGgYt
	 HKb/KKkZYEtuNMT8JAqHz7n+DhO1PXYbV4YnSftB7p3SEA+qUAv7y3/aMjByJKmVqmRrv
	 JpmP8TQ9dey5mJl9lA+L+YLmA/pqNMWWdo7YsNUrlHJT4iJwYuVcjTws7lT1ga/6oVQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843571;
	bh=MwovCbB1sFevhj5mZ/L/b7/WDwVyvdbsvOlwrPW5a1Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=blDfzgNlgBERulibtJP/vKXemuLGDewgEMzk2qNnzxwObm9KeX/8KbZgh2zSZ4zPA
	 ymQClnNfIns3aF0WB4KcKeDQgUWHZ3SFkMQwdCRKuqltgaqNO6+KHiulJ4t0hHyKBt
	 inUEYJ9gq1+ltf2+Ujddji2AMSV3sr1EPFQttbCiRNRNfR8lkBBFanLptuwa8/YNm5
	 fMI/QG29kOliIbnSs/kz86YqSaKU6R1MsS8gSYtwedYtY4GEjyeIFY4h2izWzHhtUw
	 kBS4QZ490lyDZuCb0jrBNW6QmU7mPyyRRCk3Axrwk1uKPsWUUOyELNYxgeeZUsfST7
	 MTIQQ06bvh5Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 798E86081C;
	Mon, 16 Nov 2026 15:39:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 916E32FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F716402B0
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBPJFmamQi-Y for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:39:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org AFB644009E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFB644009E
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:39:27 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so1794931f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:39:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843565; x=1795448365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rj4gaHcsbI7GowyG52NyOP1pZBjgPrzvwcYoGWzNNIQ=;
 b=W59o3pAQM+jWjAni3jlZPRd/bgSPuyTSMjSkcQ4SQpp/XsGw3xDXMm7q3U08f89NtS
 i+Lqrb6xcRbn6+Y8rhdu8/6ix4LSvgR+R7X+0t7AFzFGsEWgA/YOJHYmqj1HEHoXZSDI
 t10JWKruvZWx4xf1tb75YkrQdkPthvLbeEfz95e8NJMgvZjphjgo932zAOGGQ8G+JyAA
 WRn81bOWdNOTtLqC8ftkDasdsXVKY3shgwNzYd/BQ9Yvwc7Ze4P9/3SZ7OgqMpXzNZ/w
 sD+Z8Xtq47q8+Jr40IezLxVWDdaG8h5oJCgW0LIEGJG261KiEhj2DDwJIkGiVB+JdkeI
 hBUA==
X-Gm-Message-State: APuU4Z+oEifMSUbx5nzRhLOC4W4foadEyAiPKSG1WcpuQNMrMbqMnV2a
 Ag3yXNmWlx9as/83omSIsbbkapqraqlSxfF5y+AQ1uq7PbLEwV2rSjC2XOVWS338Og5MbbyTakm
 NOgXj0dA=
X-Gm-Gg: AZFdTZcPLOqsDw6Eu+3JjK1wCmdoSL8DTiEy18Im6xGeNXtxdKnmfRCmdjwtCvXf/lF
 UeJfQnknQ5RZ5wlyifalZ9yp8wX0CIrfgG3iOAy0fkQTnsmQ334+XFKNKk76oK4gQK8P2s2mjKv
 R9Suse9ZAAaNffNxFcY9TMc4qILSQd7uRoL1AuLjgxhXYVbDxcx1G85+pHsDz0oxmbOzz6q+Ixa
 GvFuR+83Skqxa3vprSideB4Gn1ytQWQgEzn5AQ+kJgWm+6Kbpw0Qz1pSxX3oXipnZNDK/E/UmHm
 w0d0VrbCoLmDQhLQDafiypvjpHQRlxa9hMK1lP22YJ4OzfNwJcY4HJZ9751C0ANOqO9xfVnaBf1
 fPbtqCDh1M+JB0PsgG3WBpcWA1amL1ltwwTE34r/ALBkle0LuYqyVGpyGIzkdQPrgPqFQQEg27y
 xXjmFAVyVSMffnCI6USkFjjikThr5vSxX93kHqO7vObc/uOk9gG53/9gXJBQBY/z2zdDAGEUavH
 h2IvdFOKSX2PqoJtpQWjXlvS32nashb0S8QtQ3SqUCrHiv+JHF8rXRGUutKYJFK9pXSNJpr7n+N
 3M4k8fDFncey7hB6IlRegbRD3SS8J3U=
X-Received: by 2002:a5d:6f19:0:b0:4a2:dae8:ca5e with SMTP id
 ffacd0b85a97d-4a2dae8cc3bmr2053536f8f.36.1794843565659; 
 Mon, 16 Nov 2026 07:39:25 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c60f8d66esm21010785f8f.57.2026.11.16.07.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:39:25 -0800 (PST)
To: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:39:22 +0100
Message-ID: <20261116153924.725386-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102091303.2148013-1-angelo.compagnucci@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Angelo Compagnucci for qt6
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
> I already maintain the qt5coap, qt5knx and qt5mqtt modules, and I'm
> going to follow their Qt6 counterparts and the qt6 package as well.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1b9dd41f01..d6ed6b2b1a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -255,6 +255,7 @@ F:	package/qpdf/
>  F:	package/qt5/qt5coap/
>  F:	package/qt5/qt5knx/
>  F:	package/qt5/qt5mqtt/
> +F:	package/qt6/
>  F:	package/rtl8723ds/
>  F:	package/rtl8723ds-bt/
>  F:	package/sam-ba/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
