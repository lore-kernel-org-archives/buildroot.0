Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7069A60A2600
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nQ4iATOY
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E3B681461;
	Fri, 20 Nov 2026 10:00:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UJySEYKKHrW; Fri, 20 Nov 2026 10:00:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 616378135D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168850;
	b=WTSuMTQGG7MFFqv6cpycLWGY28F7ExNSwbF68gOKXMc494FLzZ4LqY9/I86XGc4GSYrQ
	 etnP3JSuxrSx3T9LNW/DDP6VctLUuS9RiwEnmYeRQnfD3/4Lo8YANakVndUc2vCLMHO7M
	 srAJvB5xyOeCnfzFHKvj0ScENGMwbCe0s0e2/X9HG3NvLwAE2T2k2xI2GOOVR3XQrVs4H
	 nKQlO5T8RIc6AmfR4cQiF2v6JFQP9uZzgVogIRbUF3vlNerYWjMLlWSxgNicsCb/T02mD
	 l+evuzJkUgXiGEEOezBHmkDVcW080uC6JbSDzBNxLJVhb/FYe2Fig48xk/xysJGusgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eMHE+HVqQCzJ0xXrxwOHc6NKohVFK/Dl9RHYuSF6Obw=;
	b=jbGRS1VArzFIPeQhDjFFDzmi9Ph897Ml59kf8nZZsZPhKJdT3bvwa6AzinQ7Wh0ZHdwT
	 PPQL7rDPHfVFnDrd8EfZPU7bExzXXX0Dc8WK69GI2NccBZVCkkhrzLYVZ+3nQ1HWy21xU
	 ir0kl89uH3SDexS3TdDSzlH58C4RbmDGoA5fKKyvxW53ByAd6ZKylLjbOudQpzBKXs00m
	 9whoaWaGPEY6C304LGPBmwOtSM82b96an3N362q+oRHoz2CD1PAwVc3HbaJ2NIkirOPoq
	 F8g6fOL8SKTOyX8FCqlR/igrl0EPlCVpGRXZ719RE6AzYL6EScoNZHSUe7/fxuFnm7A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168850;
	bh=eMHE+HVqQCzJ0xXrxwOHc6NKohVFK/Dl9RHYuSF6Obw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nQ4iATOY3+RtMUx9Hk3o5VD7JVni4JDcRcdFJYehTWwIf4Q5298yEu9CJUfPgwKHu
	 w/2yRVxDWIPBo0yIGU+81DM289U5ja2Iy22Ua865xf8/zjYX5HpF65S1q6CRzJwq8T
	 F2XcMaYC9BKpIxJRWVprZQ6l58qhIM8FrwwHrWvhSlW6ewWBJc/QZY7xR2455SFbpv
	 6lEtlWdxCX/BLCaRtG6yPCGdFNnsACAAFBuMXpgTguaEuiBWvDaFgGZbxVrojG1Zb0
	 rNNX1RDWjiPjm+820tfZPT2CkWGsBIG8ksvFYSrmgInuR/ZQ/Wjjsg1vJcsEWULgfA
	 s9pTf2c2LnwfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 616378135D;
	Fri, 20 Nov 2026 10:00:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 93182E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9047260E56
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dz8YP8zgbAGT for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:00:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7827160E4E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7827160E4E
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:48 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-49412eb1474so374409f8f.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168846; x=1795773646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zN87HHLXDTKUZ/FEnJgZkyBqFKm/HrNP3fr4Hk5oJSk=;
 b=0pQmRN0FIkPBZSJetLAr2clROAn9IHh7qJw4nZZlgI3UH2hCTtvGeReXoPJSthagcp
 5+Bys7Qj1gdbyq15b73GnHtVRu8nBQP64Ua7YIgoLNot6F17VYAJHp9cTqe7OBBr/hEh
 Zd7SRqoHOW5xclL0FYq0GZWnpo3vKdD0SmhAr6Cs5gHMIOPYgBlRkOnUCE0ALOtS6HhD
 fL9J9sy2I6Af3EFxFKiVMIcMXEZ5c/KmEX/J5HcUPJq69kKGpTqgcqtwFtVtdHhcdXsh
 BeNSPC4iBl2p8CLquw8/pJxBcYnHptFp49rlZtmr6iDvk0V5+8mimzTXzDqnCxm8wlkJ
 QZOQ==
