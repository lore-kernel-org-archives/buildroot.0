Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD3A606A334
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a9Jt/0Tu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D36860A63;
	Fri,  6 Nov 2026 16:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOnWc7ECJM0n; Fri,  6 Nov 2026 16:09:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C0E460A50
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981375;
	b=PxFtpKq+VNHWo6+/2n/TZSxfo/Wjm9BIeFlUbIk2OJ8EkoY6FW4dNIK1LVySrKR3wKdz
	 KAzXMxiRKmiPGB4+uvEA6nBZPZ+gNDs7gy/RJhI/Fu25IYbuFM66wCwfWvjVNrJe4tDH1
	 Og/TmXWTB3M10ziIO4buGDL4Bk9NqYwvA/KBOUURpQrm7V219T+DI99HwsD7yK0dnOe7N
	 Sw6e7obaGnxeAVrSY+OarxsFTpYnv9eA5TqO2q1AAwfxNyf2gQq3xN9oxb6Bt+bQtE5xY
	 bJ3XTBsgM30b5Hot34s8g9Wfd4lrzqHh2bEoAZRE2qi83GS5cOqBUC45SbzMQoDm10A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981375;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=m9dtqOCBFnhTGOXJuIVWrJaJM/jcfuvoCtiuGoM/nwQ=;
	b=NLynVDkNkTK/RSdyxaepJ3PVFp6jyPfWINNtC7IeRHB0pvktCjhSJ9fOAwM6fifiOl2M
	 42FVW5viJKvvUm8/Z3NuBTdHNQjIOiPEpvpvxzdvBrDJwYZQs0dAW5fpoGsH5sGK4EAek
	 vnmMrusKFSre3407AWmUN5dWzCDoYAhaEyeFEH+XKMsmBJbn9MLEEJtLzIvZ7LnLx4bHb
	 hvgndQjt7q7qpu1wcBqoV/ZUG1YNJ5C1p5bUycSQXvCuwCv8tGhc5u1PuykQSu21jw+Q4
	 nU4QUHueX4AbhRpaDRfb0dPSlUTgFy49qTW46C8CLhp1AKkxoGUpdwGGUgCkIYRYDuQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981375;
	bh=m9dtqOCBFnhTGOXJuIVWrJaJM/jcfuvoCtiuGoM/nwQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a9Jt/0TuLsqiC1plTLus9bcqq0SSv+E0Omtf7phGihMJ/rEkTeBk9JvPD9/l3pn4h
	 sxbDBXgA0sVSfA0Cptl4THd45f63aRY5o39zcNfH6WQNDoh+6qhkfXMOD6gHR2vH8v
	 GeRyORojZGfv1LoTrn1ywlkwUkqELkCjKFPFvCJT613BR1+b2Dgvfkc6oh/3MdlG8m
	 OjuCXdBIygyJVEpPfvCiB3LtHd4RPIykLX6Adwj2uNw0mQmg8gubN+p5a4Avz08V8z
	 IklbTV62kW0xK7VnZK3Prjhyh8VKVBOwwv0cHawIGOkHi9vg/gL34gm8oRGDogPBaC
	 NgK9muo3BLWNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C0E460A50;
	Fri,  6 Nov 2026 16:09:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A81D02E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B2E0608F8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AZkhPvyOcwVu for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CF2B1608F1
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF2B1608F1
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-491846221ffso703284f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981327; x=1794586127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RPWAQGF5e7TyONo94fs6OQRXytUH4n0asj7mUl7QfCU=;
 b=j90Pey+IvXbg5Bcs3MAjsjxW3xdipkeLDyeb/NrsbwkTKHGPlqSFv70oZVIZWjgDR9
 haFzX52HarIK78KlisoF/BGEH3vJdrLnk4x8Y1/gkEu/WbHY/98UcCEhMYJVRkSLn1yG
 K+AQUhesDLx8fv36yyG7dpbrVu0kXcdRCvYL+18EEMO4BEw2c4xmYk/UABf1TJDVzqMA
 j+oelnNPcmsQOxtOKmSynsU8cSIu9lQp5jy57bpJKVjdMqQw3kFA1S1dtI3LKh4kgZ9R
 8x+S31URy8v1D3ZwoiJ7u8aRv/tH2oYOrRkFZol+dK+andd+Tp4t5OCOjLsKu2IGsBPT
 X5bg==