X-Gm-Message-State: APuU4Z8/4IwnQ1uaTWROP1IcZHgIajrF3/0MtbmY4Kzlvt0bLh9stelF
 d3QmEs6vo8q9njJztmHueD5qDoO7DL3UUUKb7bcxAoTG3BhoIsDvCeqvdION6X1QpaSh3a7wgZP
 kQFlKz/v62Q==
X-Gm-Gg: AZFdTZfL9hbhV5gpJnv5sz4V/QmEm0SglWhuJu3dYxmZJQlVevrJlYmIW9KCeqgtom1
 Qu29ADSUmhYxaSBPODFaD0AcY0IZ7+7HxyKti/zmWeazPcu63N0yGds9w1xn7ffwx0wkJKtM0Ia
 OFP78QvY6Cr6BLixC1HLqTQxfFRZtT+XnnqheY6jvK2i5kUtQkHKHodFwVB4147tXWybJTv5RCJ
 tktDomF5WN1p3XEutrzSgiZ3/q16wrO/NUwjmIhGSTo+kwziUMKOatnn39d0VuNwv7JVAd/GxuC
 PcId0J0bJrSBQibLY4YbSO9Ob4YkAIZDBhrA8WXPWOER9RwqBhUqc+o/7/G47kO7Bvm7cvL96+2
 pN7GOKG6IB+hxUR0Muv/PXDWHn7LyOuKJ3eorOLeFWsk1QzIcout0g8sEBFLuCgt+rXB4pwhRhU
 OKDBEW3QA5I8lPguevAauQtYWs/Wu81iK5CwMQGa+twcLIi/zG7FpUE4PVG9uM/xPbGKZb2f1uy
 p94R3RYOVi968+nJ3WupYjpNbewYQ/MC6vQFXB70Jr2P6aAN9m7Eb3VdJOBKxEFAeKeIPFl0GX2
 2UvuPUhxO269c19poATtvHB5by/EV+Kyrxli04VROMvu
X-Received: by 2002:a05:6000:220c:b0:49a:9499:7909 with SMTP id
 ffacd0b85a97d-4abb560e39amr4832584f8f.35.1795168846365; 
 Fri, 20 Nov 2026 02:00:46 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf685asm4342896f8f.20.2026.11.20.02.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:00:46 -0800 (PST)
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:00:41 +0100
Message-ID: <20261120100045.542229-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114222155.1450949-1-ju.o@free.fr>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] support/testing/infra/emulator.py:
 globally disable colors
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
> Buildroot commit [1] disabled colors of the Python interpreter (which
> introduced automatic coloring in version 3.14). Those colors were
> introducing Python test failures.
> 
> It appears that more an more programs, not only Python, are following
> this trend to enable colors when programs are running interactively
> on a terminal.
> 
> Disabling those colors by setting the NO_COLOR environment variable
> is becoming common. See [2].
> 
> This commit sets the NO_COLOR=1 environment variable to globally
> request to disable color in all runtime tests.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/3a6e2b4a0395f6e049cd847cf16406a4d0d998ad
> [2] https://no-color.org/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  support/testing/infra/emulator.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
> index d690949120..4171ddfe3b 100644
> --- a/support/testing/infra/emulator.py
> +++ b/support/testing/infra/emulator.py
> @@ -160,6 +160,7 @@ class Emulator(object):
>  
>      def connect_shell(self):
>          extra_init_cmd = " && ".join([
> +            'export NO_COLOR=1',
>              'export PAGER=cat',
>              'dmesg -n 1',
>              # Prevent the shell from wrapping the commands at 80 columns.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