X-Gm-Message-State: APuU4Z8+GxQ6Ifnt7qvLHVmSZeByI12sjCbswpZvk2c5o0GchIB0BsFz
 +NA38PQlv0Kah9OJ/OP/9LNf2wrnVkApLUd8K8rrGJK7o+EmUCsyPAEmTXT/XhGboR76uPR96dB
 ShPfHhx0=
X-Gm-Gg: AYBFou1C4zh8n3trdIhobFg6e+h7dl0COaNz752l1USF2QLvqfvleYaLfLiaUB/vr8C
 UzxY7s1J0d3AHp5lpNN/BU1hqJQL5ioZQPploekEud71ms08c2vJYWtIh0ipN9J5D/g3fBIwJ4w
 Z/J96ZqOT/w+EZFdppjxVK7oU6LCCeos5N70egQR3zJKeRdR9IcAcYJKCshXqqg3rW8pZpShxYP
 xPJSIBez+4ZAWTsUfNt4jS8zK9wY1nb7HN6lvZwIPotLMC98Gxfg05PbBCY3PIjMHGAyc06NZhv
 G8c+KE/uDdAZQ6cPSAGFNbnP/yTGWnp/zCcJVbQ8wdxVxMEfHRjZfjeX9L2YMv638SeTSwEoYIH
 D5aabdeQGkD6FxGYVUlAHN1ZroeRPgyT+8aMAUtLKxcafO0eKvpP7L/itgLfGBshpeJ4ndB19Dw
 8+AFTZMLadfYE+lYUu5Mk1snu/j9RTXxd1la4d76En1eACYMr6AuU7TIwwiXDX3zIInseyZ1lFi
 7xAUY4KKhVpL0+Utx0HuAoUU6gkSIkPYaSv90A3UfNKs1BQ/tFmoJDXb2WzHU7b7sTRjyuoaPGZ
 q+r2QGxfq8181zG5dC3ZHjPZCvROBrE=
X-Received: by 2002:a05:6000:4b17:b0:48e:4561:8a17 with SMTP id
 ffacd0b85a97d-49275fe4f50mr5664178f8f.16.1793981327074; 
 Fri, 06 Nov 2026 08:08:47 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d72335e3sm4406168f8f.31.2026.11.06.08.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:08:46 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:08:38 +0100
Message-ID: <20261106160840.606769-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260913095115.1622920-1-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH RE-RESEND 1/2]
 support/scripts/gen-bootlin-toolchains: fix ARMv7 EABIhf toolchains
 condition
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> The ARMv7 EABIhf toolchains can currently be selected with ARMv8 cores
> selected, even when EABI is used due to how the condition is
> constructed. This obviously fails as those toolchains are EABIhf,
> causing the following build issue:
> 
> Incorrect ABI setting: EABI selected, but toolchain is incompatible
> 
> This is for example what happens with:
> 
> BR2_arm=y
> BR2_cortex_a32=y
> BR2_ARM_EABI=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE=y
> 
> In order to address this, we adjust the script generating the Bootlin
> toolchain package so that EABIhf is required for both ARMv7 and
> ARMv8.
> 
> Please note that we already require BR2_arm for those toolchains, so
> we are *only* talking about ARMv8 cores being used in 32-bit mode.
> 
> This will be needed to fix:
> 
>   https://autobuild.buildroot.org/results/3ce1dbd480c71b782ef722c39034cb039a036523/
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  support/scripts/gen-bootlin-toolchains | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
> index 4579949d18..ee64a86902 100755
> --- a/support/scripts/gen-bootlin-toolchains
> +++ b/support/scripts/gen-bootlin-toolchains
> @@ -53,12 +53,12 @@ arches = {
>          'prefix': 'arm',
>      },
>      'armv7-eabihf': {
> -        'conditions': ['BR2_arm', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
> +        'conditions': ['BR2_arm', 'BR2_ARM_EABIHF', '(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)'],
>          'test_options': ['BR2_arm', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
>          'prefix': 'arm',
>      },
>      'armebv7-eabihf': {
> -        'conditions': ['BR2_armeb', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
> +        'conditions': ['BR2_armeb', 'BR2_ARM_EABIHF', '(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)'],
>          'test_options': ['BR2_armeb', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
>          'prefix': 'armeb',
>      },
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
